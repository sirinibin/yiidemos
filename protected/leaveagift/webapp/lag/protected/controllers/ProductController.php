<?php
require_once(dirname(__FILE__).'/../extensions/facebook/fb-php-sdk/facebook.php');

class ProductController extends AuthController
{
public $layout="main";	

    public function filters()
    {
	Yii::trace('Entering Filters','trace');
        return array(
            'ProductList + setdetails',
            'CustomizeGift + CustomizeGift',
            'SessionLose'
        );
    }

    public function filterSessionLose($filter)
	{
	   $session=new CHttpSession;
           $session->open();
           
          if(!isset($session['me']))
	    { 	
	        $this->redirect(array("auth/logout","token"=>Yii::app()->getRequest()->getCsrfToken()));
	    }
           
	  $filter->run();
	}
    public function filterProductList($filterChain)
    { 
       $session=new CHttpSession;
       $session->open();
       Yii::trace('Entering product chain filters','trace');
       
       $receiverid=$_REQUEST['id'];
      if(!isset($receiverid))
        {
         $this->redirect(array("auth/index"));
        }
       $receiverid=mb_split('_',$receiverid); 
        if(!isset($receiverid[0])||!isset($receiverid[1]))
        {
         $this->redirect(array("auth/index"));
        }
         
          
      $filterChain->run();
    }
   public function filterCustomizeGift($filterChain)
    { 
     $session=new CHttpSession;
       $session->open();
 
      if(!isset($_REQUEST['pid']))
        {
          if(isset($session['userid_birthday']))
           {
            $this->redirect(array("product/index",'id'=>$session['userid_birthday']));
           }
          else
           {
            $this->redirect("auth/index");
           }
        }
 
      $product=Product::model()->with('tags')->findbyPk($_REQUEST['pid']);
      if($product==null)
       {
         if(isset($session['userid_birthday']))
           {
            $this->redirect(array("product/index",'id'=>$session['userid_birthday']));
           }
          else
           {
            $this->redirect("auth/index");
           }
       }
       
       
        /*
       if(strtolower($product->tags[0]->name)=="gift to charity") 
        {
         if($product->quantity==0)
         {
           if(isset($session['userid_birthday']))
           {
            $this->redirect(array("product/index",'id'=>$session['userid_birthday']));
           }
          else
           {
            $this->redirect("auth/index");
           }
         }
        }
        else
        {
        // echo $product->getActiveVoucherCount();
         //exit;
          if($product->getActiveVoucherCount()==0)
	    {
	      if(isset($session['userid_birthday']))
	      {
		$this->redirect(array("product/index",'id'=>$session['userid_birthday']));
	      }
	      else
	      {
		$this->redirect("auth/index");
	      }
	    }
        
        }
        */
        
        
     $filterChain->run();
    }
	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
	
	    Yii::trace('Entering product List code','trace');
	    $session=new CHttpSession;
            $session->open();
                //Yii::beginProfile('1');
                Yii::trace('Setting session values','trace');
                $id=Yii::app()->session['selected-userid'];
		
		//$this->setUserDetailsInSession($_REQUEST['id']);
		
		Yii::trace('Session values set','trace');
		
		Yii::trace('product list query','trace');
				   
		$dataProvider=new CActiveDataProvider('Product', array(
			'criteria'=>array(
			'with'=>array('tags','attachments','supplier','product_lang','images'),
			//'together'=>true,
			'order'=>'position ASC',
			'condition'=>'is_published =1 and is_return_gift=0 and quantity >0',
			),
			    'pagination'=>array(
        				'pageSize'=>50,),

			
		));

		unset($session['img_url']);
		unset($session['message']);
		unset($session['title']);
		Yii::trace('show product list','trace');
		 
		$this->render('gifts',array(
			'dataProvider'=>$dataProvider,
			'id'=>$id,
		//Yii::endProfile('1');
		));


	}
	
    public function actionCustomizeGift($pid)
	{	
	    $session=new CHttpSession;
            $session->open();
	
		//Yii::beginProfile('2'); 
		$session['id_product'] = $pid;
		$product=Product::model()->with('categories')->findByPk($pid);

	$criteria= new CDbCriteria;
	$criteria->condition="id_product=:id_product and receiver_fbid=:receiver_fbid and order_status=:order_status";
	$criteria->params=array(':id_product'=>$pid,':receiver_fbid'=>Yii::app()->session['selected-userid'],':order_status'=>'SUCCESS');		
	$orderTime = UserOrder::model()->count($criteria);

	$criteria_Sender= new CDbCriteria;
	$criteria_Sender->condition="id_product=:id_product and id_user=:id_user and order_status=:order_status";
	$criteria_Sender->params=array(':id_product'=>$pid,':id_user'=>Yii::app()->session['logged-userid'],':order_status'=>'SUCCESS');		
	$orderSender = UserOrder::model()->count($criteria_Sender);
	
	if(($orderTime>=$product->receiver_limit) or ($orderSender>=$product->sender_limit))
	{
		$this->redirect(array('auth/index'));
	}
		
		//$product=Product::model()->with('categories')->findByPk($pid);
		
		 $id_category =  $product->categories[0]->id_category;
		
		//associated data for category
		$category = Category::model()->with('category_lang')->findByPk($id_category);
		
               
               if(isset($_REQUEST['order_id']))
		 {
		  $order=UserOrder::model()->findByPk($_REQUEST['order_id']);
		  
		  if(isset($order->img_url))
      		   {
      		   $session['img_url']=$order->img_url;
      		   }
	      if(($orderTime>=$product->receiver_limit) or ($orderSender>=$product->sender_limit))
		  {
			  $this->redirect(array('auth/index'));
		  }
      		  $session['message']=isset($session['message'])?$session['message']:$order->message_card;
      		  
      		  $session['title']=isset($session['title'])?$session['title']:$order->title;
      		  $session['name']=isset($session['name'])?$session['name']:$order->receiver_fbfirstname;
      		  Yii::app()->session["selected-userid"]=$order->receiver_fbid;
      		  Yii::app()->session["selected-username"]=$order->receiver_fbfirstname;
      		  /*
      		  $session['message']=$order->message_card;
		  $session['title'] = $order->title;
		  $session['name'] = $order->greeting;
		  */
		   
      		 }  
      		 else
      		 {
      		  //$session['message']=isset($session['message'])?$session['message']:$category->category_lang->description;
      		  $session['title']=isset($session['title'])?$session['title']:$category->category_lang->name;
      		  $session['name']=isset($session['name'])?$session['name']:$session['selected-username'];
      		  
      		   /*
      		   $session['message']=$category->category_lang->description;
		   $session['title'] = $category->category_lang->name;
		   $session['name'] = $session['selected-username'];
      		  */
      		 
      		 }
   

		
		if($product===null)
		{
			$this->redirect(array('auth/index'));
		}
				
		//fetch associated data from tables to render view
		
		//Yii::trace(var_dump($category));
		
		//set default session variables. If edited the values are updated in respective forms
		
		    
		
		//unset(Yii::app()->session['img_url']);
		
		if(isset($order))
		 {  
		  /* Incomplete order */ 
		   $this->render("customizegift",array('product'=>$product,'category'=>$category,'order'=>$order));
		 }
		 else
		 {
		   $this->render("customizegift",array('product'=>$product,'category'=>$category));
		 
		 }
		 //Yii::endProfile('2');
/*		}
	else
		{
		echo "you cannot send this gift. Select any other gift";
		exit;
*/
		
	}
	
	public function createCustomizedGiftEntries($order_id=null)
	{
	    $session=new CHttpSession;
            $session->open();
            
	    //    echo "user".Yii::app()->session['user'];
		
                $user=$session['user'];
	
	        //echo $user->id_user;
                //exit;
		
		//create a lag-user-order entry
		  $modelUserOrder = new UserOrder;
		 if($order_id==null)
		 {
		  $modelUserOrder->id_product = $session['id_product'];
		  $modelUserOrder->id_user =Yii::app()->session['logged-userid'];
		  $modelUserOrder->receiver_fbid = $session['selected-userid'];
		  $modelUserOrder->receiver_fbfirstname = $session['selected-username'];
		  
		  $modelUserOrder->date_add=date('Y-m-d H:i:s',time());
		  $modelUserOrder->date_upd=date('Y-m-d H:i:s',time());
		   
		  
                 }
                 else
                 {
                  $modelUserOrder=UserOrder::model()->findByPk($order_id);
                  $modelUserOrder->date_upd=date('Y-m-d H:i:s',time());
                 }
		
		
		//customized data
		
		  if(isset($session['message']))
		   {
		    $message_card=$session['message'];
		   }
		  else
		  {
		  
		    $message_card= "Dear ".Yii::app()->session['selected-username']."<br />";
                    $message_card.=$modelUserOrder->product->categories[0]->category_lang->description;
	     
	            $message_card.=" <br />
	              Love,<br />".$session['me']['first_name'];
 
                     
		  }
		
		 
		 
		$modelUserOrder->img_url = $session['img_url'];
		$modelUserOrder->message_card = $message_card;
		$modelUserOrder->title = $session['title'];
		
		
		
		//using it for user name ?
		$modelUserOrder->greeting = $session['name'];

	
		$modelUserOrder->save(false);
		
		/* echo "message:".$session['message'];
		echo "<pre>";
		print_r($modelUserOrder->attributes);
		echo "</pre>";
		exit; */ 
	        Yii::app()->session['id_userorder'] = $modelUserOrder->id_user_gift;
		$session['id_userorder'] = $modelUserOrder->id_user_gift;	
			
               
		
	}
	
	public function actionSendGift()
	{
	     $session=new CHttpSession;
             $session->open();
		//create entries and save data
		if(isset($_REQUEST['order_id']))
		 {
		   /*Incomplete order*/
		   $this->createCustomizedGiftEntries($_REQUEST['order_id']);
	         }
	         else
	         {
	           $this->createCustomizedGiftEntries();
	         
	         }
	         
	         unset($session['img_url']);
	         unset($session['message']);
	         unset($session['title']);
	         unset($session['name']);
		//render next view
		$this->redirect(array('SendGift/SendGift'));
	}
	
	





	//TODO - move this to a helper class		
	public function setUserDetailsInSession($id)
	{
	  $session=new CHttpSession;
          $session->open();
          $session['userid_birthday']=$id;
           
                $id=mb_split('_',$id); 
                $birth_date=$id[1];
                $name=$id[2];
                $id=$id[0];
               
               // print_r($str);
               //exit;  
		// Yii::import('ext.facebook.fb-php-sdk.*');
		//initialize the facebook object
		/*
		$facebook = new Facebook(array(
  		'appId'  => Yii::app()->params["facebook_appId"],
  		'secret' => Yii::app()->params["facebook_appSecret"],
                //'cookie' => false,
		));
		//$facebook->setExtendedAccessToken(); 
		$user_info = $facebook->api($id); //  call api() 

                if(!isset($user_info['birthday']))
                 {
                   $user_info['birthday']=$birth_date;
                 }
                  $date=substr($user_info['birthday'],3,2);
                  $month=substr($user_info['birthday'],0,2);
                 // $year=substr($user_info['birthday'],6,4);
                  /*if(!isset($year))
                   $user_info['birthday']=$year."-".$month."-".$date;
                  else
                   $user_info['birthday']=$month."-".$date;*/
                   
                   //$user_info['birthday']=date('Y-',time()).$month."-".$date;
                  
                 // echo "bday:".$user_info['birthday'];
                 //exit;
                $session['selected-userid'] = $id;
	        $session['selected-username'] = $name;
                $session['selected-userbirthday']=date('d-m',strtotime($birth_date)); 
                 
		Yii::app()->session['selected-userid'] = $id;
		Yii::app()->session['selected-username'] = $name;
                Yii::app()->session['selected-userbirthday']=date('d-m',strtotime($birth_date));
		//Yii::app()->session['selected-useremail'] = $user_info['email'];
	}
	
	public function actionSetdetails()
	{
	$id=$_REQUEST['id'];
	$session=new CHttpSession;
          $session->open();
          $session['userid_birthday']=$id;
           
                $id=mb_split('_',$id); 
                $birth_date=$id[1];
           
                $name=$id[2];
                $id=$id[0];
                
                $date=substr($birth_date,3,2);
                $month=substr($birth_date,0,2);
               /* $year=substr($birth_date,6,4);
                  
                  if(!isset($year))
                   $birth_date=$year."-".$month."-".$date;
                  else
                   $birth_date=$month."-".$date;
                   */
                   $birth_date=date('Y-',time()).$month."-".$date;
                
                
                $session['selected-userid'] = $id;
	        $session['selected-username'] = $name;
                $session['selected-userbirthday']=date('d-m',strtotime($birth_date)); 
                 
		Yii::app()->session['selected-userid'] = $id;
		Yii::app()->session['selected-username'] = $name;
                Yii::app()->session['selected-userbirthday']=date('d-m',strtotime($birth_date));
                $this->redirect(array('product/index'));
                
	}
}

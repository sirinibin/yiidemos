<?php
require_once(dirname(__FILE__).'/../extensions/facebook/fb-php-sdk/facebook.php');

class LoadController extends CController
{
    public $layout='main';
/*
    public function filters()
    {
        return array(
            'ProductList + index',
            'CustomizeGift + CustomizeGift',
        );
    }

    public function filterProductList($filterChain)
    { 
       
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
        $facebook = new Facebook(array(
  		'appId'  => Yii::app()->params["facebook_appId"],
  		'secret' => Yii::app()->params["facebook_appSecret"],
                //'cookie' => false,
		));
		$facebook->setExtendedAccessToken(); 
             try{
		 $user_info = $facebook->api($receiverid[0]); //  call api() 
                }
              catch(Exception $e)
                {
                  $this->redirect(array("auth/index"));
                }

          
      $filterChain->run();
    }
*/
  public function filterCustomizeGift($filterChain)
    { 
     /*  $pid=$_REQUEST['pid'];
      if(!isset($pid))
        {
          echo "err"
         //$this->redirect(array("auth/index"));
        }
        */
     $filterChain->run();
    }
	/**
	 * Lists all models.
	 */
	public function actionIndex($id)
	{
                Yii::beginProfile('1');
		$i=1;
		
		//for($i=1;$i=$i+1;$i<5)
		//{
		
		$this->setUserDetailsInSession($_REQUEST['id']);
				   
		$dataProvider=new CActiveDataProvider('Product', array(
			'criteria'=>array(
			'with'=>array('tags','attachments','supplier','product_lang','features','featurevalues','images'),
			//'together'=>true,
			'order'=>'position ASC',
			'condition'=>'is_published =1 and is_return_gift=0 and quantity >0',
			),
			    'pagination'=>array(
        				'pageSize'=>50,),

			
		));
		
		//echo $i."</br>";
		 
		$this->render('gifts',array(
			'dataProvider'=>$dataProvider,
			'id'=>$id,
		//
		));

		//}
		Yii::endProfile('1');

	}
	
    public function actionCustomizeGift($pid)
	{	
		
		Yii::trace("action customize");
		//Yii::beginProfile('2'); 
		Yii::app()->session['id_product'] = $pid;
		$product=Product::model()->with('categories')->findByPk($pid);

// user and sender limitation start//
/*
		if(UserOrder::model()->count("id_product=:id_product and id_user=:id_user", array('id_user'=>Yii::app()->session['logged-userid'] ,'id_product'=>$_REQUEST['pid'])) == $product->sender_limit)
			{
				$this->redirect(array('auth/index'));
				
			}

		if(UserOrder::model()->count("id_product=:id_product and receiver_fbid=:receiver_fbid", array('receiver_fbid'=>Yii::app()->session['selected-userid'] ,'id_product'=>$_REQUEST['pid'])) == $product->receiver_limit)
			{
				$this->redirect(array('auth/index'));				
				
			}
*/

// user and sender limitation ends//

		$product=Product::model()->with('categories')->findByPk($pid);
		
		if($product===null)
		{
			$this->redirect('index');
		}
				
		//fetch associated data from tables to render view
		$id_category =  $product->categories[0]->id_category;
		
		//associated data for category
		$category = Category::model()->with('category_lang')->findByPk($id_category);
		//Yii::trace(var_dump($category));
		
		//set default session variables. If edited the values are updated in respective forms
		Yii::app()->session['message_card'] = $category->category_lang->description ;
		Yii::app()->session['title'] = $category->category_lang->name;
		Yii::app()->session['name'] = Yii::app()->session['selected-username'];
		unset(Yii::app()->session['img_url']);
		
		$this->render("customizegift",array('product'=>$product,'category'=>$category));
		//Yii::endProfile('2');
/*		}
	else
		{
		echo "you cannot send this gift. Select any other gift";
		exit;
*/
		
	}
	
	public function createCustomizedGiftEntries()
	{
		//get logged in user from session - this is user id in table
                //echo "id:".Yii::app()->session['logged-userid'];
                //exit;
		
                $user=Yii::app()->session['user'];
		
		//TODO - db transactions - check if model save honors this
		//$transaction=$connection->beginTransaction();
		//create a ps_cart entry
		
		try
		{
			
		
		
			
			//create a lag-user-order entry
			$modelUserOrder = new UserOrder;
		
			$modelUserOrder->id_product = Yii::app()->session['id_product'];
			$modelUserOrder->id_user =Yii::app()->session['logged-userid'];
			$modelUserOrder->receiver_fbid = Yii::app()->session['selected-userid'];
			$modelUserOrder->receiver_fbfirstname = Yii::app()->session['selected-username'];
			
			//customized data
			$modelUserOrder->img_url = Yii::app()->session['img_url'];
			$modelUserOrder->message_card = Yii::app()->session['message_card'];
			$modelUserOrder->title = Yii::app()->session['title'];
			
			Yii::trace(Yii::app()->session['title']);
			
			//using it for user name ?
			$modelUserOrder->greeting = Yii::app()->session['name'];
		
			
			//$modelUserOrder->id_user = $id;
			$modelUserOrder->id_product = Yii::app()->session['id_product'] ;
		
			if($modelUserOrder->save(false))
			{
                           
				Yii::app()->session['id_userorder'] = $modelUserOrder->id_user_gift;
				Yii::trace("created lag_user_entry".$modelUserOrder->id_user_gift);
				//$transaction->commit();
			}
                       
		}
		Catch(Exception $e)
		{
			//$transaction->rollback();
			Yii::trace("failed to create cart entry - ".$e);

		}
		
	}
	
	public function actionSendGift()
	{
		//create entries and save data
		$this->createCustomizedGiftEntries();
		
		//render next view
		$this->redirect(array('SendGift/SendGift','pid'=>Yii::app()->session['id_product']));
	}
	
	
	//TODO - move this to a helper class		
	public function setUserDetailsInSession($id)
	{
                $id=mb_split('_',$id); 
                $birth_date=$id[1];
                $id=$id[0];
               
               // print_r($str);
               //exit;  
		// Yii::import('ext.facebook.fb-php-sdk.*');
		//initialize the facebook object
		$facebook = new Facebook(array(
  		'appId'  => Yii::app()->params["facebook_appId"],
  		'secret' => Yii::app()->params["facebook_appSecret"],
                //'cookie' => false,
		));
		$facebook->setExtendedAccessToken(); 
		$user_info = $facebook->api($id); //  call api() 

                if(!isset($user_info['birthday']))
                 {
                   $user_info['birthday']=$birth_date;
                 }
                  $date=substr($user_info['birthday'],3,2);
                  $month=substr($user_info['birthday'],0,2);
                  $year=substr($user_info['birthday'],6,4);
                  $user_info['birthday']=$year."-".$month."-".$date;

                 //echo "bday:".$user_info['birthday'];
                 //exit;
		Yii::app()->session['selected-userid'] = $id;
		Yii::app()->session['selected-username'] = $user_info['first_name'];
                Yii::app()->session['selected-userbirthday']=date('d-m',strtotime($user_info['birthday']));
		//Yii::app()->session['selected-useremail'] = $user_info['email'];
	}
}

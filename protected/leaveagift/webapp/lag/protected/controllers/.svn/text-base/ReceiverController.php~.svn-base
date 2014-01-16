<?php
/* Receiver Controller */
require_once(dirname(__FILE__).'/../extensions/facebook/fb-php-sdk/facebook.php');

class ReceiverController extends CController
{

 public $layout="receiver";

 public function filters()
    {
        return array(
            'permission + seeGift',
            //'users + giftloading,opengift,giftreturn',
            'Gift + GiftLoading,OpenGift,UseGift,GiftReturn',
            'Spectator + Spectator',
            'SessionLose - seeGift'
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
 public function filterGift($filter)
 {
   $session=new CHttpSession;
   $session->open();
     
   if(!isset($_REQUEST['id_user_gift']))
     {

        $this->redirect(array("auth/index"));
     }
   if(empty($_REQUEST['id_user_gift']))
     {
        $this->redirect(array("auth/index"));
     }
     
    $order=UserOrder::model()->findbyPk($_REQUEST['id_user_gift']); 
    if($order==null)
    { 
      $this->redirect(array("auth/index"));
    
    }
    
    if(!$order->isUserReceiver())
     {
  
       $this->redirect(array("receiver/Spectator",'id_user_gift'=>$order->id_user_gift));
     
     }
    

     
  $filter->run();

 }
 public function filterSpectator($filter)
 {
  
   if(!isset($_REQUEST['id_user_gift']))
     {
        $this->redirect(array("auth/index"));
     }
   if(empty($_REQUEST['id_user_gift']))
     {
        $this->redirect(array("auth/index"));
     }
     
    $order=UserOrder::model()->findbyPk($_REQUEST['id_user_gift']); 
    if($order==null)
    {
      $this->redirect(array("auth/index"));
    
    }
     
  $filter->run();

 }
 
 public function filterPermission($filterChain)
{
 header('P3P: CP="HONK"');
   Yii::import('ext.facebook.identities.*');
 
 $session=new CHttpSession;
 $session->open();

      if(!isset($_REQUEST['gid']))
       {
  
          $this->redirect(array("auth/index"));
       }

       if(empty($_REQUEST['gid']))
       {
          $this->redirect(array("auth/index"));
       } 
         
      $order=UserOrder::model()->findbyPk($_REQUEST['gid']); 
      if($order==null)
      {
       
	$this->redirect(array("auth/index"));
       
      }
       
        //echo "ok";
        
          if(isset($session['me'])&&!Yii::app()->user->isGuest)    
           {
            $filterChain->run();
           }
          //  exit;
          /*
            try{
                //echo "wait";
               //  exit;
               
                 $identity=new CFBUserIdentity();
			if($identity->authenticate())
			{
				Yii::app()->user->login($identity);
				
		        }
		        else
		        {
		         //echo "cool";
		         //exit;
		          $this->redirect(array("receiver/askPermission",array('gid'=>$_REQUEST['gid'])));
		          //$this->redirect(array("auth/logout","token"=>Yii::app()->getRequest()->getCsrfToken()));
		        
		        }
            
                 //$session['me']=$facebook->api("/me");
               }
              catch(Exception $e)
               { 
                 $this->redirect(array("receiver/askPermission",array('gid'=>$_REQUEST['gid'])));
                 return;
               }
               
            */
  $filterChain->run();
}


 public function actionAskPermission()
        {
         $session=new CHttpSession;
         $session->open(); 
         $facebook = new Facebook(array(
            'appId'  => Yii::app()->params['facebook_appId'],
            'secret' => Yii::app()->params['facebook_appSecret'],
            'cookie' => true,
               )); 
             

       if(!isset($_REQUEST[0]['gid']))
       {
          $this->redirect(array("auth/index"));
       }

         $params=array(
                        'scope' => Yii::app()->params['facebook_scope'],
                        'redirect_uri' => Yii::app()->createAbsoluteUrl('receiver/seeGift',array('gid'=>$_REQUEST[0]['gid']))
                      );
         $auth_url=$facebook->getLoginUrl($params);

         echo("<script> top.location.href='" . $auth_url . "'</script>");
             

        }


 public function actionGift()
 {

   $this->render("receivergift",array('id_user_gift'=>$_REQUEST['id_user_gift']));
 }
 
 public function isUserReceiver($id_user_gift)
 {
   $session=new CHttpSession;
   $session->open(); 
   $order = UserOrder::model()->findbyPk($id_user_gift);
     
   if($order->receiver_fbid==$session['me']['id'])
    {
       return(true);
    }
    else
    {
       return(false);
    }    
  
 }
 public function actionSeeGift()
 { 
   //echo "See gift";
   //exit;
   $session=new CHttpSession;
   $session->open();
      
  // Yii::import('ext.facebook.identities.*');

                       $model=User::model()->findByAttributes(array('facebook_userid'=>$session['me']['id']));
			
			    if($model == null)
			    { 
				    $model = new User();
				    
				    if ($user_info) {
				    
				    
						    $model->attributes = array(
						    'facebook_userid' => $user_info['id'],	
						    'facebook_oauthid'  => $identity->access_token,
						    'facebook_email' => $user_info['email'],
						    'name' => $user_info['name'],
						    'date_add' => date('Y-m-d H:i:s',time()),
						    'date_upd' => date('Y-m-d H:i:s',time()),
						    
						    );
					    
						    $model->save(false);			
				    
				    }
			    }
                       
		     
                           
				//Set user info in session
				Yii::app()->session['logged-userid'] = $model->id_user;
                           
                                $session['logged-userid']=$model->id_user;
                                $session['logged-email']=$model->facebook_email; 
                                $session['user']=$model; 
				 $model->addAddress();
			 
				 
				 
				 
	
		      $order=UserOrder::model()->with('product')->findbyPk($_REQUEST['gid']);
		      
		  	
				
                    if($order->isUserReceiver())
                     {
           
                             $this->redirect(array("receiver/gift",'id_user_gift'=>$_REQUEST['gid']));   

                     } 
                    else
                     {
                  
                            $this->redirect(array("receiver/spectator",'id_user_gift'=>$_REQUEST['gid']));
 
                     }


 }

 public function actionGiftLoading()
 {
  //echo "Inside gift loading";
  //exit;
  $this->render("giftloading",array('id_user_gift'=>$_REQUEST['id_user_gift']));

 }
 public function actionOpenGift()
 { 
  $this->render("opengift",array('id_user_gift'=>$_REQUEST['id_user_gift']));

 }
 public function actionGiftReturn()
 {
   $session=new CHttpSession;
   $session->open();
   
    $order=UserOrder::model()->with('product')->findbyPk($_REQUEST['id_user_gift']);

     if(!empty($order->thankyouid))
      {
        $this->redirect(array('receiver/usegift','id_user_gift'=>$order->id_user_gift));
      }
    
    
    $model=new GiftReturnForm;

   $model->message=$order->sender->name.', thank you so much for your gift.  It was a great surprise.  Can\'t wait to use it !';

    // uncomment the following code to enable ajax-based validation
    /*
    if(isset($_POST['ajax']) && $_POST['ajax']==='gift-return-form-return_gift_form-form')
    {
        echo CActiveForm::validate($model);
        Yii::app()->end();
    }
    */

    if(isset($_POST['GiftReturnForm']))
    {
        $model->attributes=$_POST['GiftReturnForm'];
         /*
         echo "<pre>";
         print_r($model->attributes);
	  echo "</pre>";
	  echo "pid:".$model->gifts[0];
         */
        if($model->validate())
        {          
                          date_default_timezone_set('UTC');
                     if(is_array($model->gifts))
                        {
                          $user=$session['user'];
                         // $user=User::model()->findByAttributes(array('facebook_userid'=>$session['me']['id']));
                          
                        // echo "pid:".$model->gifts[0];
                         //exit; 
 
           	          $modelUserOrder =new  UserOrder;
			   $modelUserOrder->id_product=$model->gifts[0];
                          $modelUserOrder->id_user=$user->id_user; 
                          $modelUserOrder->receiver_fbid=$order->sender->facebook_userid;     
                          $modelUserOrder->receiver_fbfirstname=$order->sender->name;
                          $modelUserOrder->receiver_fbemail=$order->sender->facebook_email;

                          $modelUserOrder->notify_email = $session['me']['email'];

                          $modelUserOrder->order_status="SUCCESS";
                          $modelUserOrder->message_post=$model->message;
                          $modelUserOrder->message_card=$model->message;
                          $modelUserOrder->title='Thank you '.$modelUserOrder->receiver_fbfirstname.'.';  
                          $modelUserOrder->greeting=$modelUserOrder->receiver_fbfirstname;
                          $modelUserOrder->thankyouid=$order->id_user_gift;
                          $modelUserOrder->date_add=date('Y-m-d');
                          $modelUserOrder->date_upd=date('Y-m-d');  
              	
		          $delivery_date = date('Y-m-d');
							
		       	  $modelUserOrder->delivery_date = $delivery_date ;
                          $modelUserOrder->save(false);

                          //echo "app id:".Yii::app()->params['facebook_appId'];
                          //exit;
                         try{
                             $this->postToFacebook($modelUserOrder->id_user_gift);
                            }
                          catch(Exception $e)
                           {
                             echo "<pre>";
                             print_r($e);
                             echo "</pre>"; 
                             exit;
                           
                           }
		          $this->sendMail($modelUserOrder->id_user_gift);

		
			
			}//only if gifts > 0 
                    
                       $this->redirect(array('receiver/usegift','id_user_gift'=>$_REQUEST['id_user_gift']));
           
            // form inputs are valid, do something here
           // return;
        }
    }


  $this->render("giftreturn",array('id_user_gift'=>$_REQUEST['id_user_gift'],'order'=>$order,'model'=>$model));
 }
 
 public function actionSpectator()
  {
   $order=UserOrder::model()->with('product')->findbyPk($_REQUEST['id_user_gift']);
   $this->render("spectator",array('id_user_gift'=>$_REQUEST['id_user_gift'],'order'=>$order,'product'=>$order->product));

  }
  
 public function actionUseGift()
  {
   
    $order=UserOrder::model()->with('product')->findbyPk($_REQUEST['id_user_gift']);
    $product=$order->product;
    //$voucher=Voucher::model()->findbyPk($order->id_product);
 
     $model=new UseGiftForm;

    // uncomment the following code to enable ajax-based validation
    /*
    if(isset($_POST['ajax']) && $_POST['ajax']==='use-gift-form-usegift_form-form')
    {
        echo CActiveForm::validate($model);
        Yii::app()->end();
    }
    */
   $model->is_verified=false;
   
    if(isset($_POST['UseGiftForm']))
    {
        $model->attributes=$_POST['UseGiftForm'];
        if($model->validate())
        { 
        
          $model->is_verified=true;
		/* if(!empty($product->redirection_url))
		 $url=$product->redirection_url;
		else
		 $url=$product->template->redirection_url;
		 
		Yii:app()->redirect($url);
                */  	
		
		
        }
    }     

         //-- add voucher start---//

		$voucherOrderCheck = VoucherOrder::model()->findbypk($_REQUEST['id_user_gift']);

		if($voucherOrderCheck== null)
			{
				$criteria= new CDbCriteria;
				$criteria->condition="id_product=:id_product and status=:status";
				$criteria->limit="1";
				$criteria->params=array(':id_product'=>$order->id_product,':status'=>'1');		
		 		$voucherCode = Voucher::model()->find($criteria);

				if($voucherCode!= null)
					{

						$VoucherOrder=new VoucherOrder;
						$VoucherOrder->id_voucher=$voucherCode->id;
						$VoucherOrder->id_order=$_REQUEST['id_user_gift'];
						$VoucherOrder->validity=$voucherCode->validity;
						$VoucherOrder->save(false);
						
						$command_voucher = Yii::app()->db->createCommand();
						$command_voucher->update('lag_vouchers', array(
							'status'=>'2',
							),
							'id=:id',array(
							':id'=>$voucherCode->id
								)
				                        );
					}
			}
		     else
			{
			
			$voucherCode = Voucher::model()->findbypk($voucherOrderCheck->id_voucher);
			}
		

		
		$voucherCodevalue=$voucherCode->voucher_code;
		
	
     
	//--add voucher ends--//

   $this->render('usegift',array('id_user_gift'=>$_REQUEST['id_user_gift'],'order'=>$order,'product'=>$product,'model'=>$model,'voucherCode'=>$voucherCodevalue)); 
   //$this->renderPartial('usegift_form',array('model'=>$model)); 
   //echo "ok";
 }
 private function sendMail($id_user_gift) 
 {
    $commandPath = Yii::app()->getBasePath() . DIRECTORY_SEPARATOR . 'commands';
    $runner = new CConsoleCommandRunner();
    $runner->addCommands($commandPath);
    $commandPath = Yii::getFrameworkPath() . DIRECTORY_SEPARATOR . 'cli' . DIRECTORY_SEPARATOR . 'commands';
    $runner->addCommands($commandPath);
    $args = array('yiic', 'sendmail', '--type=instant', '--id='.$id_user_gift);
	ob_start();
    $runner->run($args);
    echo htmlentities(ob_get_clean(), null, Yii::app()->charset);
}
/*
private function postToFacebook($id_user_gift) 
 {
    $commandPath = Yii::app()->getBasePath() . DIRECTORY_SEPARATOR . 'commands';
    $runner = new CConsoleCommandRunner();
    $runner->addCommands($commandPath);
    $commandPath = Yii::getFrameworkPath() . DIRECTORY_SEPARATOR . 'cli' . DmandPath);IRECTORY_SEPARATOR . 'commands';
    $runner->addCommands($com
    $args = array('yiic', 'postfacebook', '--id='.$id_user_gift);
	ob_start();
    $runner->run($args);
    echo htmlentities(ob_get_clean(), null, Yii::app()->charset);
}*/
private function postToFacebook($id_user_gift) 
 { 
    $session=new CHttpSession;
    $session->open();
   
    $commandPath = Yii::app()->getBasePath() . DIRECTORY_SEPARATOR . 'commands';
    $runner = new CConsoleCommandRunner();
    $runner->addCommands($commandPath);
    $commandPath = Yii::getFrameworkPath() . DIRECTORY_SEPARATOR . 'cli' . DIRECTORY_SEPARATOR . 'commands';
    $runner->addCommands($commandPath);
    $args = array('yiic', 'postfacebook', '--id='.$id_user_gift);
	ob_start();
    $runner->run($args);
    echo htmlentities(ob_get_clean(), null, Yii::app()->charset);
}



 public function actions()
	{
		return array(
			// captcha action renders the CAPTCHA image displayed on the contact page
			'captcha'=>array(
				'class'=>'CCaptchaAction',
				'backColor'=>0xFFFFFF,
			),
			// page action renders "static" pages stored under 'protected/views/site/pages'
			// They can be accessed via: index.php?r=site/page&view=FileName
			'page'=>array(
				'class'=>'CViewAction',
			),
		);
	}

}


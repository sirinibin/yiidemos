<?php
require_once(dirname(__FILE__).'/../../../extensions/facebook/fb-php-sdk/facebook.php');

class DefaultController extends CController
{
 public $breadcrumbs; 
   public function filters()
    {
        return array(
               'permission + index',
               'users + gift,giftloading,opengift,giftreturn,spectator',
        );
    }
 
 public function filterPermission($filterChain)
       {
         header('P3P: CP="HONK"');
         $session=new CHttpSession;
         $session->open();
         $facebook = new Facebook(array(
            'appId'  => Yii::app()->params['facebook_appId'],
            'secret' => Yii::app()->params['facebook_appSecret'],
            'cookie' => true,
            //'oauth' => true,   
               ));
      
          

           
            try{
                 $session['me']=$facebook->api("/me");
                 $criteria=new CDbCriteria;
                 $criteria->condition="facebook_userid=:facebook_userid";
                 $criteria->params=array(':facebook_userid'=>$session['me']['id']);
                 $user=User::model()->find($criteria);
                 if($user==null)
                  {
                  // $this->redirect("default/logout");
                  // $this->redirect(array("default/logout",'token'=>Yii::app()->getRequest()->getCsrfToken()));
                    $this->redirect(Yii::app()->createAbsoluteUrl("auth/index"));
                  }
                 if($user->is_admin==0)
                  {
                   // $logoutUrl = $facebook->getLogoutUrl();
                   // echo $logoutUrl;
                   // exit;
                     $this->redirect(Yii::app()->createAbsoluteUrl("auth/index"));
                   //$this->redirect(array("default/logout",'token'=>Yii::app()->getRequest()->getCsrfToken()));
                  }
               }
              catch(Exception $e)
               { 
                 $this->redirect(array("default/askPermission"));
               }
            
     $filterChain->run();
      }
  public function filterUsers($filter)
 {
   if(Yii::app()->user->isGuest)
		{
                  
                  //echo "guest";
                  //exit;
			//TODO - define home url and redirect to home url - $this->redirect(Yii::app()->homeUrl);
			//$this->redirect(array("receiver/receiverLogin"));
                        $this->redirect(array("auth/login"));
		}

  $filter->run();

 }


 public function actionAskPermission()
        {
         $session=new CHttpSession;
         $session->open(); 
         $facebook = new Facebook(array(
            'appId'  => Yii::app()->params['facebook_appId'],
            'secret' => Yii::app()->params['facebook_appSecret'],
            'cookie' => false,
               )); 
             

         $params=array(
                        'scope' => Yii::app()->params['facebook_scope'],
                        'redirect_uri' => Yii::app()->createAbsoluteUrl('admin/default/index')
                      );
         $auth_url=$facebook->getLoginUrl($params);

         echo("<script> top.location.href='" . $auth_url . "'</script>");
             

        }
 

	public function actionIndex()
	{
         $this->layout='main';
            
           Yii::import('application.extensions.facebook.identities.*');
   
   	   $identity=new CFBUserIdentity();
			if($identity->authenticate())
			{
			   Yii::app()->user->login($identity);
                        }
                       else
                         {
                            $this->redirect(array('auth/login'));
                         }
              
            
      			
           $this->redirect(array('userOrder/index'));		 
	}

        public function actionLogout($token)
	{
            $facebook = new Facebook(array(
            'appId'  => Yii::app()->params['facebook_appId'],
            'secret' => Yii::app()->params['facebook_appSecret'],
            'cookie' => true,
            //'oauth' => true,   
               ));
		Yii::trace("logout action");
		//http://www.yiiframework.com/wiki/190/logout-csrf-protection/
		if ($token !== Yii::app()->getRequest()->getCsrfToken())
		{
        	throw new CHttpException(400, Yii::t('app', 'Invalid request. Please do not repeat this request again.'));
                }
    	        Yii::app()->user->logout();
                //destroy all session variables
		Yii::app()->session->destroy();
               // echo "logged out";
                //$this->redirect(array("auth/login"));
           

    	       $this->redirect(array("default/askPermission"));
	}
     
}

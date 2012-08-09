<?php

class SiteController extends Controller
{
	/**
	 * Declares class-based actions.
	 */
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

        public function actionFacebooklogin()
       {
       Yii::import('ext.facebook.*');
        $ui = new FacebookUserIdentity(Yii::app()->params['fb_app_id'],Yii::app()->params['fb_app_secret']);
        if ($ui->authenticate()) {
        $user=Yii::app()->user;
        $user->login($ui);
        $this->redirect($user->returnUrl);
    } else {
        throw new CHttpException(401, $ui->error);
    }
       }  
       	public function actionFblogin()
	{
		$this->render('fblogin');
	}  

       /*
        public function actionAskPermission()
        {
         $session=new CHttpSession;
         $session->open(); 
        
         
         $auth_url = "https://www.facebook.com/dialog/oauth?client_id=".Yii::app()->controller->module->app_id. "&redirect_uri=" . urlencode($session['page_link']."?sk=app_".Yii::app()->controller->module->app_id)."&scope=email,user_location";
                  
         echo("<script> top.location.href='" . $auth_url . "'</script>");
             

        }
         */
	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
           //Yii::app()->clientScript->registerCoreScript("jquery");
           header('P3P: CP="HONK"');
           $session=new CHttpSession; //making session object
           $session->open();       
          /* 
           if(isset($_REQUEST['name']))
             { 
              echo "name:".$_REQUEST['name'];
              return;
             }  
           */
            /*
          $facebook = new Facebook(array(
          'appId'  => Yii::app()->params['fb_app_id'],
          'secret' => Yii::app()->params['fb_app_secret'],
           ));
           
           $signedRequest=$facebook->getSignedRequest();
            if($signedRequest)
             {
                print_r($signedRequest);
             }
            else
            {
             echo "No signed request";
            }
              
         //  $me=$facebook->api('/me');
          //  echo "id:".Yii::app()->params['fb_app_id']."|"."secret:".Yii::app()->params['fb_app_secret'];
           
            $userId = $facebook->getUser();
            if($userId!=0)
             {
              $me=$facebook->api('/me');
              $session['me']=$me;                
              print_r($me);
             }
            else
             {
             echo "Not logged in";
             } 
              */
              $userId=0;
                
		// renders the view file 'protected/views/site/index.php'
		// using the default layout 'protected/views/layouts/main.php'
		$this->render('index',array('userId'=>$userId));
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
	    if($error=Yii::app()->errorHandler->error)
	    {
	    	if(Yii::app()->request->isAjaxRequest)
	    		echo $error['message'];
	    	else
	        	$this->render('error', $error);
	    }
	}

	/**
	 * Displays the contact page
	 */
	public function actionContact()
	{
		$model=new ContactForm;
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->validate())
			{
				$headers="From: {$model->email}\r\nReply-To: {$model->email}";
				mail(Yii::app()->params['adminEmail'],$model->subject,$model->body,$headers);
				Yii::app()->user->setFlash('contact','Thank you for contacting us. We will respond to you as soon as possible.');
				$this->refresh();
			}
		}
		$this->render('contact',array('model'=>$model));
	}

	/**
	 * Displays the login page
	 */
	public function actionLogin()
	{
		$model=new LoginForm;

		// if it is ajax validation request
		if(isset($_POST['ajax']) && $_POST['ajax']==='login-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}

		// collect user input data
		if(isset($_POST['LoginForm']))
		{
			$model->attributes=$_POST['LoginForm'];
			// validate user input and redirect to the previous page if valid
			if($model->validate() && $model->login())
				$this->redirect(Yii::app()->user->returnUrl);
		}
		// display the login form
		$this->render('login',array('model'=>$model));
	}

	/**
	 * Logs out the current user and redirect to homepage.
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
                ii::app()->user->setState('FB',NULL);
		$this->redirect(Yii::app()->homeUrl);
	}
}

<?php
require_once(dirname(__FILE__).'/../extensions/facebook/fb-php-sdk/facebook.php');
require_once(dirname(__FILE__).'/BaseController.php');
/**
 * AuthController is the default controller to handle user requests.
 */
class AuthController extends BaseController
{
    
  	public $layout='main';
	
	protected function beforeAction($action)
	{
	   
	   $session=new CHttpSession;
           $session->open();
	
              $facebook = new Facebook(array(
  		'appId'  => Yii::app()->params["facebook_appId"],
  		'secret' => Yii::app()->params["facebook_appSecret"],
                'cookie' => true,
		));
        
         /*
        if(!Yii::app()->user->isGuest)
          {
           if(!isset($session['me']))
	    { 	
	  
	        $this->redirect(array("auth/logout","token"=>Yii::app()->getRequest()->getCsrfToken()));
	     
	    }
	  }  
	  */
	
	
		foreach (Yii::app()->log->routes as $route)
		{
			
			if(isset(Yii::app()->session['logged-userid']))
			{ 

				 if(User::model()->findByPk(Yii::app()->session['logged-userid'])->is_admin=='0')
				{
					$route->enabled = false;
				}
			}
			else
			{
				$route->enabled = false;
			}
		
		}
		

	return true;
	}
	public function filters()
	{
	    return array(
		'https', 
		'Guest + index',
		'SessionLose - login,logout'
		
	    );
	}
	
	public function filterGuest($filter)
	{
	  if(Yii::app()->user->isGuest)
           {
             $this->redirect(array("auth/login"));
           }
     
	  $filter->run();
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
	
	public function actions()
	{
           $this->layout="receiver";
	    return array(
		'page'=>array(
		    'class'=>'CViewAction',
		),
	    );
	}
	

	public function actionFaqs()
	{
	   $this->layout="receiver";
	    
	   $this->render('faqs');
	}	
	public function actionIndex()
	{
	    $session=new CHttpSession;
            $session->open();
	         unset($session['img_url']);
	         unset($session['message']);
	         unset($session['title']);
	         unset($session['name']);		
	    
	    $this->render('index');
	
	}
	
	public function actionLogin()
	{
           $session=new CHttpSession;
           $session->open();
          Yii::import('ext.facebook.identities.*');
          $this->layout="home"; 
          
 
		Yii::trace("login action");
		if(!Yii::app()->user->isGuest)
		{
			  
		      	  $Checkuser=User::model()->FindByPk(Yii::app()->session['logged-userid']);
		      	  
			  if($Checkuser->facebook_oauthid== null)
			  {
				  Yii::app()->user->logout();

				  Yii::app()->session->destroy();
				  $session->destroy();
				  $this->redirect(array("auth/logout","token"=>Yii::app()->getRequest()->getCsrfToken()));
			  }
			  else
			  {

				$this->redirect(array("auth/index"));
			
			  }
			
			
		}
		else
		{

                  
			$identity=new CFBUserIdentity();
			

			if($identity->authenticate())
			{

				Yii::app()->user->login($identity);
			

			
			$facebook = new Facebook(array(
			'appId'  => Yii::app()->params["facebook_appId"],
			'secret' => Yii::app()->params["facebook_appSecret"],
			'cookie' => true,
			));
			
			$facebook->setExtendedAccessToken();
			$access_token = $facebook->getExtendedAccessToken();
			Yii::trace($access_token);
				

			$user_info = $identity->user_info;
                        Yii::app()->session['me']=$user_info;
                        $session['me']=$user_info;
                        $model=User::model()->findByAttributes(array('facebook_userid'=>$user_info['id']));
			
			if($model == null)
			{

				$model = new User();
				
				if ($user_info) {                      
			
					      
						$model->attributes = array(
						'facebook_userid' => $user_info['id'],
						//access token from facebook
						'facebook_oauthid'  => $access_token,
						//user info
						'facebook_email' => $user_info['email'],
						'name' => $user_info['name'],
						
						'date_add' => date('Y-m-d H:i:s',time()),
						//'date_upd' => date('Y-m-d H:i:s',time()),
						
		
						);
					
						$model->save(false);
					
				}
				
			}
			

				Yii::trace("updating token");
				

				Yii::app()->session['access_token'] = $access_token;
				$session['access_token']=$access_token;
				
				if($access_token != null)
				{
				  $model->facebook_oauthid = $access_token;
				 }
				$model->last_login=date('Y-m-d H:i:s');
				$model->save(false);


                                $session['logged-userid']=$model->id_user;
                                $session['logged-email']=$model->facebook_email; 
                                $session['user']=$model;    

				Yii::app()->session['logged-userid'] = $model->id_user;
				Yii::app()->session['logged-email'] = $model->facebook_email;   
                               Yii::app()->session['user']=$model; 
                               $model->addAddress();

				  if($model->is_blocked=='1')
				    {
				        	Yii::app()->user->logout();

						Yii::app()->session->destroy();
						$session->destroy();
				     }
				$this->redirect(array("auth/index"));
			} 
			else
			{
				$this->render('login');
			}
		}
		
	}
        
	public function actionPhpinfo()
    {
          $this->render("phpinfo");
  
    }
	
	public function actionLogout($token)
	{
	   $session=new CHttpSession;
           $session->open();
		Yii::trace("logout action");
		//http://www.yiiframework.com/wiki/190/logout-csrf-protection/
		if ($token !== Yii::app()->getRequest()->getCsrfToken())
		{
		 // $this->redirect(array("auth/login"));
		  throw new CHttpException(400, Yii::t('app', 'Invalid request. Please do not repeat this request again.'));
        	
		}
    	        Yii::app()->user->logout();
       //destroy all session variables
		Yii::app()->session->destroy();
		$session->destroy();
        
    	   $this->redirect(array("auth/login"));
	}
	
	public function actionSearch()
	{
	  $session=new CHttpSession;
           $session->open();
	  //  print_r($_REQUEST['FriendSearch']['search_term']);
	 //  return;
	  
	    if(isset($_REQUEST['FriendSearch']['search_term']))
	    {
	     
	      $facebook = new Facebook(array(
		    'appId'  => Yii::app()->params["facebook_appId"],
		    'secret' => Yii::app()->params["facebook_appSecret"],
		    'cookie' => true,
		    ));

	      $search_term=strtolower($_REQUEST['FriendSearch']['search_term']);	
              
	      $data = $facebook->api( array(
			    'method' => 'fql.query',
			    'query' => " SELECT uid,first_name,name,pic,birthday_date FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1=".$session['me']['id'].") AND strpos(lower(name),'".$search_term."') >=0",
			));
			
	      echo CJSON::encode($data);		 
	       		    
	     /*  		    
	      foreach($data as $d)
	       {
	         echo '<div class="fb-friend-frame">
	                <div class="fb-friend-photo" id="'.$d['uid'].'" onmouseover="renderphoto(\''.$d['uid'].'\')" >
	                  <img width="140" height="140" border="0" src="'.$d['pic'].'"></img>
	                </div>
	                
	                <div class="fb-friend-name">
	                 '.$d['name'].'
	                </div>
	               </div>';
	         
	       }*/
	      /*echo "<pre>";		
	      print_r($data);
	      echo "</pre>";*/
		
	        // $this->render('search',array('data'=>$data,));	     

	    }
	   
	
	}
	public function actionSetsession()
	{
		$session=new CHttpSession;
		$session->open();
		
		if(isset($_REQUEST['id']))
		{
		//echo "we are here";
		
		  $id=$_REQUEST['id'];
		  
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
                
                
               // return true;
                }
                
               // echo "i m here".$_REQUEST['id'];
                
                return true;
	      
	}
	
	public function actionDeauthorize()
	{
		Yii::trace("Deauthorize App");
		//delete entry from user table and make customer inactive.
		//parse signed request and get user id
		if(isset($_REQUEST['signed_request']))
		{    
			$data=$this->parse_signed_request($_REQUEST['signed_request'],Yii::app()->params["facebook_appSecret"]);
			//Yii::trace(var_dump($data));
 		}
		
		$s=serialize($data);
		file_put_contents('signed_request',$s);
		if(file_exists('signed_request'))
		{
			$s=file_get_contents('signed_request');
			$data=unserialize($s);
 
			//echo "<pre>";
			//print_r($data);
			//echo "</pre>";
		}
  
		$id_user = $data['user_id'];
		//Yii::trace($id_user);
		$modelUser = User::model()->findByAttributes(array('facebook_userid'=>$id_user));
		//Yii::trace(var_dump($modelUser));
		$id_customer = $modelUser->id_customer;
		$modelCustomer = Customer::model()->findByPK($id_customer);
		//Yii::trace(var_dump($modelCustomer));
		
		//set customer inactive
		$modelCustomer->active = '0';
						
					
		try
		{
		  $modelCustomer->save(false);
		  //Yii::trace("saved");
		}
		catch(Exception $e)
		{
			//Yii::trace($e);
		}
		
	}
	
	function parse_signed_request($signed_request, $secret) 
	{
		list($encoded_sig, $payload) = explode('.', $signed_request, 2); 
 
		// decode the data
		$sig = $this->base64_url_decode($encoded_sig);
		$data = json_decode($this->base64_url_decode($payload), true);
 
		if (strtoupper($data['algorithm']) !== 'HMAC-SHA256') {
		//error_log(‘Unknown algorithm. Expected HMAC-SHA256’);
		return null;
		}
 
		// check sig
		$expected_sig = hash_hmac('sha256', $payload, $secret, $raw = true);
		if ($sig !== $expected_sig) {
			//error_log(‘Bad Signed JSON signature!’);
		return null;
		}
  
		return $data;
	}
 
	function base64_url_decode($input)
	{
		return base64_decode(strtr($input, '-_', '+/'));
	}

	protected function beforeRender($view)
		{
		    $return = parent::beforeRender($view);
		    Yii::app()->googleAnalytics->render();
		    return $return;
		}
	
	public function actionError()
		{
		  
		    if($error=Yii::app()->errorHandler->error)
			$this->render('error', $error);
		}
        public function actionLagError()
        {
         $this->layout="receiver";
         $message=null;
          if(isset($_REQUEST['message']))
           {
            $message=$_REQUEST['message'];
           }
          $error=null;
           
           if($error=Yii::app()->errorHandler->error||isset($_REQUEST['message']))
           $this->render("lagerror",array('message'=>$message,'error'=>$error));
        }
       public function actionNotfound()
        {     
         $this->layout="receiver";
          $this->render("notfound");
        }
        
}

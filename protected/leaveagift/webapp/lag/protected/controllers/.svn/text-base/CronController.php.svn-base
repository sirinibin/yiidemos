<?php
require_once(dirname(__FILE__).'/../extensions/facebook/fb-php-sdk/facebook.php');
require_once(dirname(__FILE__).'/BaseController.php');
require_once(dirname(__FILE__).'/AuthController.php');

class CronController extends CController {
    
	
	
	public function actionAll()
	{	
				

		$criteria=new CDbCriteria;
		date_default_timezone_set('UTC');
		$today = date('Y-m-d H:i:s');
		echo $today."<br>".$_SERVER['REMOTE_ADDR']."<br>";
		$null='null';
        	$criteria->condition="order_status = 'SUCCESS' and delivery_date <='".$today."'";
		$criteria->order = 'id_user_gift DESC';

		
 	       
        	$modelUserOrder=UserOrder::model()->findAll($criteria);


		//var_dump($modelUserOrder);
			foreach($modelUserOrder as $UserOrder) 
			{

				if(isset($UserOrder->sender))
				{

				    if($UserOrder->sender->facebook_oauthid == '')
				      {
				      echo "No Auth Id hence nothing send"; 
				      }
				    else
				      {
					    if($UserOrder->facebook_postid == null)
						{

						
						    $this->Postemail($UserOrder->id_user_gift);
						    echo "mail send".$UserOrder->id_user_gift."</br>";
						    
						    $this->Postfb($UserOrder->id_user_gift);
						    echo "fb send".$UserOrder->id_user_gift."</br>";
					      
					      }

					      Yii::trace("Post sent for id_user_gift = ".$UserOrder->id_user_gift);
					      }
					}
				}
			
						
			}

	}

		

	
	//Post a specific message from userorder table
	public function Postfb($id_user_gift)
	{
		//echo $id_user_gift."</br>";
		$modelUserOrder = UserOrder::model()->findbyPk($id_user_gift);
		$id_sender = $modelUserOrder->id_user;
		$sender = User::model()->findbyPk($id_sender);
		
		$id_fb_sender = $sender->facebook_userid;
		$access_token_sender = $sender->facebook_oauthid;
		
		$id_fb_receiver = $modelUserOrder->receiver_fbid;
		$message = $modelUserOrder->message_post;
		
		//get receiver
		//initialize the facebook object
		$facebook = new Facebook(array(
  		'appId'  => Yii::app()->params["facebook_appId"],
  		'secret' => Yii::app()->params["facebook_appSecret"],
		));
		$facebook->setAccessToken($access_token_sender);
		echo "we are here";
		try
		{
			//get Receiver's name
			$receiver_info = $facebook->api($id_fb_receiver); 
			$name = 'See '.$receiver_info['first_name'].'\'s gift'; 
                        $gift_url= Yii::app()->createAbsoluteUrl('receiver/seeGift',array('gid'=>$id_user_gift));
			$link =  $gift_url; 
			$thumbnail = 'https://s3-ap-southeast-1.amazonaws.com/lagdev/mail/logo.jpg';
			$description = 'Surprise a friend with a real free or paid gift. Next time you leave a post for a 
							friend why not LeaveAGift and leave some happiness.';
			
			$action_name = 'See '.$receiver_info['first_name'].'\'s gift';
			

			$action_link =  $gift_url; //gift url

			
			
			$ret_obj = $facebook->api('/'.$id_fb_receiver.'/feed', 'POST',
                                    array(
									  'method'=> 'stream.publish',
									  'link' => $action_link, //gift url
									  //'status_type' => 'app_created_story', 
									  //'from' => array('name' => 'Start Learning', 'link' => 'http://www.example.com'),
									  //'caption' => $caption ,
									  'name' => 'Happiness! You\'ve received a real gift.',
									  'message'=> $message,
									  'picture' => $thumbnail,
									  'description' => $description,
									  //'actions' =>  array('name' => $name, 'link' => $action_link)
	                            ));
			//echo '<pre>Post ID: ' . $ret_obj['id'] . '</pre>';
		
			//update table that entry is posted
			//bit field in database
			//post - 0x01, delievery email - 0x02,notification -0x04
			if($ret_obj['id'])
			{
				//save post id also
				$modelUserOrder->facebook_postid = $ret_obj['id'];
				$modelUserOrder->post_email_status = '111';
				$modelUserOrder->save(false);
				Yii::trace("Updating database for successful post");
				echo "done </br>";
			}
			
		}
		catch(FacebookApiException $e)
		{
			//may be an oauth exception 
			echo "not done </br>";
			return 0;

		}
		return 1;

	}

	private function Postemail($id_user_gift)
	{
		Yii::trace("Running email delivery for ".$id_user_gift);
		$modelUserOrder = UserOrder::model()->findbyPk($id_user_gift);
				
		//get sender's and receiver's details
		$id_sender = $modelUserOrder->id_user;
		$sender = User::model()->findbyPk($id_sender);
		
		$email_sender = $sender->facebook_email;
		$email_receiver = $modelUserOrder->receiver_fbemail;
		$name_sender= $sender->name;
		
		
		if(empty($email_receiver))
		{
			Yii::trace("no mail to recevier ".$id_user_gift);
			//no mail notification to receiver
			$modelUserOrder->post_email_status = ord($modelUserOrder->post_email_status) | 0x02;
			$modelUserOrder->save(false);
			
			return;
		}
		
		$subject = "Happiness! ".$name_sender." has given you a gift card (Birthday gift).";
		$viewfile = "receiver";
		//$params = array('name'=>$modelUserOrder->receiver_fbfirstname,'fb_id'=>$modelUserOrder->receiver_fbid,'id_user_gift'=>$id_user_gift)
		$params = array('receivername'=>$modelUserOrder->receiver_fbfirstname,'sendername'=>$sender->name,'gifturl'=> $gift_url= Yii::app()->createAbsoluteUrl('receiver/seeGift',array('gid'=>$id_user_gift)));
		
		$view = $this->getEmailView($viewfile,$params);
		
		$to=$email_receiver;
		$from = Yii::app()->params['adminEmail'];
		$fromName = $sender->name;
		
		//list($responseSES,$failSES) = $this->sendViaAmazonSES($from,$fromName,$to,$subject,$view);
		
		$responseSendGrid = $this->sendViaSendGrid($from,$fromName,$to,$subject,$view);
		Yii::trace("Mail sending response-".$responseSendGrid);
		
		//bit field in database
		//post - 0x01, delievery email - 0x04,notification -0x07
		if($responseSendGrid!=false)
		{
			$modelUserOrder->post_email_status = '111';
			$modelUserOrder->save(false);
			Yii::trace("Database updated after receiver mail sent succssfully");			
			
			//send notification mail
			//Yii::app()->runController("Email/SendNotification/id_user_gift/".$modelUserOrder->id_user_gift);
		}
		

	}

	private function getEmailView($viewfile,$params)
	{
		if(isset(Yii::app()->controller))
			$controller = Yii::app()->controller;
		else
			$controller = new CController('test');
	    
		$viewPath = Yii::getPathOfAlias('application.views.email'.DIRECTORY_SEPARATOR.$viewfile).'.php';
		
		//$view = $controller->renderInternal($viewPath, array('receivername'=>'Test','sendername'=>$sender->facebook_userid,'id_user_gift'=>$id_user_gift),true); 		
		$view = $controller->renderInternal($viewPath,$params,true); 
		
		return $view;
	}
	
	private function sendViaAmazonSES($from,$fromName,$to,$subject,$view)
	{
		//read details from database
		$mail=new Mail();
		
		$mail->setBodyContent($view,$subject);
		$mail->setFromName($from,$fromName);
		
		$to=$to;
		$mail->addAddress($to);
		list($response,$fail) = $mail->sendMail();
		
		return array($response,$fail);
	}
	
	private  function sendViaSendGrid($from,$fromName,$to,$subject,$view)
	{
		$url= Yii::app()->params['sendgridurl'];
		$user= Yii::app()->params['usersendgrid'];
		$pass= Yii::app()->params['passsendgrid'];


		$params = array(
			'api_user'  => $user,
			'api_key'   => $pass,
			'to'        => $to,
			'subject'   => $subject,
			'html'      => $view,
    //'html'      => $this->widget('ReceiverGiftCard',array('id_user_gift'=>4,'email_view'=>true)),
			'text'      => '',
			'from'      => $from,
			'fromname'      => $fromName,
		);
 

    	return $this->sendercurl($url,$params);

	}
	
	private function sendercurl($url,$params)
	{
		$request =  $url.'api/mail.send.json';
		// Generate curl request
		$session = curl_init($request);
		// Tell curl to use HTTP POST
		curl_setopt ($session, CURLOPT_POST, true);
		// Tell curl that this is the body of the POST
		curl_setopt ($session, CURLOPT_POSTFIELDS, $params);
		// Tell curl not to return headers, but do return the response
		curl_setopt($session, CURLOPT_HEADER, false);
		curl_setopt($session, CURLOPT_RETURNTRANSFER, true);
 
		// obtain response
		$response = curl_exec($session);
		curl_close($session);
		
		return $response;
	}


}

?>

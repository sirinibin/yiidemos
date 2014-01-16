<?php
require_once(dirname(__FILE__).'/../extensions/phpmailer/mail.class.php');


class SendmailCommand extends CConsoleCommand
{
	public function actionIndex($type,$id)
	{
		if(empty($type))
		{
			Yii::trace("Please specify type of the mail to be sent.");
			return 1;
		}
		if($type == 'instant')
		{
			//echo $id;
			$this->sendReceiverMail($id);
			$this->sendNotificationMail($id);
			
		}
		else if ($type == 'receiver')
		{
			if($id)
			{
				$this->sendReceiverMail($id);
			}
			else
			{
				$this->sendReceiverMailAll();
			}
		}
		else if($type == 'notification')
		{
			if($id)
			{
				$this->sendNotificationMail($id);
			}
			else
			{
				$this->sendNotificationMailAll();
			}
		}
       
    }
	
		// for cron jobs only //


	public function actionSendreceivermailall()
	{
		$this->sendReceiverMailAll();
	}
	
	public function actionSendnotificationall()
	{
		$this->sendNotificationAll();
	}

		// end of cron part//
	
	//scan database and send all mails
	private function sendReceiverMailAll()
	{
		$criteria=new CDbCriteria;
		date_default_timezone_set('UTC');
		$today = date('Y-m-d');
        $criteria->condition='post_email_status & 0x02 = 0 and delivery_date='.$today;
        
        $modelUserOrder=UserOrder::model()->findAll($criteria);
		var_dump($modelUserOrder);
		foreach($modelUserOrder as $UserOrder) 
		{
			var_dump($UserOrder->id_user_gift);
			$this->sendReceiverMail($UserOrder->id_user_gift);
		}

	}
	
	//send a specific mail
	private function sendReceiverMail($id_user_gift)
	{
		Yii::trace("Running email delivery for ".$id_user_gift);
		$modelUserOrder = UserOrder::model()->findbyPk($id_user_gift);
		
		if(ord($modelUserOrder->post_email_status) & 0x02)
		{
			Yii::trace("Email already sent!");
			return;
		}
		
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
			$modelUserOrder->post_email_status = ord($modelUserOrder->post_email_status) | 0x02;
			$modelUserOrder->save(false);
			Yii::trace("Database updated after receiver mail sent succssfully");			
			
			//send notification mail
			//Yii::app()->runController("Email/SendNotification/id_user_gift/".$modelUserOrder->id_user_gift);
		}
		

	}
	
	//send single notification mail
	public function sendNotificationMail($id_user_gift)
	{
		$modelUserOrder = UserOrder::model()->findbyPk($id_user_gift);
		$email_receiver = $modelUserOrder->receiver_fbemail;
		
		if(ord($modelUserOrder->post_email_status) & 0x04)
		{
			Yii::trace("Notification Email already sent!");
			return;
		}
		else if((ord($modelUserOrder->post_email_status) & 0x01) != 0x01 || (isset($email_receiver) && (ord($modelUserOrder->post_email_status) & 0x02)!=0x02)) 
		{
			Yii::trace("Email cannot be sent because delivery not done yet!".$id_user_gift);
			return;
		}
		
		//get sender's details
		$id_sender = $modelUserOrder->id_user;
		$sender = User::model()->findbyPk($id_sender);
		
		//$email_sender = $sender->facebook_email;
                 $email_sender = $modelUserOrder->notify_email;

		if(empty($email_sender))
		{
			Yii::trace("no mail to sender ".$id_user_gift);
			//no mail notification to sender
			$modelUserOrder->post_email_status = ord($modelUserOrder->post_email_status) | 0x04;
			$modelUserOrder->save(false);
			
			return;
		}
		
		
		$subject = "Happiness delivered!!";
		$viewfile = "senderconfirmation";
		
		$params = array('receivername'=>$modelUserOrder->receiver_fbfirstname,'sendername'=>$sender->name,'gifturl'=> $gift_url= Yii::app()->createAbsoluteUrl('receiver/seeGift',array('gid'=>$id_user_gift)));
		
		$view = $this->getEmailView($viewfile,$params);
		
		$to=$email_sender;
		$from = Yii::app()->params['adminEmail'];
		$fromName = Yii::app()->params['adminName'];
		
		//list($responseSES,$failSES) = $this->sendViaAmazonSES($from,$fromName,$to,$subject,$view);
		//echo $responseSES."fail=".$failSES;
		
		$responseSendGrid = $this->sendViaSendGrid($from,$fromName,$to,$subject,$view);
		Yii::trace("Mail sending response-".$responseSendGrid);			
		//bit field in database
		//post - 0x01, delievery email - 0x04,notification -0x07
		if($responseSendGrid!=false)
		{
			$modelUserOrder->post_email_status = ord($modelUserOrder->post_email_status) | 0x04;
			$modelUserOrder->save(false);
			Yii::trace("Database updated after notification mail sent succssfully");	
			
		}
		

	}
		
	
	//scan database and send all mails
	public function sendNotificationAll()
	{
		$criteria=new CDbCriteria;
        $criteria->condition='post_email_status & 0x04 = 0 and post_email_status & 0x03 = 0x03';
        
        $modelUserOrder=UserOrder::model()->findAll($criteria);
		var_dump($modelUserOrder);
		foreach($modelUserOrder as $UserOrder) 
		{
			//var_dump($UserOrder->id_user_gift);
			$this->sendNotification($UserOrder->id_user_gift);
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

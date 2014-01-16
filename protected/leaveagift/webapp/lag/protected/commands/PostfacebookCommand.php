<?php
require_once(dirname(__FILE__).'/../extensions/phpmailer/mail.class.php');

class PostfacebookCommand extends CConsoleCommand {
    public function actionIndex($id)
	{
		if(empty($id))
		{
			Yii::trace("Please specify type of the mail to be sent.");
			return 1;
		}
		$this->Post($id);
	}

		

	
	//Post a specific message from userorder table
	public function Post($id_user_gift)
	{
		$modelUserOrder = UserOrder::model()->findbyPk($id_user_gift);
		
		if(ord($modelUserOrder->post_email_status) & 0x01)
		{
			Yii::trace("Post already sent!");
			return 0;
		}
		
		//get sender's fb id and access token to post
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
		try
		{
			//get Receiver's name
			$receiver_info = $facebook->api($id_fb_receiver); 
			$name = 'See '.$receiver_info['first_name'].'\'s gift';
			//$gift_url = Yii::app()->params['hostname'].'receiver/seeGift/gid/'.$id_user_gift; 
                        $gift_url= Yii::app()->createAbsoluteUrl('receiver/seeGift',array('gid'=>$id_user_gift));
			$link =  $gift_url; // gift url
			//$caption =  'http://www.fbrell.com' ; //'LeaveAGift.com'
			$thumbnail = 'https://s3-ap-southeast-1.amazonaws.com/lagdev/mail/logo.jpg';//'http://leaveagift.jaideep/images/leaveAGift-logo.gif' ;//thumbnail image of leaveagift
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
				$modelUserOrder->post_email_status = ord($modelUserOrder->post_email_status) | 0x01;
				$modelUserOrder->save(false);
				Yii::trace("Updating database for successful post");
			}
			
		}
		catch(FacebookApiException $e)
		{
			//may be an oauth exception 
			return 0;
		}
		return 1;
    }
	
	//Scan database and post all messages
	public function PostAll()
	{
		$criteria=new CDbCriteria;
		date_default_timezone_set('UTC');
		$today = date('Y-m-d');
        $criteria->condition='post_email_status & 0x01 = 0 and delivery_date ='.$today;
        
        $modelUserOrder=UserOrder::model()->findAll($criteria);
		//var_dump($modelUserOrder);
		foreach($modelUserOrder as $UserOrder) 
		{
			if($this->Post($UserOrder->id_user_gift))
			{
				Yii::trace("Post sent for id_user_gift = ".$UserOrder->id_user_gift);
			}
			//var_dump($UserOrder->id_user_gift);
			
		}
	}


}

?>

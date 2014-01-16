<?php

/* ReceiverGiftCard widget is used to display the receiver's non-opened gift card*/

class ReceiverGiftCard extends CWidget
{
  public $id_user_gift;
  
  public $model;
  
  private $receiver_profile_pic_url;

  private $sender_profile_pic_url;

  public $email_view=false;
 
  public $next_button_link;
 
 public function init()
 {
  $assetsDir = dirname(__FILE__).'/../assets'; 

  if(!isset($this->model))
   {
    $this->model=UserOrder::model()->findbyPk($this->id_user_gift);
    
   }
  if(isset($this->model->img_url))
  {
   $this->receiver_profile_pic_url=Yii::app()->params['uploaded'].$this->model->img_url;
  }
 else
  {
   $this->receiver_profile_pic_url='https://graph.facebook.com/'.$this->model->receiver_fbid.'/picture?width=160&height=160&return_ssl_results=1';
  }
  
   $this->sender_profile_pic_url='https://graph.facebook.com/'.$this->model->sender->facebook_userid.'/picture?width=75&height=70&return_ssl_results=1';

  if(!$this->email_view)
   $this->next_button_link=Yii::app()->createUrl('receiver/giftLoading',array('id_user_gift'=>$this->model->id_user_gift));
  else
   $this->next_button_link=Yii::app()->createUrl('receiver/seeGift',array('gid'=>$this->model->id_user_gift)); 

 }

 public function run()
 {  

  $this->render("receivergiftcard",array("model"=>$this->model,'receiver_profile_pic_url'=>$this->receiver_profile_pic_url,'sender_profile_pic_url'=>$this->sender_profile_pic_url));
 }  
 

}

?>

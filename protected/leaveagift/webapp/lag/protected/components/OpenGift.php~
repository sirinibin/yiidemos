<?php

/* OpenCard widget is used to display the receiver gift card*/

class OpenGift extends CWidget
{
  public $id_user_gift;
  
  public $model;
  
  public $is_receiver_view=true;

 
 public function init()
 {
  if(!isset($this->model))
   {
    $this->model=UserOrder::model()->findbyPk($this->id_user_gift);
 
   }
 }

 public function run()
 {
 	
  $this->render("opengift",array('model'=>$this->model));
 }  
 

}

?>

<?php

/* ShowGift widget is used to display the receiver gift*/

class ReceivedProduct extends CWidget
{
  public $pid;
  
  public $model;

  public $show_info=false;
 
  



 public function init()
 {
  if(!isset($this->model))
   {
    $this->model=Product::model()->findbyPk($this->pid);
 
   }
             
                       
 }

 public function run()
 {
     
  $this->render("receivedproduct",array("model"=>$this->model));
 }  
 

}

?>

<?php

/* PreviewTemplate widget is used to show a preview the product template*/

class PreviewTemplate extends CWidget
{
  public $id;
  
  public $model;

  public $show_info=false;
 

 
 public function init()
 {
  if(!isset($this->model))
   {
    $this->model=ProductTemplate::model()->findbyPk($this->id);
 
   }      
						
 }

 public function run()
 {
  $this->render("previewTemplate",array("model"=>$this->model));
 }  
 

}

?>

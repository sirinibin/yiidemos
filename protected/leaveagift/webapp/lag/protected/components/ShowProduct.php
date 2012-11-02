<?php

/* Product widget is used to display the product*/

class ShowProduct extends CWidget
{
  public $pid;
  
  public $model;

  public $show_info=false;
 
  public $supplier_logo;
  
  public $order=null;
  
  public $delivery=null;
  
  
 public function init()
 {
  if(!isset($this->model))
   {
    $this->model=Product::model()->findbyPk($this->pid);
 
   }

   $this->supplier_logo=$this->model->getSupplierLogo();
   
   if($this->delivery!=null)
   {
    $this->delivery=substr($this->delivery,6,4).'-'.substr($this->delivery,3,2)."-".substr($this->delivery,0,2);
   }
                        
			     
						
 }

 public function run()
 {
     

  $this->render("product",array("model"=>$this->model));
 }  
 

}

?>

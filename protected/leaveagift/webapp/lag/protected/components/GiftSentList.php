<?php

/* GiftsentList widget is used to display the sent gift list */

class GiftSentList extends CWidget
{

 public $user;

 public $gifts;

 public function init()
 {  
  $this->user=Yii::app()->session['logged-userid'];



    
   $this->gifts=new CActiveDataProvider('UserOrder',array(
       'pagination'=>array(
         'pageSize'=>5,
               
          ),
       
         'criteria'=>array(
                         //'select'=>'id,title,published',  
                         'condition'=>"id_user='".$this->user."' ",
                         'order'=>'id_user_gift desc',                           
          ), 
     
 
   ));     

						
 }

 public function run()
 {
  $this->render("giftsent");
 }  
 

}

?>

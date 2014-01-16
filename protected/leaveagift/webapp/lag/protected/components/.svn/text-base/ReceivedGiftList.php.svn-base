<?php

/* ReceivedGiftList widget is used to display the received gift list */

class ReceivedGiftList extends CWidget
{



 public $gifts;

 public function init()
 {  
  $session=new CHttpSession;
  $session->open();
  
   $this->gifts=new CActiveDataProvider('UserOrder',array(
       'pagination'=>array(
         'pageSize'=>5,
               
          ),
       
         'criteria'=>array(
              'with'=>array('sender'),
 
                         //'select'=>'id,title,published',  
                         'condition'=>"t.receiver_fbid='".$session['me']['id']."' and order_status='SUCCESS' ",
                         'order'=>'t.id_user_gift desc',                           
          ), 
       
   ));     
  
						
 }

 public function run()
 {
  $this->render("receivedGiftList");
 }  
 

}

?>

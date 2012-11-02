<!-- gift card starts -->
  <div id="custom-gift-card-inside-receiver">
  <?php if($this->is_receiver_view)
        {
  ?>
  <div id="card-view-next-button"><a href="<?php echo Yii::app()->createUrl('receiver/giftReturn',array('id_user_gift'=>$model->id_user_gift)); ?>"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/btn-next.jpg" alt="" width="114" height="53" border="0" /></a></div>
  <?php
        }
       else
       {
   ?>
        <div id="card-view-next-button"><a href="<?php echo Yii::app()->createUrl('gift/mygifts'); ?>"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/back_btn.jpg" alt="" width="114" height="53" border="0" /></a></div>
 

   <?php
       }

 ?> 
 
  
  <div id="custom-card-inside-receiver">
  
  
  
  <div id="custom-card-inside-left-receiver">
  <div class="gift-corners-receiver"></div>

   <?php $this->widget("ReceivedProduct",array('pid'=>$model->id_product)); ?> 

  </div><!-- inside left ends -->
  
  
  
  
  <div id="custom-card-inside-right-receiver">
    <div class="msg"> 
     <?php echo $model->message_card; ?>
  </div>
  </div> <!-- inside right ends -->
  
  
  
  
  </div> <!-- inside ends -->
  
  
  
  
  
  </div>   <!-- gift card ends -->
  

<!--fb friend starts  -->
  <div class="mg-fb-friends">
  <div class="date"><?php
                         if($data->order_status!="SUCCESS")
                          {
                            echo CHtml::link("Send Now",array('product/CustomizeGift','pid'=>$data->id_product,'order_id'=>$data->id_user_gift))."<br/>(Pending)";
                          }
                          else
                          {
                             echo $data->getDeliveryDate();
                          }    
  
                    ?></div>
  <div class="fb-frnd-pic">
  <div class="fbf"><img src="https://graph.facebook.com/<?php if(isset($data->receiver_fbid)){ echo $data->receiver_fbid; } ?>/picture?width=75&height=70&return_ssl_results=1" width="45" height="45" alt="" /></div>
  <div class="fbf-name"><?php if(isset($data->receiver_fbfirstname)){ echo $data->receiver_fbfirstname; } ?></div>
  </div>
  <div class="see-gift"><a href="<?php echo Yii::app()->createUrl('gift/sentGiftView',array('id_user_gift'=>$data->id_user_gift)); ?>">see gift</a></div>
  
  </div>  <!--fb friend ends  -->

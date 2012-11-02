<!--fb friend starts  -->
  <div class="mg-fb-friends">
  <div class="date"><?php if(isset($data->sender->facebook_userid)){ echo date('M-d',strtotime($data->delivery_date)); } ?></div>
  <div class="fb-frnd-pic">
  <div class="fbf"><img src="https://graph.facebook.com/<?php if(isset($data->sender->facebook_userid)) { echo $data->sender->facebook_userid; } ?>/picture?width=75&height=70&return_ssl_results=1" width="45" height="45" alt="" /></div>
  <div class="fbf-name"><?php if(isset($data->sender->name)) { echo $data->sender->name; } ?></div>
  </div>
  <div class="see-gift"><a href="<?php echo Yii::app()->createUrl('receiver/seeGift',array('gid'=>$data->id_user_gift)); ?>">see gift</a></div>
  
  </div>  <!--fb friend ends  -->

<?php
/* @var $this ProductController */
/* @var $model Product */
?>
<?php
 $assetsDir = dirname(__FILE__).'/../../assets'; 
							$criteria= new CDbCriteria;
							$criteria->condition="id_product=:id_product and receiver_fbid=:receiver_fbid";
							$criteria->params=array(':id_product'=>$data->id_product,':receiver_fbid'=>Yii::app()->session['selected-userid']);		
							$orderTime = UserOrder::model()->count($criteria);

							$criteria_Sender= new CDbCriteria;
							$criteria_Sender->condition="id_product=:id_product and id_user=:id_user";
							$criteria_Sender->params=array(':id_product'=>$data->id_product,':id_user'=>Yii::app()->session['logged-userid']);		
							$orderSender = UserOrder::model()->count($criteria_Sender);

	
	//if(($orderTime==$data->receiver_limit) or ($orderSender==$data->sender_limit))


?>
<!--
<a href="<?php //echo Yii::app()->createAbsoluteUrl("product/customizeGift",array('pid'=>$data->id_product)); ?>" >
-->
<div class="gift-card-frame">

						<?php

                                            if($data->price==0)
						{
                                                 
							echo '<div class="free"><img src="'.Yii::app()->request->baseUrl.'/images/gift-free.png" border="0" width="50" height="22" alt="" /></div>';
						}
						
						if(($orderTime>=$data->receiver_limit) or ($orderSender>=$data->sender_limit))
							{
								echo '<div class="unav_fade"></div>';
							}
							else
							{
							  if($data->out_of_stock==1)
							  {
							    echo '<div class="soldout_fade"></div>';
							  }
							}
						
                                     //  echo '<div class="soldout_fade"></div>';
                                     
                                             
                                               echo '<div class="picture"><img src="'.$data->getImage(0).'" alt="" width="199" height="138" border="0" /></div>';

                                                 
                                              
						?>
                        <div class="price"><span class="WebRupee">Rs.</span> <?php echo CHtml::encode(number_format($data->getPriceValue(),0,".","")); ?></div>
                        <div class="description"><strong><?php if(isset($data->tags[0]->name)) {echo CHtml::encode($data->tags[0]->name); }?></strong><?php if(isset($data->product_lang->description)) { echo $data->product_lang->description; } ?></div>
                        
                                     

                        <div class="brand"><img src="<?php echo $data->getSupplierLogo(0); ?>" alt=""  border="0" /></div>
						<?php if($data->price ==0){
								//echo "<div class=\"button\">Send it now for free</div>";
			                               		                 
                                                       echo CHtml::link('Send it now for free<img src="'.Yii::app()->request->baseUrl.'/images/bullet_right.png" width="11" height="11" alt="bullet" border="0" />',array("product/customizeGift",'pid'=>$data->id_product),array('class'=>'button'));  
                                                        

                                                      }
							else
							{
								//echo "<div class=\"button\">Buy it now for ".CHtml::encode(number_format($data->price,2,".",""))."</div>";
                                                                 echo CHtml::link('Buy it now for<img src="'.Yii::app()->request->baseUrl.'/images/bullet_right.png" width="11" height="11" alt="bullet" border="0" /> '.CHtml::encode(number_format($data->price,0,".","")),array("product/customizeGift",'pid'=>$data->id_product),array('class'=>'button'));  
							}
//}
						?>
						
    
</div>
<!--
</a>
-->

 

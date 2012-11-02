<?php
 $assetsDir = dirname(__FILE__).'/../../../../assets'; 
?>
   
<div class="gift-card-frame">

						<?php if($model->price==0)
						{
							echo '<div class="free"><img src='.Yii::app()->request->baseUrl.'/images/gift-free.png border="0" width="50" height="22" alt="" /></div>';
						}

 
                
						?>
					
                        <div class="picture"><img src="<?php echo $model->getImage(0); ?>" width="199" height="138" alt="" /></div>
                        <div class="price"><span class="WebRupee">Rs.</span> <?php echo CHtml::encode(number_format($model->getPriceValue(),0,".","")); ?></div>
                        <div class="description"><strong><?php if(isset($model->tags[0]->name)) {echo CHtml::encode($model->tags[0]->name); }?></strong><?php if(isset($model->product_lang->description)){ echo CHtml::encode($model->product_lang->description); } ?></div>
                                                 

                        <div class="brand"><img src="<?php echo $model->getSupplierLogo(0); ?>" alt=""  border="0" /></div>
						<?php if($model->price ==0){
								//echo "<div class=\"button\">Send it now for free</div>";
			                               		                 
                                                       echo CHtml::link('Send it now for free<img src="'.Yii::app()->request->baseUrl.'/images/bullet_right.png" width="11" height="11" alt="bullet" />',array(),array('class'=>'button'));  
                                                        

                                                      }
							else
							{
								//echo "<div class=\"button\">Buy it now for ".CHtml::encode(number_format($model->price,2,".",""))."</div>";
                                                                 echo CHtml::link('Buy it now for<img src="'.Yii::app()->request->baseUrl.'/images/bullet_right.png" width="11" height="11" alt="bullet" /> '.CHtml::encode(number_format($model->price,0,".","")),array(),array('class'=>'button'));  
							}
						?>

</div>
<style type="text/css">
.gift-card-frame{
	position:relative;
	background:url(<?php echo Yii::app()->request->baseUrl; ?>/images/gift-card-bg.gif) no-repeat left top #CCC;
	width:205px;
	height:300px;
	margin:0 10px 20px 10px;
	float:left;
	text-align:center;
	}
.gift-card-frame a{
	display:block;
	}

.gift-card-frame .free{
	position:absolute;
	top:0px;
	left:35px;
	width:48px;
	height:20px;
	z-index:5;

	}

.gift-card-frame .picture{
	position:absolute;
	top:3px;
	left:3px;
	width:199px;
	height:140px;
	z-index:4;

	}

.gift-card-frame .price{

	position:absolute;
	top:150px;
	left:3px;
	z-index:9;
	width:199px;
	height:22px;
	margin:0;
	overflow:hidden;
	background:url(<?php echo Yii::app()->request->baseUrl; ?>/images/price-band.png) no-repeat center center;
	color:#fff;
	font-weight:bold;
	font-size:16px;
	padding-top:2px;
	text-shadow:#000 0px 1px 3px;
	behavior:url(../css/PIE.htc);
}

.gift-card-frame .description {
	position:absolute;
	top:180px;
	left:3px;
	width:191px;
	height:40px;
	color:#999;
	font-size:10px;
	font-weight:bold;
	line-height:12px;
	margin:0;
	overflow:hidden;
	padding:0 4px 0 4px;

}

.gift-card-frame .description strong {
	color:#ff860d;
	font-size:9px;
	text-transform:uppercase;
	display:block;
	font-weight:bold;
	padding:0 0 4px 0;
}

.gift-card-frame .brand{
	position:absolute;
	top:230px;
	left:3px;
	width:199px;
	height:35px;
	}

.gift-card-frame .button {
	position:absolute;
	top:265px;
	left:12px;
	width:180px;
	height:20px;
	color:white;
	font-size:12px;
	line-height:20px;
	color:white;
	font-weight:bold;
	text-align:center;
	cursor:pointer;
	border-top:#9d02be 1px solid;
	border-right:0 none;
	border-bottom:#75008d 1px solid;
	border-left:0 none;
	-webkit-border-radius:4px;
	-moz-border-radius:4px;
	-ms-border-radius:4px;
	-o-border-radius:4px;
	border-radius:4px;
	background:#75008d;
	background:-moz-linear-gradient(top, #9d02be 0%, #75008d 100%);
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0%, #9d02be), color-stop(100%, #75008d));
	background:-webkit-linear-gradient(top, #9d02be 0%, #75008d 100%);
	background:-o-linear-gradient(top, #9d02be 0%, #75008d 100%);
	background:-ms-linear-gradient(top, #9d02be 0%, #75008d 100%);
	background:linear-gradient(top, #9d02be 0%, #75008d 100%);
	overflow:hidden;
	text-shadow:#000 0px -1px 0px;
	behavior:url(../css/PIE.htc);
	-webkit-border-radius:20px;
	-moz-border-radius:20px;
	-ms-border-radius:20px;
	-o-border-radius:20px;
	border-radius:20px;
	behavior:url(../css/PIE.htc)
}

.gift-card-frame .button:hover {
	background:#9d02be;
	background:-moz-linear-gradient(top, #75008d 0%, #9d02be 100%);
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0%, #75008d), color-stop(100%, #9d02be));
	background:-webkit-linear-gradient(top, #75008d 0%, #9d02be 100%);
	background:-o-linear-gradient(top, #75008d 0%, #9d02be 100%);
	background:-ms-linear-gradient(top, #75008d 0%, #9d02be 100%);
	background:linear-gradient(top, #75008d 0%, #9d02be 100%);
	overflow:hidden
}

</style>


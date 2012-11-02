
<!-- content starts -->
  <div id="content">
  
  
  <!-- left panel starts-->
  <div id="left-panel-sendGift">


  
<div id="apDiv1">
    <div class="border_shade"></div>
   			<a href="#">
            <div class="blue_vlevet">
            
            <div class="gift-card-frame">
            <div class="gift-corners_spct"></div>


 
    <div class="picture"><img src="<?php echo $product->getImage(0); ?>" alt="" width="199" height="138" border="0" /></div>
                        <div class="price"><span class="WebRupee">Rs.</span><?php echo CHtml::encode(number_format($product->getPriceValue(),0,".","")); ?></div>
                        <div class="description"><strong><?php if($product->tags) {echo CHtml::encode($product->tags[0]->name); }?></strong><?php echo CHtml::encode($product->product_lang->description);?>.</div>
                        <div class="brand"><img src="<?php echo $product->getSupplierLogo(0); ?>" alt=""  border="0" /></div>
                        
    
		    </div></div>
                 </a>   
    
   			     <br />
                 <br />
                  
                   
                 <div class="gift-info abut-gift">
                   <?php if(strtolower($product->tags[0]->name)!="gift to charity"){ ?>
                  <strong>Valid for: </strong><?php
                                          echo $product->user_validity." days";
                                        //echo $model->getUserValidity($this->delivery,"frontend"); ?>,after receipt<br />
                                         <?php } ?>
				   <strong>Gift type: </strong><?php if($product->tags[0]->name) {echo CHtml::encode($product->tags[0]->name); }?><br />
				   <strong>Gift Features: </strong><br />
				   <?php if(isset($product->features)){ 
                                         echo $product->features;
                                         }
                                       ?>
<br />
                 <!--
                 <b>About your gift
</b>

				 <ul>
                 <li>Use this voucher as cash on the site </li>
<li>No minimum puchase required</li>
<li>Validity of one week only , so use now!</li>
</ul>
-->


<a href="#" onclick="MM_showHideLayers('apDiv2','','show')" >See full terms & conditions</a>

<br />

<div id="apDiv2">
  <table width="100%" border="0" cellspacing="2" cellpadding="10">
      <tr>
        <td align="right"><a href="javascript:return;"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/close.gif" alt="" width="12" height="12" border="0" onclick="MM_showHideLayers('apDiv2','','hide')" /></a></td>
      </tr>
	  <tr>
        <td><strong>Full terms and conditions:</strong></td>
      </tr>
       <tr>
        <td><?php 
            if(isset($product->terms))
            {
                echo $product->terms;
            }
            ?>
         </td>
      </tr>
     
      </table>
</div>


<!--
<a href="#"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/use-gift-btn.jpg" alt="use-gift-btn" width="194" height="53" border="0" /></a>
-->
 <br /><br />
<span><a href="<?php echo Yii::app()->createUrl('gift/mygifts'); ?>">Back to my gifts </a>&nbsp; |&nbsp;
<a href="<?php echo Yii::app()->createUrl('auth/index'); ?>">Start a new gift</a></span>

        </div>
                 
   
  
  
    </div>
  <!-- ap div ends -->



  </div>  <!-- left panel ends--> 
  
  
  <!--  form starts -->
   <?php $this->renderPartial('usegift_form',array('model'=>$model,'product'=>$product,'voucherCode'=>$voucherCode,'order'=>$order)); ?>

  </div>
  <!-- content ends --> 

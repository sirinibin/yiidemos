<?php
/* @var $this UseGiftFormController */
/* @var $model UseGiftForm */
/* @var $form CActiveForm */
?>


<div id="form-use-gift">
<div class="tp_bg"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/tp_bg.jpg" width="593" height="44" alt="tp" /></div>
<div class="btm_bg"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/btm_bg.jpg" width="593" height="44" alt="tp" /></div>

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'use-gift-form-usegift_form-form',
        'enableClientValidation'=>true,
       // 'action'=>array('receiver/usegift','id_user_gift'=>$order->id_user_gift), 
       // 'action'=>$product->template->redirection_url,
	//'enableAjaxValidation'=>false,
        'clientOptions'=>array(
		'validateOnSubmit'=>true,
	),
)); ?>

       <div class="form-row2"><h1>
        <?php 
         if(strtolower($product->tags[0]->name)=="gift to charity")
          {
            echo "You are Done."; 
            echo "<meta http-equiv=\"refresh\" content=\"3;url=".Yii::app()->createUrl('auth/index')."\">";
           
          }
          else
          {
       
         ?>
       <span>Before you go</span>
      <br />
    Once this card is issued the voucher
code will be active for only 15 days.
<p>Whenever you use it, you will have to 
  go to the site through the link below. </p> 
</h1></div>


	<?php echo $form->errorSummary($model); ?>
  
  																																																																																																																																																																																																																																																					
	
        <?php if(CCaptcha::checkRequirements()): ?>
	<div class="form-row2">
	   <?php if(!$model->is_verified){ ?>
	       <h2><?php echo $form->labelEx($model,'verifyCode'); ?></h2>
    
	  
           <table width="200" border="0" cellpadding="10" cellspacing="15">
           <tr>   
              
              <td width="160" valign="bottom"> <?php $this->widget('CCaptcha',array('buttonOptions'=>array('style'=>'font-size:12px;float:left;'),'imageOptions'=>array('style'=>'border:1px solid;border-color:green;'))); ?> </td>
              
              <td width="160" valign="top" ><?php echo $form->textField($model,'verifyCode',array('class'=>"textbox")); ?>
               <?php echo CHtml::submitButton('Verify',array()); ?>
              </td>
             
             
	<td width="194" valign="top"></td>	
             <tr>
             <td colspan="3" class="td_gap">
             
            <table> 
             <tr>
		  <td>
		  
		  <div class="veryfy_code_outer">
		  <div class="veryfy_code_outer_fade"><img src="<?php  echo Yii::app()->request->baseUrl; ?>/images/fade_out_voucher_no.png" width="397" height="136" alt="fade" /></div>
		  <table width="200" border="0" cellpadding="0" cellspacing="0">
		    <tr>
		      <td width="80">Your Code:</td>
		      <td width="200" class="code_outer">LAGGKBDZGRYUVIC</td>
		    </tr>
		    <tr>
		      <td width="80">&nbsp;</td>
		      <td style="padding-left:30px;"><a href="#"><img src="<?php  echo Yii::app()->request->baseUrl; ?>/images/go_to_gift_btn.png" alt="go_to" width="255" height="53" border="0" /></a></td>
		    </tr>
		  </table></div>
		  
		  </td>
             </tr>
             
             </table>
             
             
             
             </td>
             </tr>
             
             
            
            </table>
            
             <?php } ?>
                        
	     
	    
       <!-- </div> -->
		<?php //echo $form->error($model,'verifyCode'); ?>
	
	<?php endif; ?>

        <div class="form-row" align="centre">
           <h2>
               <?php //echo CHtml::submitButton('Verify',array()); ?>
     
		<?php //echo CHtml::submitButton('',array('class'=>'usegift_btn')); ?>
             </h2>
          <div class="voucher_code">
          <?php
           if($model->is_verified)
            {
             if(!empty($product->redirection_url))
              $url=$product->redirection_url;
             else
              $url=$product->template->redirection_url;
          ?>
           
          <h1> Voucher Code:<strong> <input class="textbox" readonly value="<? echo $voucherCode ;?>" /></strong>  <br></h1>
             
           <input type="button"  class="usegift_btn" onclick="goto_partersite();" >
   
           <?php
            }
           ?>
    
        <p>&nbsp;</p>
        <p>&nbsp;</p>
         <!--
        <p>DON'T KNOW HOW TO USE A VOUCHER CODE? – <a href="#">CLICK HERE</a></p>
          -->
         <p>&nbsp;</p>
          </div>
	</div>
   
   <?php }  ?>

<?php $this->endWidget(); ?>


</div><!-- form -->
<style type="text/css">
 .usegift_btn {
  background:url('<?php echo Yii::app()->request->baseUrl."/images/go_to_gift_btn.png"; ?>');
    width:250px;
  height:53px;
  cursor:pointer;
  border:0px;
  border-radius: 10px;
  }

</style>
<script>
  function goto_partersite()
  {
    window.open('<?php if(isset($url)) echo $url; ?>','_blank');
   // window.location='<?php if(isset($url)) echo $url; ?>';
  }
</script>

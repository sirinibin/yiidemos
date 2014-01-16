<?php
/* @var $this GiftReturnFormController */
/* @var $model GiftReturnForm */
/* @var $form CActiveForm */
?>
 <!-- TinyMCE -->
<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/tiny_mce/tiny_mce.js"></script>
<script>
/*
 tinyMCE.init({
		mode : "textareas",
		theme : "advanced",
                  /*theme_advanced_disable : "bold,italic",*/
                /* onchange_callback : "messageUpdated",
                theme_advanced_layout_manager:"SimpleLayout",
                theme_advanced_buttons1_add_before : "separator,insertdate,inserttime,preview,zoom,separator,forecolor,backcolor",
                theme_advanced_resizing : true,
                theme_advanced_source_editor_width : 100,
                theme_advanced_resizing_max_width : 320,
                theme_advanced_resizing_max_height :400,
 
                theme_advanced_containers_default_align : "left",
             

                 width : "440",
                 height : "280"

	         });
*/
</script>   
<!-- /TinyMCE -->

<div id="form-gift-return" >

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'gift-return-form-return_gift_form-form',
	'enableAjaxValidation'=>false,
)); ?>

	

	<?php echo $form->errorSummary($model); ?>
        
	<div class="form-row" ><h1><?php echo $form->labelEx($model,'message'); ?></h1> </div>
         <div class="form-row">
	 <h2><?php echo $form->textArea($model,'message',array('cols'=>"50",'rows'=>"6",'maxlength'=>'100','class'=>"textbox")); ?></h2>
	 <?php echo $form->error($model,'message'); ?>
	</div>
        
        <div class="form-row"> 
	 <h2> <?php 
              if($model->getPublishedReturnGiftCount()>0)
               {
                  echo $form->labelEx($model,'gifts');
               }
              ?>
         </h2>
        </div>
    
	 <?php echo $form->checkBoxList($model,'gifts',$model->getGiftOptions(),array('labelOptions'=>array('for'=>'123'),'template'=>'
                 <div class="returnGift-frame">
<div class="returnGift-frameInside-Row">

<div  class="returnGift-frameInside-RowLeft">
<img src="'.Yii::app()->request->baseUrl.'/images/return-gift-icon.jpg" width="39" height="39" alt="" /><br />

<span class="thank">Thank you!</span>

</div>
{label}
  
                ','onclick'=>'uncheckOthers(this.id);','class'=>'giftcheckbox')
); ?>

	 <?php echo $form->error($model,'gifts'); ?>
	
	<div class="form-row">
           <div id="btn-center">
		<?php echo CHtml::submitButton('',array('class'=>'sendgift_btn')); ?>
           </div>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->

<style type="text/css">
 .sendgift_btn {
  background:url('<?php echo Yii::app()->request->baseUrl."/images/btn-send-thank.jpg"; ?>');
    width:275px;
  height:53px;
  cursor:pointer;
  border:0px;
  border-radius: 10px;
  }

</style>
<script type="text/javascript">

function uncheckOthers(selected)
{
 
 $(".giftcheckbox").attr('checked', false);
$("#"+selected).attr('checked', true);
 
}

</script>

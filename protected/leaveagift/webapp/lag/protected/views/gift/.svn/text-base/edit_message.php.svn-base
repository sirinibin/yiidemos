<?php
/* @var $this MessageFormController */
/* @var $model MessageForm */
/* @var $form CActiveForm */
?>
<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'message-form-edit_message-form',
	'enableAjaxValidation'=>false,
        'htmlOptions'=>array(
                               'onsubmit'=>"return false;",
                               //'onkeypress'=>" if(event.keyCode == 13){ editMessage(); } "
                             ),
)); ?>

	
	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php //echo $form->labelEx($model,'message'); ?>
		<?php echo $form->textArea($model,'message',array("rows"=>15,"cols"=>30),array('name'=>'content')); ?>
		<?php echo $form->error($model,'message'); ?>
	</div>


	<div class="row buttons">
		<?php 
                     echo CHtml::Button('save',array('onclick'=>'editMessage();'));
                ?>
               <?php 
                    // echo CHtml::Button('cancel',array('onclick'=>'cancelEditMessage();'));
                ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->

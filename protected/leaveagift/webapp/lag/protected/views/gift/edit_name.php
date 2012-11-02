<?php
/* @var $this NameFormController */
/* @var $model NameForm */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'name-form-edit_name-form',
	'enableAjaxValidation'=>false,
         'htmlOptions'=>array(
                               'onsubmit'=>"return false;",
                               'onkeypress'=>" if(event.keyCode == 13){ editName(); } "
                             ),
)); ?>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php //echo $form->labelEx($model,'name'); ?>
		<?php echo $form->textField($model,'name'); ?>
		<?php echo $form->error($model,'name'); ?>
	</div>


	<div class="row buttons">
		<?php 
                    // echo CHtml::Button('save',array('onclick'=>'editName();'));
                ?>
                 <?php 
                    // echo CHtml::Button('cancel',array('onclick'=>'cancelEditName();'));
                ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->

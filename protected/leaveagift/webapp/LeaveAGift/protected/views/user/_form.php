<?php
/* @var $this UserController */
/* @var $model User */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-form',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'facebook_id'); ?>
		<?php echo $form->textField($model,'facebook_id',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'facebook_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'oauth_id'); ?>
		<?php echo $form->textField($model,'oauth_id',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'oauth_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'email_id'); ?>
		<?php echo $form->textField($model,'email_id',array('size'=>30,'maxlength'=>30)); ?>
		<?php echo $form->error($model,'email_id'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'first_name'); ?>
		<?php echo $form->textField($model,'first_name',array('size'=>60,'maxlength'=>80)); ?>
		<?php echo $form->error($model,'first_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'middle_name'); ?>
		<?php echo $form->textField($model,'middle_name',array('size'=>60,'maxlength'=>80)); ?>
		<?php echo $form->error($model,'middle_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'last_name'); ?>
		<?php echo $form->textField($model,'last_name',array('size'=>60,'maxlength'=>80)); ?>
		<?php echo $form->error($model,'last_name'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'profile_pic_url'); ?>
		<?php echo $form->textField($model,'profile_pic_url',array('size'=>60,'maxlength'=>100)); ?>
		<?php echo $form->error($model,'profile_pic_url'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'date_add'); ?>
		<?php echo $form->textField($model,'date_add'); ?>
		<?php echo $form->error($model,'date_add'); ?>
	</div>

	<div class="row">
		<?php echo $form->labelEx($model,'date_upd'); ?>
		<?php echo $form->textField($model,'date_upd'); ?>
		<?php echo $form->error($model,'date_upd'); ?>
	</div>

	<div class="row buttons">
		<?php echo CHtml::submitButton($model->isNewRecord ? 'Create' : 'Save'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
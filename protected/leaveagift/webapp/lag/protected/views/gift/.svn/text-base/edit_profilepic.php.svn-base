<?php
/* @var $this ProfilePicFormController */
/* @var $model ProfilePicForm */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'profile-pic-form-edit_profilepic-form',
        'action'=>array('gift/UploadProfilePic'),
	//'enableAjaxValidation'=>true,
        'method'=>'post',
        'htmlOptions'=>array(
                             'enctype'=>'multipart/form-data'
                            ),
)); ?>


	<?php echo $form->errorSummary($model); ?>
        <div class="row">
		<?php echo $form->hiddenField($model,'pid'); ?>
	</div>
        <div class="row">
		<?php //echo $form->labelEx($model,'image'); ?>
		<?php echo $form->fileField($model,'image'); ?>
		
		<?php //echo $form->error($model,'image'); ?>
	</div>


	
		<?php echo CHtml::submitButton('UPLOAD'); ?>
	

<?php $this->endWidget(); ?>

</div><!-- form -->


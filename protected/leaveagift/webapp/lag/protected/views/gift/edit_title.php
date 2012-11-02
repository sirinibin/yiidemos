<?php
/* @var $this TitleFormController */
/* @var $model TitleForm */
/* @var $form CActiveForm */
?>

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'title-form-edit_title-form',
	//'enableAjaxValidation'=>false,
         'htmlOptions'=>array(
                               'onsubmit'=>"return false;",
                               'onkeypress'=>" if(event.keyCode == 13){ editTitle();} "
                             ),
         

         )
); ?>


	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php //echo $form->labelEx($model,'title'); ?>
		<?php echo $form->textField($model,'title'); ?>
		<?php echo $form->error($model,'title'); ?>
	</div>


	<div class="row buttons">
		<?php 
                  // echo CHtml::Button('save',array('onclick'=>'editTitle();'));
                ?>
                <?php 
                   //  echo CHtml::Button('cancel',array('onclick'=>'cancelEditTitle();'));
                ?>
	</div>     

<?php $this->endWidget(); ?>

</div><!-- form -->




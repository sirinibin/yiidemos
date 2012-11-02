<div class="form">
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'supplier-form',
	'enableAjaxValidation'=>false,
        'method'=>'post',
	'type'=>'horizontal',
	'htmlOptions'=>array(
		'enctype'=>'multipart/form-data'
	)
)); ?>
     	<fieldset>
		<legend>
			<p class="note">Fields with <span class="required">*</span> are required.</p>
		</legend>

	<?php echo $form->errorSummary($model,'Opps!!!', null,array('class'=>'alert alert-error span12')); ?>
        		
   <div class="control-group">		
			<div class="span4">

	<?php echo $form->textFieldRow($model,'name',array('maxlength'=>64)); ?>

        <?php echo $form->textFieldRow($model,'supplier_code',array('maxlength'=>64)); ?>

	<?php //echo $form->textFieldRow($model,'date_add',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'date_upd',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'active',array('class'=>'span5')); ?>

	<?php echo $form->fileFieldRow($model,'logo',array('class'=>'span5','maxlength'=>255)); ?>
 
        <?php echo $form->fileFieldRow($model,'logo2',array('class'=>'span5','maxlength'=>255)); ?>

                        </div>   
  </div>

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
                        'icon'=>'ok white',  
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
		)); ?>
              <?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'reset',
                        'icon'=>'remove',  
			'label'=>'Reset',
		)); ?>
	</div>
</fieldset>

<?php $this->endWidget(); ?>

</div>

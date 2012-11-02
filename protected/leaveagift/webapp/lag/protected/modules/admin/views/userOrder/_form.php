<div class="form">
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'user-order-form',
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

	<?php echo $form->textFieldRow($model,'id_cart',array('class'=>'span5','maxlength'=>64)); ?>

	<?php echo $form->textFieldRow($model,'id_product',array('class'=>'span5','maxlength'=>64)); ?>

	<?php echo $form->textFieldRow($model,'id_user',array('class'=>'span5','maxlength'=>64)); ?>

	<?php echo $form->textFieldRow($model,'receiver_fbid',array('class'=>'span5','maxlength'=>128)); ?>

	<?php echo $form->textFieldRow($model,'receiver_fbfirstname',array('class'=>'span5','maxlength'=>64)); ?>

	<?php echo $form->textFieldRow($model,'receiver_fbemail',array('class'=>'span5','maxlength'=>128)); ?>

	<?php echo $form->textFieldRow($model,'notify_email',array('class'=>'span5','maxlength'=>128)); ?>

	<?php echo $form->textFieldRow($model,'img_url',array('class'=>'span5','maxlength'=>128)); ?>

	<?php echo $form->textAreaRow($model,'message_card',array('rows'=>6, 'cols'=>50, 'class'=>'span8')); ?>

	<?php echo $form->textAreaRow($model,'message_post',array('rows'=>6, 'cols'=>50, 'class'=>'span8')); ?>

	<?php echo $form->textFieldRow($model,'title',array('class'=>'span5','maxlength'=>128)); ?>

	<?php echo $form->textFieldRow($model,'delivery_date',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'greeting',array('class'=>'span5','maxlength'=>32)); ?>

	<?php echo $form->textFieldRow($model,'gift_opened',array('class'=>'span5','maxlength'=>8)); ?>

	<?php echo $form->textFieldRow($model,'gift_rating',array('class'=>'span5','maxlength'=>8)); ?>

	<?php echo $form->textFieldRow($model,'facebook_postid',array('class'=>'span5','maxlength'=>64)); ?>

	<?php echo $form->textFieldRow($model,'post_email_status',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'thankyouid',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'date_add',array('class'=>'span5')); ?>

	<?php echo $form->textFieldRow($model,'date_upd',array('class'=>'span5')); ?>

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

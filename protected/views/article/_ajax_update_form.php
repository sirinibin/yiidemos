    <div id='article-update-modal' class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
   
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3>Update article #<?php echo $model->id; ?></h3>
    </div>
    
    <div class="modal-body">
 
    
    
    <div class="form">
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'article-update-form',
	'enableAjaxValidation'=>true,
        'enableClientValidation'=>true,
        'method'=>'post',
        'action'=>array("article/update"),
	'type'=>'horizontal',
	'htmlOptions'=>array(
                               'onsubmit'=>"return false;",/* Disable normal form submit */
                               'onkeypress'=>" if(event.keyCode == 13){ update(); } " /* Do ajax call when user presses enter key */
                            ),               
	
)); ?>
     	<fieldset>
		<legend>
			<p class="note">Fields with <span class="required">*</span> are required.</p>
		</legend>

	<?php echo $form->errorSummary($model,'Opps!!!', null,array('class'=>'alert alert-error span12')); ?>
        		
   <div class="control-group">		
			<div class="span4">
			
			<?php echo $form->hiddenField($model,'id',array()); ?>
			
	               				  <div class="row">
					  <?php echo $form->labelEx($model,'title'); ?>
					  <?php echo $form->textField($model,'title',array('size'=>60,'maxlength'=>300)); ?>
					  <?php echo $form->error($model,'title'); ?>
				  </div>

			  				  <div class="row">
					  <?php echo $form->labelEx($model,'content'); ?>
					  <?php echo $form->textArea($model,'content',array('rows'=>6, 'cols'=>50)); ?>
					  <?php echo $form->error($model,'content'); ?>
				  </div>

			  				  <div class="row">
					  <?php echo $form->labelEx($model,'image'); ?>
					  <?php echo $form->textField($model,'image',array('size'=>60,'maxlength'=>300)); ?>
					  <?php echo $form->error($model,'image'); ?>
				  </div>

			  				  <div class="row">
					  <?php echo $form->labelEx($model,'caption'); ?>
					  <?php echo $form->textField($model,'caption',array('size'=>60,'maxlength'=>300)); ?>
					  <?php echo $form->error($model,'caption'); ?>
				  </div>

			  				  <div class="row">
					  <?php echo $form->labelEx($model,'author_name'); ?>
					  <?php echo $form->textField($model,'author_name',array('size'=>60,'maxlength'=>100)); ?>
					  <?php echo $form->error($model,'author_name'); ?>
				  </div>

			  				  <div class="row">
					  <?php echo $form->labelEx($model,'author_email'); ?>
					  <?php echo $form->textField($model,'author_email',array('size'=>60,'maxlength'=>100)); ?>
					  <?php echo $form->error($model,'author_email'); ?>
				  </div>

			  				  <div class="row">
					  <?php echo $form->labelEx($model,'author_twitter'); ?>
					  <?php echo $form->textField($model,'author_twitter',array('size'=>60,'maxlength'=>100)); ?>
					  <?php echo $form->error($model,'author_twitter'); ?>
				  </div>

			  				  <div class="row">
					  <?php echo $form->labelEx($model,'link'); ?>
					  <?php echo $form->textField($model,'link',array('size'=>60,'maxlength'=>400)); ?>
					  <?php echo $form->error($model,'link'); ?>
				  </div>

			  				  <div class="row">
					  <?php echo $form->labelEx($model,'createdAt'); ?>
					  <?php echo $form->textField($model,'createdAt'); ?>
					  <?php echo $form->error($model,'createdAt'); ?>
				  </div>

			  
                        </div>   
  </div>

  </div><!--end modal body-->
  
  <div class="modal-footer">
	<div class="form-actions">

	                
		<?php		
		 $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			//'id'=>'sub2',
			'type'=>'primary',
                        'icon'=>'ok white', 
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
			'htmlOptions'=>array('onclick'=>'update();'),
		));
		
		?>
             
	</div> 
   </div><!--end modal footer-->	
</fieldset>

<?php $this->endWidget(); ?>

</div>


</div><!--end modal-->





    <div id='article-create-modal' class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3>Create article</h3>
    </div>
    
    <div class="modal-body">
    
    <div class="form">

   <?php
   
         $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'article-create-form',
	'enableAjaxValidation'=>true,
        'enableClientValidation'=>true,
        'method'=>'post',
        'action'=>array("article/create"),
	'type'=>'horizontal',
	'htmlOptions'=>array(
	                        'onsubmit'=>"return false;",/* Disable normal form submit */
                            ),
          'clientOptions'=>array(
                    'validateOnType'=>true,
                    'validateOnSubmit'=>true,
                    'afterValidate'=>'js:function(form, data, hasError) {
                                     if (!hasError)
                                        {    
                                          create();
                                        }
                                     }'
                                    

            ),                  
  
)); ?>
     	<fieldset>
		<legend>
			<p class="note">Fields with <span class="required">*</span> are required.</p>
		</legend>

	<?php echo $form->errorSummary($model,'Opps!!!', null,array('class'=>'alert alert-error span12')); ?>
        		
   <div class="control-group">		
			<div class="span4">
			
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
			'type'=>'primary',
                        'icon'=>'ok white', 
			'label'=>$model->isNewRecord ? 'Create' : 'Save',
			)
			
		);
		
		?>
              <?php
 $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'reset',
                        'icon'=>'remove',  
			'label'=>'Reset',
		)); ?>
	</div> 
   </div><!--end modal footer-->	
</fieldset>

<?php
 $this->endWidget(); ?>

</div>

</div><!--end modal-->

<script type="text/javascript">
function create()
 {
 
   var data=$("#article-create-form").serialize();
     


  jQuery.ajax({
   type: 'POST',
    url: '<?php
 echo Yii::app()->createAbsoluteUrl("article/create"); ?>',
   data:data,
success:function(data){
                //alert("succes:"+data); 
                if(data!="false")
                 {
                  $('#article-create-modal').modal('hide');
                  renderView(data);
                    $.fn.yiiGridView.update('article-grid', {
                     
                         });
                   
                 }
                 
              },
   error: function(data) { // if error occured
         alert("Error occured.please try again");
         alert(data);
    },

  dataType:'html'
  });

}

function renderCreateForm()
{
  $('#article-create-form').each (function(){
  this.reset();
   });

  
  $('#article-view-modal').modal('hide');
  
  $('#article-create-modal').modal({
   show:true,
   
  });
}

</script>

<div class="form">
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'vouchers-form',
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

        <?php echo $form->dropDownListRow($model,'id_supplier',$model->getSupplierOptions(),
        array(
            'empty'=>array(''=>'Select a supplier'),
            'ajax'=>array(
             'type'=>'POST',
             'url'=>CController::createUrl('vouchers/templatelist'),
             'update'=>'#Vouchers_id_template',
             /*'success'=>'js:function(data){
                              alert(data);    
                           }',
             /* 'error'=>'js:function(data){
                              alert("error");  
                              printObject(data);  
                           }'*/
             )

           )); ?>
   <script>
   function printObject(o) {
  var out = '';
  for (var p in o) {
    out += p + ': ' + o[p] + '\n';
  }
  alert(out);
}

   </script>
         <?php
       
         if(isset($model->id_supplier))
           {
            $productOptions=$model->getProductTemplateOptions();
           }
           else
           {
            $productOptions=array();
           }
        
         ?>
        <?php echo $form->dropDownListRow($model,'id_template',$productOptions,array('empty'=>array(''=>'choose a Template'),)); ?>

	<?php echo $form->textFieldRow($model,'voucher_code',array('maxlength'=>128)); ?>
   
       
        <?php echo $form->textFieldRow($model,'price',array()); ?>
   

	<?php echo $form->textFieldRow($model,'value',array()); ?>

        <?php echo $form->textFieldRow($model,'min_purchase',array()); ?> 

	<?php //echo $form->textFieldRow($model,'validity',array()); ?>
         <div class="control-group ">
            <?php echo $form->labelEx($model,'validity',array('class'=>'control-label required')); ?>
          <div class="controls">
          <?php
               
                  $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                  'model'=>$model,
                  'name'=>'validity',
                  'attribute'=>'validity', 
                 // additional javascript options for the date picker plugin
                  'options'=>array(
                                  'minDate'=>date('d/m/y',time()),
                                  //'maxDate'=>date('d',strtotime(Yii::app()->session['selected-userbirthday'])),
                                  'showAnim'=>'fold',
                                  'dateFormat'=>'dd/mm/yy',  
                                  ),
                  'htmlOptions'=>array(
                 // 'class'=>'textbox',
                 
                    ),
                   ));
                
                 ?>
          </div></div>

	<?php //echo $form->textFieldRow($model,'status',array()); ?>

	<?php //echo $form->textFieldRow($model,'timestamp',array('class'=>'span5')); ?>

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

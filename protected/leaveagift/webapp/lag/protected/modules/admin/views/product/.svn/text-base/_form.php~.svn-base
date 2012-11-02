<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/tiny_mce/tiny_mce.js"></script>
<div class="form">
<?php $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'product-form',
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

        <?php echo $form->dropDownListRow($model,'id_tag',$model->getTagOptions(),array('empty'=>array(''=>'Select a Type'))); ?>
     
	<?php echo $form->dropDownListRow($model,'id_supplier',$model->getSupplierOptions(),array('empty'=>array(''=>'Select a Supplier'))); ?>
     
        <?php echo $form->dropDownListRow($model,'id_brand',$model->getBrandOptions(),array('empty'=>array(''=>'Select a Brand'))); ?>
 
        <?php echo $form->dropDownListRow($model,'logo_choice',$model->getLogoChoiceOptions()); ?>
        
        <?php echo $form->dropDownListRow($model,'id_category',$model->getCategoryOptions(),array('empty'=>array(''=>'Select a Category'))); ?>
        
        <?php echo $form->dropDownListRow($model,'is_return_gift',$model->getReturnIsGiftOptions()); ?>

	<?php //echo $form->textFieldRow($model,'id_tax_rules_group',array('class'=>'span5','maxlength'=>10)); ?>

	<?php //echo $form->textFieldRow($model,'id_category_default',array('class'=>'span5','maxlength'=>10)); ?>

	<?php //echo $form->textFieldRow($model,'id_color_default',array('class'=>'span5','maxlength'=>10)); ?>

	<?php //echo $form->textFieldRow($model,'on_sale',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'online_only',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'ean13',array('class'=>'span5','maxlength'=>13)); ?>

	<?php //echo $form->textFieldRow($model,'upc',array('class'=>'span5','maxlength'=>12)); ?>

	<?php //echo $form->textFieldRow($model,'ecotax',array('class'=>'span5','maxlength'=>17)); ?>

	<?php echo $form->textFieldRow($model,'quantity',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'minimal_quantity',array('class'=>'span5','maxlength'=>10)); ?>

	<?php echo $form->textFieldRow($model,'price',array('size'=>'20')); ?>
 
        <?php echo $form->textFieldRow($model,'product_value',array('size'=>'20')); ?>

        <?php echo $form->textFieldRow($model,'min_purchase',array('size'=>'20')); ?>

        <?php echo $form->textFieldRow($model,'user_validity',array('size'=>'20')); ?>
 
        <?php echo $form->textFieldRow($model,'event',array('maxlength'=>100,'value'=>'Happy birth day')); ?>

        <?php echo $form->textFieldRow($model,'sender_limit',array('maxlength'=>'3')); ?>
  
        <?php echo $form->textFieldRow($model,'receiver_limit',array('maxlength'=>'3')); ?>

        <?php echo $form->textFieldRow($model,'redirection_url',array()); ?>
        
        <?php if(!$model->isNewRecord) { echo $form->textFieldRow($model,'position',array()); } ?>

        

        <?php  echo $form->fileFieldRow($model,'image'); ?>

        <?php  echo $form->fileFieldRow($model,'image2'); ?>

        <?php echo $form->textAreaRow($model,'description',array('size'=>'500')); ?>
        
        <?php echo $form->textAreaRow($model,'features',array('size'=>'500')); ?>

        <?php echo $form->textAreaRow($model,'tips',array()); ?>
        
        <?php echo $form->textAreaRow($model,'terms',array()); ?>


	<?php //echo $form->textFieldRow($model,'wholesale_price',array('class'=>'span5','maxlength'=>20)); ?>

	<?php //echo $form->textFieldRow($model,'unity',array('class'=>'span5','maxlength'=>255)); ?>

	<?php //echo $form->textFieldRow($model,'unit_price_ratio',array('class'=>'span5','maxlength'=>20)); ?>

	<?php //echo $form->textFieldRow($model,'additional_shipping_cost',array('class'=>'span5','maxlength'=>20)); ?>

	<?php //echo $form->textFieldRow($model,'reference',array('class'=>'span5','maxlength'=>32)); ?>

	<?php //echo $form->textFieldRow($model,'supplier_reference',array('class'=>'span5','maxlength'=>32)); ?>

	<?php //echo $form->textFieldRow($model,'location',array('class'=>'span5','maxlength'=>64)); ?>

	<?php //echo $form->textFieldRow($model,'width',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'height',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'depth',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'weight',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'out_of_stock',array('class'=>'span5','maxlength'=>10)); ?>

	<?php //echo $form->textFieldRow($model,'quantity_discount',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'customizable',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'uploadable_files',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'text_fields',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'active',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'available_for_order',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'condition',array('class'=>'span5','maxlength'=>11)); ?>

	<?php //echo $form->textFieldRow($model,'show_price',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'indexed',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'cache_is_pack',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'cache_has_attachments',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'cache_default_attribute',array('class'=>'span5','maxlength'=>10)); ?>

	<?php //echo $form->textFieldRow($model,'date_add',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'date_upd',array('class'=>'span5')); ?>

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

<script>

$(document).ready(function(){

tinyMCE.init({
                mode : "exact",
                elements : "Product_features,Product_tips,Product_terms",

            //elements : "MessageForm_message",
               //oninit :  "myCustomInitInstance",
             //  setupcontent_callback : "myCustomInitInstance", 
              // init_instance_callback : "myCustomInitInstance",
              //handle_event_callback : "myHandleEvent",
              
		theme : "advanced",
              //   blur:"editMessage",
                  theme_advanced_disable : "",
                          

                /* onchange_callback : "messageUpdated",
                 //onblur_callback : "editMessage", 
                /*theme_advanced_layout_manager:"SimpleLayout",
                theme_advanced_buttons1_add_before : "separator,insertdate,inserttime,preview,zoom,separator,forecolor,backcolor",
                theme_advanced_resizing : true,
                theme_advanced_source_editor_width : 100,
                theme_advanced_resizing_max_width : 320,
                theme_advanced_resizing_max_height :400,
 
                theme_advanced_containers_default_align : "left",
                    

                 width : "240",
                 height : "280" 
                  */

	         });


});
 
</script>

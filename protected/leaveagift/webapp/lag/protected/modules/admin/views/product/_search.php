<?php  $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
        'id'=>'search-product-form',
	'action'=>Yii::app()->createUrl($this->route),
	'method'=>'get',
));  ?>


	<?php //echo $form->textFieldRow($model,'id_product',array('class'=>'span5','maxlength'=>64)); ?>
        <?php echo $form->dropDownListRow($model,'id_tag',$model->getTagOptions(),array('empty'=>array(''=>'Select a Tag'))); ?>
        
        <?php echo $form->dropDownListRow($model,'id_supplier',$model->getSupplierOptions(),array('empty'=>array(''=>'Select a Supplier'))); ?>

	<?php //echo $form->dropDownListRow($model,'id_supplier',array($model->getSupplierOptions()),array('class'=>'span5','maxlength'=>32)); ?>

	<?php //echo $form->textFieldRow($model,'id_manufacturer',array('class'=>'span5','maxlength'=>32)); ?>

	<?php //echo $form->textFieldRow($model,'id_tax_rules_group',array('class'=>'span5','maxlength'=>10)); ?>

	<?php //echo $form->textFieldRow($model,'id_category_default',array('class'=>'span5','maxlength'=>10)); ?>

	<?php //echo $form->textFieldRow($model,'id_color_default',array('class'=>'span5','maxlength'=>10)); ?>

	<?php //echo $form->textFieldRow($model,'on_sale',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'online_only',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'ean13',array('class'=>'span5','maxlength'=>13)); ?>

	<?php //echo $form->textFieldRow($model,'upc',array('class'=>'span5','maxlength'=>12)); ?>

	<?php //echo $form->textFieldRow($model,'ecotax',array('class'=>'span5','maxlength'=>17)); ?>

	<?php //echo $form->textFieldRow($model,'quantity',array('class'=>'span5')); ?>

	<?php //echo $form->textFieldRow($model,'minimal_quantity',array('class'=>'span5','maxlength'=>10)); ?>

	<?php //echo $form->textFieldRow($model,'price',array('class'=>'span5','maxlength'=>20)); ?>

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

	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'submit', 'type'=>'primary', 'icon'=>'search white', 'label'=>'Search')); ?>
               <?php $this->widget('bootstrap.widgets.TbButton', array('buttonType'=>'button', 'icon'=>'icon-remove-sign white', 'label'=>'Reset', 'htmlOptions'=>array('class'=>'btnreset btn-small'))); ?>
	</div>

<?php $this->endWidget(); ?>


<?php $cs = Yii::app()->getClientScript();
$cs->registerCoreScript('jquery');
$cs->registerCoreScript('jquery.ui');
$cs->registerCssFile(Yii::app()->request->baseUrl.'/css/bootstrap/jquery-ui.css');
?>	
   <script>
	$(".btnreset").click(function(){
		$(":input","#search-product-form").each(function() {
		var type = this.type;
		var tag = this.tagName.toLowerCase(); // normalize case
		if (type == "text" || type == "password" || tag == "textarea") this.value = "";
		else if (type == "checkbox" || type == "radio") this.checked = false;
		else if (tag == "select") this.selectedIndex = "";
	  });
	});
   </script>


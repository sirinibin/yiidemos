<?php
$this->breadcrumbs=array(
	'Products'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List Product','url'=>array('index')),
	array('label'=>'Create Product','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
	return false;
});
$('.search-form form').submit(function(){
	$.fn.yiiGridView.update('product-grid', {
		data: $(this).serialize()
	});
	return false;
});
");
?>

<h1>Manage Products</h1>

<p>
You may optionally enter a comparison operator (<b>&lt;</b>, <b>&lt;=</b>, <b>&gt;</b>, <b>&gt;=</b>, <b>&lt;&gt;</b>
or <b>=</b>) at the beginning of each of your search values to specify how the comparison should be done.
</p>

<?php echo CHtml::link('Advanced Search','#',array('class'=>'search-button btn')); ?>
<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->

<?php $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'product-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id_product',
		'id_supplier',
		'id_manufacturer',
		'id_tax_rules_group',
		'id_category_default',
		'id_color_default',
		/*
		'on_sale',
		'online_only',
		'ean13',
		'upc',
		'ecotax',
		'quantity',
		'minimal_quantity',
		'price',
		'wholesale_price',
		'unity',
		'unit_price_ratio',
		'additional_shipping_cost',
		'reference',
		'supplier_reference',
		'location',
		'width',
		'height',
		'depth',
		'weight',
		'out_of_stock',
		'quantity_discount',
		'customizable',
		'uploadable_files',
		'text_fields',
		'active',
		'available_for_order',
		'condition',
		'show_price',
		'indexed',
		'cache_is_pack',
		'cache_has_attachments',
		'cache_default_attribute',
		'date_add',
		'date_upd',
		*/
		array(
			'class'=>'bootstrap.widgets.TbButtonColumn',
		),
	),
)); ?>

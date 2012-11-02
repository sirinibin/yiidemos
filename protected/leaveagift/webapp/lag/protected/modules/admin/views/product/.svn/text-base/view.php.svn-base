<?php
$this->breadcrumbs=array(
	'Products'=>array('index'),
	$model->id_product,
);
?>

<h1>View Product #<?php echo $model->id_product; ?></h1>
<hr />
<?php 
$this->beginWidget('zii.widgets.CPortlet', array(
	'htmlOptions'=>array(
		'class'=>''
	)
));
$this->widget('bootstrap.widgets.TbMenu', array(
	'type'=>'pills',
	'items'=>array(
		array('label'=>'Create', 'icon'=>'icon-plus', 'url'=>Yii::app()->controller->createUrl('create'), 'linkOptions'=>array()),
                array('label'=>'List', 'icon'=>'icon-th-list', 'url'=>Yii::app()->controller->createUrl('index'), 'linkOptions'=>array()),
                array('label'=>'Update', 'icon'=>'icon-edit', 'url'=>Yii::app()->controller->createUrl('update',array('id'=>$model->id_product)), 'linkOptions'=>array()),
		//array('label'=>'Search', 'icon'=>'icon-search', 'url'=>'#', 'linkOptions'=>array('class'=>'search-button')),
		array('label'=>'Print', 'icon'=>'icon-print', 'url'=>'javascript:void(0);return false', 'linkOptions'=>array('onclick'=>'printDiv();return false;')),
               // array('label'=>'Import', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('Imagesimport'), 'visible'=>true), 
                array('label'=>'Publish', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('publish',array('pid'=>$model->id_product)), 'visible'=>($model->is_published==0)?true:false),
               array('label'=>'UnPublish', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('publish',array('pid'=>$model->id_product)), 'visible'=>($model->is_published==1)?true:false,),
              array('label'=>'Mark Soldout', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('MakeSoldOut',array('pid'=>$model->id_product)), 'visible'=>($model->out_of_stock==0)?true:false),
               array('label'=>'UnMark Soldout', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('MakeSoldOut',array('pid'=>$model->id_product)), 'visible'=>($model->out_of_stock==1)?true:false,), 

)));
$this->endWidget();
?>
<div class='printableArea'>
<?php
$assetsDir = dirname(__FILE__).'/../../../../assets';


if(isset($model->product_lang->description))
{
$description=$model->product_lang->description;
}
else
{
$description="";
}

         /*Supplier logo*/
	

if(isset($model->categories[0]->lang[0]->name))
{

//$category=$model->categories[0]->id_category;
  $category=$model->categories[0]->lang[0]->name;
/* 
$category='bn';
 echo "<pre>";
 print_r($model->categories[0]->lang[0]->attributes);
 echo "</pre>";*/
}
else
{
 $category="NULL";
}

if(isset($model->tags[0]->name))
{
$tag=$model->tags[0]->name;
}
else
{
$tag='--';
}
if(isset($model->supplier->name))
{
$supplier=$model->supplier->name;
}
else
{
$supplier='--';
}




?>
<?php
$this->widget("ShowProduct",array("pid"=>$model->id_product));
?>

<?php 

$this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id_product',
                'position',
                array('name'=>'is sold out?','value'=>$model->getSoldOutStatus()),
              //  array('name'=>'Preview','type'=>'html','value'=>$this->widget("ShowProduct",array("pid"=>$model->id_product)) ),     
                array('name'=>'id_tag','value'=>$tag),
		array('name'=>'supplier name','value'=>$model->supplier->name),
                  array(
                       'name'=>'Supplier',
                       'type'=>'html',
                       'htmlOptions'=>array('width'=>'20','height'=>'500',),
                       //'value'=>$supplier.'<br/><img src="'.$supplier_logo_url.'" width="50" height="30" >',
                       'value'=>$model->getSupplier(),
                     ), 
                 array(
                       'name'=>'Brand',
                       'type'=>'html',
                       'htmlOptions'=>array('width'=>'20','height'=>'500',),
                       //'value'=>$brand.'<br/><img src="'.$brand_logo_url.'" width="50" height="30" >',
                       'value'=>$model->getBrand(),
                     ),  
                 
                array('name'=>'id_category','value'=>$category),
                array(
                       'name'=>'is_return_gift',
                       'type'=>'html',
                       'htmlOptions'=>array('width'=>'20','height'=>'500',),
                       'value'=>$model->getReturnGiftValue(),
 
                     ),
                array('name'=>'price','value'=>number_format($model->price,0,".","")),
                array('name'=>'product_value','value'=>number_format($model->product_value,0,".","")),
                array('name'=>'min_purchase','value'=>number_format($model->min_purchase,0,".","")),
                array('name'=>'User Validity','value'=>$model->user_validity." days."),  
                  'sender_limit',
                'receiver_limit',  
               /* array(
                       'name'=>'valid_till',
                       'type'=>'html',
                       'htmlOptions'=>array('width'=>'20','height'=>'500',),
                       'value'=>$model->redeem_valid_days,
 
                     ),*/
                  array(
                       'name'=>'features',
                       'type'=>'html',
                       'htmlOptions'=>array('width'=>'20','height'=>'500',),
                       'value'=>$model->features,
 
                     ),
                array('name'=>'description','value'=>$description), 
                 array(
                       'name'=>'Image(front end)',
                       'type'=>'html',
                      // 'htmlOptions'=>array('width'=>'20','height'=>'500',),
                       'value'=>$model->getImage(0,"html"),
                     ),
                 array(
                       'name'=>'Image(receiver end)',
                       'type'=>'html',
                      // 'htmlOptions'=>array('width'=>'20','height'=>'500',),
                       'value'=>$model->getImage(1,"html"),
                     ), 
           

		/*'id_manufacturer',
		'id_tax_rules_group',
		'id_category_default',
		'id_color_default',
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
		'cache_default_attribute',*/
		'date_add',
		'date_upd',
	),
)); 

?>

</div>

<style type="text/css" media="print">
body {visibility:hidden;}
.printableArea{visibility:visible;} 
</style>
<script type="text/javascript">
function printDiv()
{

window.print();

}
</script>

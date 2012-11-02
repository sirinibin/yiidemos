<?php
$this->breadcrumbs=array(
	'Product Templates'=>array('index'),
	$model->id_template,
);
?>

<h1>View ProductTemplate #<?php echo $model->id_template; ?></h1>
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
                array('label'=>'Update', 'icon'=>'icon-edit', 'url'=>Yii::app()->controller->createUrl('update',array('id'=>$model->id_template)), 'linkOptions'=>array()),
		//array('label'=>'Search', 'icon'=>'icon-search', 'url'=>'#', 'linkOptions'=>array('class'=>'search-button')),
		array('label'=>'Print', 'icon'=>'icon-print', 'url'=>'javascript:void(0);return false', 'linkOptions'=>array('onclick'=>'printDiv();return false;')),

)));
$this->endWidget();
?>
<?php 

$this->widget("PreviewTemplate",array('id'=>$model->id_template)); ?>
<div class='printableArea'>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id_template',
                 'name',
		array('name'=>'type','value'=>$model->tag->name),
		array('name'=>'Supplier','value'=>$model->supplier->name),
		array('name'=>'Brand','value'=>(isset($model->brand->name))?$model->brand->name:''),
		array('name'=>'Category','value'=>$model->category->category_lang->name),
		array('name'=>'logo_choice','value'=>$model->getLogoChoicevalue()),
		array('name'=>'is_return_gift','value'=>$model->getReturnGiftvalue()),
                'user_validity', 
		'description',
		'features',
 		'event',
                'sender_limit',
                'receiver_limit', 
                'redirection_url',
                array('name'=>'image1 (front end)','type'=>'html','value'=>$model->getTemplateImage(0,"html")),
                array('name'=>'image2 (receiver end)','type'=>'html','value'=>$model->getTemplateImage(1,"html")),
               
		'date_add',
		'date_upd',
	),
)); ?>
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

<?php
$this->breadcrumbs=array(
	'Vouchers'=>array('index'),
	$model->voucher_code,
);
?>

<h1>View Vouchers #<?php echo $model->voucher_code; ?></h1>
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
                array('label'=>'Update', 'icon'=>'icon-edit', 'url'=>Yii::app()->controller->createUrl('update',array('id'=>$model->voucher_code)), 'linkOptions'=>array()),
		//array('label'=>'Search', 'icon'=>'icon-search', 'url'=>'#', 'linkOptions'=>array('class'=>'search-button')),
		array('label'=>'Print', 'icon'=>'icon-print', 'url'=>'javascript:void(0);return false', 'linkOptions'=>array('onclick'=>'printDiv();return false;')),
                array('label'=>'Import', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('Excelimport'),'visible'=>true),

                array('label'=>'Activate', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('DeActivate',array('id'=>$model->id)), 'visible'=>($model->status==0)?true:false),

               array('label'=>'DeActivate', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('DeActivate',array('id'=>$model->id)), 'visible'=>($model->status!=0)?true:false),
              
               
	

)));
$this->endWidget();
?>
<div class='printableArea'>

<?php $this->widget('bootstrap.widgets.TbDetailView',array(
	'data'=>$model,
	'attributes'=>array(
		'id',
		'voucher_code',
		array(
                       'name'=>'Voucher value',
                       'value'=>$model->product->product_value,
                     ),
		'validity',
		array(
                       'name'=>'status',
                       'value'=>$model->getStatusText(),
                     ),
                array(
                      'name'=>'Product',
                      'value'=>$model->product->tags[0]->name,
                     ),
                array(
                      'name'=>'Product price',
                      'value'=>number_format($model->product->price,0,".",""),
                     ),
                array(
                      'name'=>'Product value(only for free gifts)',
                      'value'=>number_format($model->product->price,0,".",""),
                     ),
		'timestamp',
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

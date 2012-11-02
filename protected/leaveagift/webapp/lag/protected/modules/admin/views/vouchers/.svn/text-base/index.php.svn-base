<?php
$this->breadcrumbs=array(
	'Vouchers',
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
    $('.search-form').slideToggle('fast');
    return false;
});
$('.search-form form').submit(function(){
    $.fn.yiiGridView.update('vouchers-grid', {
        data: $(this).serialize()
    });
    return false;
});
");

?>

<h1>Vouchers</h1>
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
                array('label'=>'List', 'icon'=>'icon-th-list', 'url'=>Yii::app()->controller->createUrl('index'),'active'=>true, 'linkOptions'=>array()),
		array('label'=>'Search', 'icon'=>'icon-search', 'url'=>'#', 'linkOptions'=>array('class'=>'search-button')),
		array('label'=>'Export to PDF', 'icon'=>'icon-download', 'url'=>Yii::app()->controller->createUrl('GeneratePdf'), 'linkOptions'=>array('target'=>'_blank'), 'visible'=>true),
		array('label'=>'Export to Excel', 'icon'=>'icon-download', 'url'=>Yii::app()->controller->createUrl('GenerateExcel'), 'linkOptions'=>array('target'=>'_blank'), 'visible'=>true),
                array('label'=>'Import', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('Excelimport'),'visible'=>true),
	),
));
$this->endWidget();
?>



<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->


<?php $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'vouchers-grid',
	'dataProvider'=>$model->search(),
        'type'=>'striped bordered condensed',
        'template'=>'{summary}{pager}{items}{pager}',
	'columns'=>array(
		//'id',
		'voucher_code',
                'value',
		array(
                      'name'=>'id_product',
                      'value'=>'isset($data->product->tags[0]->name)?$data->product->tags[0]->name:""',
                     ),
		
		'validity',
		array(
                       'name'=>'status',
                       'value'=>'$data->getStatusText();', 
                     ),
		/*
		'timestamp',
		*/
       array(
            'class'=>'bootstrap.widgets.TbButtonColumn',
			'template' => '{deactivate} {activate} {view} {update} {delete}',
			'buttons' => array(
                              'deactivate' => array(
                                        'visible'=>'($data->status!=0)?true:false ',
					'label'=> 'DeActivate',
                                        'url'=>'Yii::app()->createUrl("admin/vouchers/deActivate",array("id"=>$data->id))',
					'options'=>array(
						'class'=>'btn btn-danger'
					)
				),
                             'activate' => array(
                                        'visible'=>'($data->status==0)?true:false ',
					'label'=> 'Activate',
                                        'url'=>'Yii::app()->createUrl("admin/vouchers/deActivate",array("id"=>$data->id))',
					'options'=>array(
						'class'=>'btn btn-success'
					)
				),
			      'view' => array(
					'label'=> 'View',
					'options'=>array(
						'class'=>'btn btn-small view'
					)
				),
                              	
                              'update' => array(
					'label'=> 'Update',
					'options'=>array(
						'class'=>'btn btn-small update'
					)
				),
				'delete' => array(
					'label'=> 'Delete',
					'options'=>array(
						'class'=>'btn btn-small delete'
					)
				)
			),
            'htmlOptions'=>array('style'=>'width: 115px'),
           )
	),
)); ?>


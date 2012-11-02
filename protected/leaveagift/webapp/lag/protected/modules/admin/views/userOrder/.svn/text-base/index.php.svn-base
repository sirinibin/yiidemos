<?php
$this->breadcrumbs=array(
	'User Orders',
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
    $('.search-form').slideToggle('fast');
    return false;
});
$('.search-form form').submit(function(){
    $.fn.yiiGridView.update('user-order-grid', {
        data: $(this).serialize()
    });
    return false;
});
");

?>

<h1>User Orders</h1>
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
		//array('label'=>'Create', 'icon'=>'icon-plus', 'url'=>Yii::app()->controller->createUrl('create'), 'linkOptions'=>array()),
                array('label'=>'List', 'icon'=>'icon-th-list', 'url'=>Yii::app()->controller->createUrl('index'),'active'=>true, 'linkOptions'=>array()),
		array('label'=>'Search', 'icon'=>'icon-search', 'url'=>'#', 'linkOptions'=>array('class'=>'search-button')),
		array('label'=>'Export to PDF', 'icon'=>'icon-download', 'url'=>Yii::app()->controller->createUrl('GeneratePdf'), 'linkOptions'=>array('target'=>'_blank'), 'visible'=>true),
		array('label'=>'Export to Excel', 'icon'=>'icon-download', 'url'=>Yii::app()->controller->createUrl('export'), 'linkOptions'=>array('target'=>'_blank'), 'visible'=>true),
	),
));
$this->endWidget();
?>


<?php
/*$form=$this->beginWidget('CActiveForm', array(
    'id'=>'page-form',
    'enableAjaxValidation'=>true,
));
*/
?>
 <!--
<b>From :</b>
-->
<?php
/*
$this->widget('zii.widgets.jui.CJuiDatePicker', array(
    'name'=>'from_date',  // name of post parameter
    'value'=>(isset(Yii::app()->request->cookies['from_date'])) ? Yii::app()->request->cookies['from_date']->value : '',  // value comes from cookie after submittion
     'options'=>array(
        'showAnim'=>'fold',
        //'dateFormat'=>'yy-mm-dd',
        'dateFormat'=>'yy-mm-dd',  
    ),
    'htmlOptions'=>array(
        'style'=>'height:20px;'
    ),
));
*/
?>
<!--
<b>To :</b>
-->
<?php
/*
$this->widget('zii.widgets.jui.CJuiDatePicker', array(
    'name'=>'to_date',
   'value'=>(isset(Yii::app()->request->cookies['to_date'])) ? Yii::app()->request->cookies['to_date']->value : '',
     'options'=>array(
        'showAnim'=>'fold',
        //'dateFormat'=>'yy-mm-dd',
         'dateFormat'=>'yy-mm-dd',  
 
    ),
    'htmlOptions'=>array(
        'style'=>'height:20px;'
    ),
));
*/
?>
<?php //echo CHtml::submitButton('Go'); ?> 
<?php //$this->endWidget(); ?>



<div class="search-form" style="display:none">
<?php $this->renderPartial('_search',array(
	'model'=>$model,
)); ?>
</div><!-- search-form -->


<?php $this->widget('bootstrap.widgets.TbGridView',array(
	'id'=>'user-order-grid',
	'dataProvider'=>$model->search(),
        'type'=>'striped bordered condensed',
        'template'=>'{summary}{pager}{items}{pager}',
	'columns'=>array(
	          array('name'=>'date_add','value'=>'date("M-d-Y",strtotime($data->date_add))'),
		'id_user_gift',
		//'id_cart',
		  array(
                        'name'=>'Product',
                        'type'=>'html',
                        'value'=>'$data->getProductType("link")',
                       ),
                  array(
                        'name'=>'Ordered by',
                         'type'=>'html',
                        'value'=>'$data->getSender()',
                       ),
                 array(
                        'name'=>'Receiver',
                         'type'=>'html',
                        'value'=>'$data->getReceiver()',
                       ),
                 array(
                        'name'=>'delivery date',
                        'value'=>'$data->getDeliveryDate()',
                      ),
                array(
                        'name'=>'order_status',
                        'value'=>'$data->order_status',
                      ),
		//'receiver_fbid',
		//'receiver_fbfirstname',
		/*
		'receiver_fbemail',
		'notify_email',
		'img_url',
		'message_card',
		'message_post',
		'title',
		'delivery_date',
		'greeting',
		'gift_opened',
		'gift_rating',
		'facebook_postid',
		'post_email_status',
		'thankyouid',
		'date_add',
		'date_upd',
		*/
       array(
            'class'=>'bootstrap.widgets.TbButtonColumn',
			'template' => '{view}{delete}',
			'buttons' => array(
			      'view' => array(
					'label'=> 'View',
					'options'=>array(
						'class'=>'btn btn-small view'
					)
				),	
                            /*  'update' => array(
					'label'=> 'Update',
					'options'=>array(
						'class'=>'btn btn-small update'
					)
				),*/
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


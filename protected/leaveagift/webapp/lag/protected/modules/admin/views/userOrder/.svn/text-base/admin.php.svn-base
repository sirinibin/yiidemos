<?php
$this->breadcrumbs=array(
	'User Orders'=>array('index'),
	'Manage',
);

$this->menu=array(
	array('label'=>'List UserOrder','url'=>array('index')),
	array('label'=>'Create UserOrder','url'=>array('create')),
);

Yii::app()->clientScript->registerScript('search', "
$('.search-button').click(function(){
	$('.search-form').toggle();
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

<h1>Manage User Orders</h1>

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
	'id'=>'user-order-grid',
	'dataProvider'=>$model->search(),
	'filter'=>$model,
	'columns'=>array(
		'id_user_gift',
		'id_cart',
		'id_product',
		'id_user',
		'receiver_fbid',
		'receiver_fbfirstname',
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
		),
	),
)); ?>

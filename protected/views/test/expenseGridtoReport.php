<style>
tr th {
	font-weight:bold;
	border-bottom:1px solid blue;
}

.even {
	background-color:#EFEFEF;
}
</style>

<?php $this->widget('bootstrap.widgets.BootGridView',array(
        'type'=>'striped',
	'dataProvider'=>$dataProvider,
	'template'=>"{items}",
	'columns'=>array(
         array(
        		'name'=>'id',
        		'sortable'=>false,
        		'value'=>'$data->id',
         		'headerHtmlOptions'=>array('width'=>'80'),
         		'htmlOptions'=>array('width'=>'80'),
        
             ),     
         array(
        		'name'=>'name',
        		'sortable'=>false,
        		'value'=>'$data->name',
         		'headerHtmlOptions'=>array('width'=>'80'),
         		'htmlOptions'=>array('width'=>'80'),
        
             ),     
         array(
        		'name'=>'age',
        		'sortable'=>false,
        		'value'=>'$data->age',
         		'headerHtmlOptions'=>array('width'=>'80'),
         		'htmlOptions'=>array('width'=>'80'),
        
             ),     
	),
)); ?>

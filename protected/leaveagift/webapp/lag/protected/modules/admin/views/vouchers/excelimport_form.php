<?php
/* @var $this VoucherExcelImportFormController */
/* @var $model VoucherExcelImportForm */
/* @var $form CActiveForm */
?>
<h1>Import Vouchers</h1>
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
		//array('label'=>'Search', 'icon'=>'icon-search', 'url'=>'#', 'linkOptions'=>array('class'=>'search-button')),
		//array('label'=>'Export to PDF', 'icon'=>'icon-download', 'url'=>Yii::app()->controller->createUrl('GeneratePdf'), 'linkOptions'=>array('target'=>'_blank'), 'visible'=>true),
		//array('label'=>'Export to Excel', 'icon'=>'icon-download', 'url'=>Yii::app()->controller->createUrl('GenerateExcel'), 'linkOptions'=>array('target'=>'_blank'), 'visible'=>true),
                array('label'=>'Import', 'icon'=>'icon-upload', 'url'=>Yii::app()->controller->createUrl('excelimport'),'active'=>true, 'visible'=>true), 
	),
));
$this->endWidget();

?>

<div class="form">

<?php

   $form=$this->beginWidget('bootstrap.widgets.TbActiveForm',array(
	'id'=>'excel-import-form-excelimport_form-form',
	'enableAjaxValidation'=>false,
        'method'=>'post',
	'type'=>'horizontal',
	'htmlOptions'=>array(
		'enctype'=>'multipart/form-data'
	)
));


?>

	<fieldset>
<?php

 $assetsDir = dirname(__FILE__).'/../../../../assets'; 
 $samplefile=Yii::app()->assetManager->publish(
          $assetsDir.'/images/sample.xls');

?>
          <!-- <a href="<?php echo $samplefile; ?>" >Download sample excel file</a> -->
		<legend>
			<p class="note">Fields with <span class="required">*</span> are required.</p>
		</legend>

	<?php echo $form->errorSummary($model,'Opps!!!', null,array('class'=>'alert alert-error span12')); ?>
    <div class="control-group">		
			<div class="span4">
             <?php echo $form->dropDownListRow($model,'id_supplier',$model->getSupplierOptions(),
        array(
            'empty'=>array(''=>'Select a supplier'),
            'onchange'=>'generateExcel(this.value);',
           /* 'ajax'=>array(
             'type'=>'POST',
             'url'=>CController::createUrl('vouchers/productlist'),
             'update'=>'#VoucherExcelImportForm_id_product',
             /*'success'=>'js:function(data){
                              alert(data);    
                           }',
             /* 'error'=>'js:function(data){
                              alert("error");  
                              printObject(data);  
                           }'*/
             //)

           ));  ?>

        <?php /*echo $form->dropDownListRow($model,'id_supplier',$model->getSupplierOptions(),
        array(
            'empty'=>array(''=>'Select a supplier'),
            'ajax'=>array(
             'type'=>'POST',
             'url'=>CController::createUrl('vouchers/productlist'),
             'update'=>'#VoucherExcelImportForm_id_product',
             /*'success'=>'js:function(data){
                              alert(data);    
                           }',
             /* 'error'=>'js:function(data){
                              alert("error");  
                              printObject(data);  
                           }'*/
            /* )

           ));*/ ?>
        <?php //echo $form->dropDownListRow($model,'id_product',array(),array('empty'=>array(''=>'choose a product'),)); ?>
  
        <?php echo $form->fileFieldRow($model,'excel'); ?>

    </div>   
  <script> 
  function generateExcel(value)
  {
    if(value=="")
    return; 
    window.location='<?php echo Yii::app()->createAbsoluteUrl("admin/vouchers/GenerateImportFormat",array("sid"=>"")); ?>/'+value;
  }
  </script>
  </div>
	<div class="form-actions">
		<?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'submit',
			'type'=>'primary',
                        'icon'=>'ok white',  
			'label'=>'Upload',
		)); ?>
              <?php $this->widget('bootstrap.widgets.TbButton', array(
			'buttonType'=>'reset',
                        'icon'=>'remove',  
			'label'=>'Reset',
		)); ?>
	</div>

</fieldset>
<?php $this->endWidget(); ?>

</div><!-- form -->

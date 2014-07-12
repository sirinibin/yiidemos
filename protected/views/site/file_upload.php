<h2>Upload Excel files</h2>
<a href="<?php echo Yii::app()->baseUrl."/Excel_import_sample.xls"; ?>" target="_blank">Download Sample Excel file</a>
<a href="<?php echo Yii::app()->baseUrl."/samplePowerPoint.pptx"; ?>" target="_blank">Download Sample pptx file</a>
<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'file-upload-file_upload-form',
	 'htmlOptions'=>array(
                       'enctype'=>'multipart/form-data'
         ),
         'method'=>'post',
	'enableAjaxValidation'=>false,
)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>

	<div class="row">
		<?php echo $form->labelEx($model,'file'); ?>
		<?php echo $form->fileField($model,'file'); ?>
		<?php echo $form->error($model,'file'); ?>
	</div>

        <br/>
	<div class="row buttons">
		<?php echo CHtml::submitButton('Upload'); ?>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
<?php
 foreach($sheets as $k=>$sheet)
 {
   echo "<h3>Sheet".($k+1)."</h3>"
   ?>
     <table border="1">
       <?php
          for($i=0;$i<count($columns);$i++)
          {
           echo "<th>".$columns[$i+1]."</th>";
          }
         ?>
         <?php
         
          foreach($sheet as $k2=>$row)
          {
            
              echo "<tr>";
            
             foreach($row as $k3=>$value)
             {
                echo "<td>".$value."</td>";
               
             }  
           
              echo "</tr>";
            
            
          }
          
         ?>
     </table>
   <?php
 }
?>
<?php
 foreach($slides as $k=>$slide)
 {
   echo "<h3>Slide".($k+1)."</h3>"
   ?>
     <table border="1">
         <th>Header</th>
         <th>Content</th>
         <?php
         echo "<tr>";
        
          foreach($slide as $k2=>$value)
          {
         
                echo "<td>".$value."</td>";
       
            
          }
           echo "</tr>";
          
         ?>
     </table>
   <?php
 }
?>
 <h3>JSON</h3>
 <?php
 echo "<pre>";
 
  if(count($sheets)>0)
   echo json_encode($sheets,JSON_PRETTY_PRINT);
  if(count($slides)>0)
   echo json_encode($slides,JSON_PRETTY_PRINT);
 echo "</pre>";
 ?>
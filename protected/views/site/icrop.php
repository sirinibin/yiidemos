<?php
$filename='689x1000.jpg';
$filename2='images.jpeg';
 $assetsDir = dirname(__FILE__).'/../../assets'; 

 //$filepath=
 // $filepath=$assetsDir."/".$filename;
  $filepath=$assetsDir."/".$filename2;
  
 
  $file= Yii::app()->assetManager->publish($filepath);

$this->widget("Icrop",array('img_url'=>$file));

?>
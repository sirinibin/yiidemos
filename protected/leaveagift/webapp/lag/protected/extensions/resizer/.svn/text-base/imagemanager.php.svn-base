<?

class imagemanager{

Yii::import('application.extensions.image.Image');
Yii::import("ext.S3.*");

public function resizeimage($path,$width,$height,$rotate,$quality,$sharpen,$newname)



$image = new Image($path);

$image->resize($height, $width)->rotate($rotate)->quality($quality)->sharpen($sharpen);

$temp=$_SERVER['DOCUMENT_ROOT'].'temp/s3temp/'.$newname;

$image->save($temp);


return $temp;

}

public function imageupload($path,$newname,$folder)
{
$success = Yii::app()->s3->upload( $temp ,$folder.'/'.$newname, 'lagdev' );

}




}

?>

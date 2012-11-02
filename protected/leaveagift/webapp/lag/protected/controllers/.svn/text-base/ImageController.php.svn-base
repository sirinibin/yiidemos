<?

class ImageController extends AuthController{

public $layout="main";
public function actionImage()
{
//$image_path="https://localhost".Yii::app()->request->baseUrl."/images/";
//$image_path=Yii::app()->request->baseUrl;

//echo $image_path;



if(isset($_REQUEST['width'])) $width=$_REQUEST['width']; else $width=100;

if(isset($_REQUEST['height'])) $height=$_REQUEST['height']; else $height=100;

if(isset($_REQUEST['rotate'])) $rotate=$_REQUEST['rotate']; else $rotate=0;

if(isset($_REQUEST['quality'])) $quality=$_REQUEST['quality']; else $quality=100;

if(isset($_REQUEST['sharpen'])) $sharpen=$_REQUEST['sharpen']; else $sharpen=0;

if(isset($_REQUEST['name'])) $imagename=$_REQUEST['name']; else $imagename='';

//$assetsDir = dirname(__FILE__).'/../assets/images/s3temp/';

//$dir=Yii::app()->assetManager->publish($assetsDir.$imagename);

//echo $dir;

Yii::import('application.extensions.image.Image');
Yii::import("ext.S3.*");

$image_path='/usr/share/nginx/www/leaveagift_jaideep/protected/assets/images/s3temp/test.jpg';

$image = new Image($image_path);

$image->resize($height, $width)->rotate($rotate)->quality($quality)->sharpen($sharpen);

$newpath='/usr/share/nginx/www/leaveagift_jaideep/protected/assets/images/s3temp/test.jpg_'.$height.'_'.$width.'.jpg';

$newpath1='https://s3-ap-southeast-1.amazonaws.com/lagdev/uploaded/test.jpg_'.$height.'_'.$width.'.jpg';

$image->save($newpath);



Yii::import("ext.S3.*");

// upload the original version
$success = Yii::app()->s3->upload( $newpath , 'uploaded/test.jpg_'.$height.'_'.$width.'.jpg', 'lagdev' );

$this->render('1',array('image'=>$newpath1,));

}




}

?>

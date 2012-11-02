<?
 class McryptController extends CController
{

//public $encrypt;
//$encrypt=new CSecurityManager;

public function actionCall()
{
$string=$_REQUEST['string'];
$key=$this->keygen();
//$key=rand();
$encrypted=$this->encryptnow($string,$key);
$decrypted=$this->decryptnow($encrypted,$key);

echo " initial string is = ".$string." and key is =".$key." and encryped value is = ".$encrypted." and decrypted value is = ".$decrypted."</br>";

$this->newinsert('Voucher','voucher_code',$key);




}
 private function encryptnow($string,$key)
{
			$encrypt=new CSecurityManager;
			$s1=$encrypt->encrypt($string,$key);
			return($s1);
}

private function decryptnow($string,$key)
{
			$decrypt=new CSecurityManager;
			$s2=$decrypt->decrypt($string,$key);
			return($s2);
}

private function keygen()
{
$key=rand();
return $key;
}

private function newinsert($model,$column,$value)
{
$newmodel=new $model;
$newmodel->$column=$value;
 if($newmodel->save(false))
 {
    echo 'saved';
 }
}

private function oldupdate($model,$column,$value,$search)
{
$newmodel=$model::model()->findbyPk($search);
$newmodel->$column=$value;
 if($newmodel->save(false))
 {
    echo 'saved';
 }
}

/*  following is the code using mcrypt library of php--- we are not using it as of now */

/*
public function actionCodeid()
{
$string=$_REQUEST['string'];

$myEncryptedString = Yii::app()->encrypter->encrypt($string);
$myDecryptedString = Yii::app()->encrypter->decrypt($myEncryptedString);

$newurl=yii::app()->createAbsoluteUrl('mcrypt/codeid',array('string'=>$myEncryptedString));
$newurl2=yii::app()->createAbsoluteUrl('mcrypt/codeid',array('string'=>$myDecryptedString));

echo "original string is:".$string;
echo "</br>";
echo "encrypted string is: ".$myEncryptedString;
echo "</br>";
echo "Decrypted string is: ".$myDecryptedString;
echo "</br>";
echo "forword url=".$newurl."</br>";
echo "backword url=".$newurl2."</br>";
}
*/

}
?>


<?

require_once(dirname(__FILE__).'/../extensions/facebook/fb-php-sdk/facebook.php');
 class TestmailController extends CController
 {
 
 public function actionSearch()
 {
       $facebook = new Facebook(array(
  		'appId'  => Yii::app()->params["facebook_appId"],
  		'secret' => Yii::app()->params["facebook_appSecret"],
		'cookie' => true,
		));

		

	$data = $facebook->api( array(
			 'method' => 'fql.query',
			 'query' => 'SELECT uid,name,pic,birthday_date,current_location,sex,education FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1=1220500771)',
			 'access_token'=>'AAAFZCJyKdfz8BABIlKh4jWbPMv2IZCkeEmDRlEmYX9GeJAujL6O3sTLaG09h8W4aGnZAnGBRGO54CrqFQzAuBduZAOONuj25oyMFGkETsgZDZD',
		     ));
		     
		     echo "<pre>";
		     print_r($data);
		     echo "</pre>";
 }
 
 
 
 }
?>
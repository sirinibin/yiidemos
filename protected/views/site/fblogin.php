
<?php
define('FACEBOOK_APP_ID', Yii::app()->params['fb_app_id']);
define('FACEBOOK_SECRET', Yii::app()->params['fb_app_secret']);

function parse_signed_request($signed_request, $secret) {
  list($encoded_sig, $payload) = explode('.', $signed_request, 2); 

  // decode the data
  $sig = base64_url_decode($encoded_sig);
  $data = json_decode(base64_url_decode($payload), true);

  if (strtoupper($data['algorithm']) !== 'HMAC-SHA256') {
    error_log('Unknown algorithm. Expected HMAC-SHA256');
    return null;
  }

  // check sig
  $expected_sig = hash_hmac('sha256', $payload, $secret, $raw = true);
  if ($sig !== $expected_sig) {
    error_log('Bad Signed JSON signature!');
    return null;
  }

  return $data;
}

function base64_url_decode($input) {
    return base64_decode(strtr($input, '-_', '+/'));
}

if(isset($_REQUEST['signed_request'])) {
  $response = parse_signed_request($_REQUEST['signed_request'], FACEBOOK_SECRET);

 // print_r($response);
 //if(isset($response['user_id']))
//echo 'userId: '.$response['user_id'].'<br/>';
//echo 'name: '.$response['registration']['name'].'<br/>';
//echo 'email: '.$response['registration']['email'].'<br/>';
//echo 'password: '.$response['registration']['password'].'<br/>';
/*
$emailVeri=User::model()->find('email=:email',array(':email'=>$response['registration']['email']));
$user=new User;

if(isset($emailVeri->id))
	$user=$emailVeri;
*/
if(isset($response['user_id']))
{
 /*
	$user->fbid=$response['user_id'];
	$fbVeri=User::model()->find('fbid=:fbid',array(':fbid'=>$response['user_id']));

	if(isset($fbVeri->id))
		$user=$fbVeri;
   */

}
/*
$user->name=$response['registration']['name'];
$user->email=$response['registration']['email'];
$user->password=md5($response['registration']['password']);
$user->create_time=date("Y-m-d h:m:s");
*/
//if(isset($fbVeri->id)&&isset($emailVeri->id)&&$fbVeri->id!=$emailVeri->id)
//	$this->redirect(array('site/login','response'=>'2 separate email & facebook accounts'));
//else
//$user->save(false);

} else {
  echo '$_REQUEST is empty';
}
$this->redirect(array('site/index'));
?>

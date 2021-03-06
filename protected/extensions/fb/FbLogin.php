<?php

class FbLogin extends CWidget
{
	public $appId,$secretId,$regLink=array('site/login'),$logintable=NULL,$loginfield=NULL;
	private $_identity;
	public function run()
	{

//Yii::import('ext.fb.facebook');

//define('YOUR_APP_ID', $this->appId);
//define('SECRET_ID', $this->secretId);

//uses the PHP SDK.  Download from https://github.com/facebook/php-sdk
require_once 'facebook.php';

$facebook = new Facebook(array(
  'appId'  => $this->appId,
  'secret' => $this->secretId,
));

$userId = $facebook->getUser();

?>


  
    <?php if ($userId) { 
      $userInfo = $facebook->api('/'.$userId); 
	if(isset($userInfo['id']))
	{
	echo '&nbsp'.CHtml::image('http://graph.facebook.com/'.$userInfo['id'].'/picture','',array('width'=>'30px','height'=>'30px'));
	if($this->logintable!=NULL&&$this->loginfield!=NULL)
	{
	$model=new $this->logintable;
	$model=$model->find($this->loginfield.'= :uid',array(':uid'=>$userInfo['id']));
	}
	//echo $model->fbid;
	if(isset($model->id)||$this->logintable==NULL||$this->loginfield==NULL)
	{
	echo '&nbsp;'.CHtml::ajaxLink('logout(<b>'.substr($userInfo['first_name'],0,12).'</b>)', Yii::app()->createUrl('site/logout'), array('success'=>'FB.logout(function(response) {  window.location.reload();})'));
	}
	else
	{
		echo '&nbsp;'.CHtml::link('<b>Register as '.substr($userInfo['first_name'],0,10).'?</b>', $this->regLink);
		echo '&nbsp;'.CHtml::ajaxLink('<b>(logout)</b>', Yii::app()->createUrl('site/logout'), array('success'=>'FB.logout(function(response) {  window.location.reload();})'));
	}
	?>
      </div>       
    <?php
    if(isset($userInfo['id']))
    {
    if($this->_identity===null)
		{
			//$this->fbId=$userInfo['id'];
			$this->_identity=new UserIdentity($userInfo['id'],'');
			$this->_identity->fbauthenticate();
		}
		if($this->_identity->errorCode===UserIdentity::ERROR_NONE)
		{
			//$duration=$this->rememberMe ? 3600*24*30 : 0; // 30 days
			Yii::app()->user->login($this->_identity,0);
			
		}
    }
    }
    } else { 

//    		Yii::app()->user->logout();
    ?>
    <div id="fb-root"></div>
    <fb:login-button></fb:login-button>
    <?php } ?>
    <script>
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '<?php echo $this->appId ?>',
          status     : true, 
          cookie     : true,
          xfbml      : true,
          oauth      : true,
        });

        FB.Event.subscribe('auth.login', function(response) {
          window.location.reload();
        });
      };
	

      (function(d){
         var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
         js = d.createElement('script'); js.id = id; js.async = true;
         js.src = "//connect.facebook.net/en_US/all.js";
         d.getElementsByTagName('head')[0].appendChild(js);
       }(document));
    </script>
	
	<?php
      }
}

?>

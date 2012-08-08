<?php
$facebook = new Facebook(array(
  'appId'  => Yii::app()->params['fb_app_id'],
  'secret' => Yii::app()->params['fb_app_secret'],          
));

$userId = $facebook->getUser();

echo "user id:".$userId;
?>
    <div id="fb-root"></div>
    <?php if ($userId) { 
      $userInfo = $facebook->api('/' + $userId); ?>
      Welcome <?= $userInfo['name'] ?>
    <?php } else { ?>
    <fb:login-button></fb:login-button>
    <?php } ?>


        <script>
          window.fbAsyncInit = function() {
            FB.init({
              appId      : '<?php echo Yii::app()->params["fb_app_id"]; ?>', // App ID
              channelUrl : '//WWW.yiidemos.pagodabox.com/', // Channel File
              status     : true, // check login status
              cookie     : true, // enable cookies to allow the server to access the session
              xfbml      : true  // parse XFBML
            });
        FB.Event.subscribe('auth.login', function(response) {
          window.location.reload();
        });
          };
          // Load the SDK Asynchronously
          (function(d){
             var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
             if (d.getElementById(id)) {return;}
             js = d.createElement('script'); js.id = id; js.async = true;
             js.src = "//connect.facebook.net/en_US/all.js";
             ref.parentNode.insertBefore(js, ref);
           }(document));
        </script>

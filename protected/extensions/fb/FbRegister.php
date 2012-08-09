<?php
//Yii::import('ext.fb.facebook');
class FbRegister extends CWidget
{
	public $appId;
	public function run()
	{
//		define('YOUR_APP_ID', $this->appId);
	
		?>
 <html>
    <head>
      <title>My Facebook Login Page</title>
    </head>
    <body>
      <div id="fb-root"></div>
      <script>
        window.fbAsyncInit = function() {
          FB.init({
            appId      : '<?php echo $this->appId;?>',
            status     : true, 
            cookie     : true,
            xfbml      : true,
            oauth      : true,
          });
        };
        (function(d){
           var js, id = 'facebook-jssdk'; if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/en_US/all.js";
           d.getElementsByTagName('head')[0].appendChild(js);
         }(document));
      </script>
    <!--  <div class="fb-login-button">login</div>-->
     <div 
        class="fb-registration" 
        data-fields="[{'name':'name'}, {'name':'email'},{'name':'password'}]" 
        data-redirect-uri="<?php echo Yii::app()->request->hostInfo.Yii::app()->request->baseUrl;?>/index.php?r=site/fblogin">
      </div>
    </body>
 </html> <?php	
	}
}

?>
<?php
/* @var $this SiteController */

$this->pageTitle=Yii::app()->name;
?>



  <div id="fb-root"></div>
<script>
	 // Load the SDK Asynchronously
      (function(d){
         var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
         if (d.getElementById(id)) {return;}
         js = d.createElement('script'); js.id = id; js.async = true;
         js.src = "//connect.facebook.net/en_US/all.js";
         ref.parentNode.insertBefore(js, ref);
       }(document));

      // Init the SDK upon load
      window.fbAsyncInit = function() {
        FB.init({
          appId      : '421281037909823', // App ID
          channelUrl : '//'+window.location.hostname+'/channel', // Path to your Channel File
          status     : true, // check login status
          cookie     : true, // enable cookies to allow the server to access the session
          xfbml      : true,  // parse XFBML
		  oauth		 : true
        });
    
	 // listen for and handle auth.statusChange events
     FB.Event.subscribe('auth.statusChange', function(response) {
          if (response.authResponse) {
            // user has auth'd your app and is logged into Facebook
            FB.api('/me?fields=id,name,picture', function(me){
              if (me) {
			    document.getElementById('auth-displayname').innerHTML = me.name;
				document.getElementById('img-user').src = me.picture.data.url;
				var submitForm = document.getElementById('user-form');
				
              }
            })
			FB.api('/me/friends?fields=id,name,picture', function (response) {
			   
			   //alert(JSON.stringify(response));
			   for(var obj in response.data)
			   {
			        var frameDiv = document.createElement("div");
					frameDiv.setAttribute("class",'fb-friend-frame');
					var newDiv = document.createElement("div");
					newDiv.setAttribute("class",'fb-friend-photo');
					newDiv.innerHTML = "<a href='#'><img alt='' width='104' height='140' border=\"0\" src='"+response.data[obj].picture.data.url+"'></img>";
					
					var nameDiv = document.createElement("div");
					nameDiv.setAttribute("class",'fb-friend-name');
					nameDiv.innerHTML = response.data[obj].name;
					frameDiv.appendChild(newDiv);
					frameDiv.appendChild(nameDiv);
					document.getElementById('friendslist').appendChild(frameDiv);
			   }
			   
			})

            document.getElementById('auth-loggedin').style.display = 'block';
          } else {
            // user has not auth'd your app, or is not logged into Facebook
            document.getElementById('auth-loggedin').style.display = 'none';
          }
        });
		 
		}
</script>


    <div id="content">
        <div class="form" >
	  
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'user-form',
	'enableClientValidation'=>true,
	'clientOptions'=>array(
		'validateOnSubmit'=>true,
	),
)); ?>
        <h1>LeaveAGift</h1>
		<div class="fb-login-button" scope="email,read_friendlists,publish_stream">Connect To Facebook</div>
		<input type="submit" style="visibility:hidden">
		<?php $this->endWidget(); ?>
</div><!-- form -->		
		<div id="auth-loggedin" style="display:none">
          Hi, <span id="auth-displayname"></span>  
		   <img id="img-user" src=""/>
        
      </div> 
	 
		<div id="friendslist" class="fb-friends-list">
		</div>
	</div>
                   
                 
  

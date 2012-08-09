<?php
/**
 * class Facebook
 * @author Igor Ivanović 
 */
class FacebookLogin extends CWidget{

    public $appId;
    public $status = true;
    public $cookie = true;
    public $xfbml  = true;
    public $oauth  = true;
    public $userSession;
    public $facebookButtonTitle = "Login";
    public $fbLoginButtonId     = "fb_login_button_id";  
    public $fbLoginButtonClass  ="fb-login-button";
    public $logoutButtonId      = "your_logout_button_id";
    public $facebookLoginUrl    ="site/index";
    public $facebookPermissions = "email,user_likes";
    
	
    /**
    * Run Widget
    */
    public function run()
    {
        $this->facebookLoginUrl     = Yii::app()->createAbsoluteUrl($this->facebookLoginUrl);
        $this->userSession          = Yii::app()->session->sessionID;
        $this->renderJavascript();
        $this->render('login');
    }
    
    
    /**
    * Render necessary facebook  javascript
    */
    private function renderJavascript()
    {
$script=<<<EOL
        window.fbAsyncInit = function() {
            FB.init({   appId: '{$this->appId}', 
                        status: {$this->status}, 
                        cookie: {$this->cookie},
                        xfbml: {$this->xfbml},
                        oauth: {$this->oauth}
            });

            function updateButton(response) {

                var b = document.getElementById("{$this->fbLoginButtonId}");
               
                    b.onclick = function(){
                        FB.login(function(response) {
                                    if(response.authResponse) {
                                            FB.api('/me', function(user) {
                                                $.ajax({
 
                                                    type : 'get',
                                                    url  : '{$this->facebookLoginUrl}',
                                                    data : ( { 
                                                        name     :   user.first_name, 
                                                        surname  :   user.last_name,
                                                        username :   user.username,
                                                        id       :   user.userID, 
                                                        email    :   user.email, 
                                                        session  :   "{$this->userSession}" 
                                                    } ),
                                                    dataType : 'json',
                                                    success : function( data ){
                                                    alert("ok");
                                                        if( data.error == 0){
                                                            window.location.href = data.redirect;
                                                        }else{
                                                            alert( data.error );
                                                            FB.logout();
                                                        }
                                                    }
                                                });

                                            });	   
                                    }
                        }, {scope: '{$this->facebookPermissions}'});	
                    }
                
            }
                        
            FB.getLoginStatus(updateButton);
            FB.Event.subscribe('auth.statusChange', updateButton);	

            var c = document.getElementById("{$this->logoutButtonId}");
            if(c){
                c.onclick = function(){
                    FB.logout();
                }
            }
        };
        
        
        (function(d){var e,id = "fb-root";if( d.getElementById(id) == null ){e = d.createElement("div");e.id=id;d.body.appendChild(e);}}(document));
        (function(d){var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];if (d.getElementById(id)) {return;} js = d.createElement('script'); js.id = id; js.async = true; js.src = "//connect.facebook.net/en_US/all.js"; ref.parentNode.insertBefore(js, ref); }(document));
EOL;

        Yii::app()->clientScript->registerScript('facebook-connect',$script,  CClientScript::POS_END );
    }
}

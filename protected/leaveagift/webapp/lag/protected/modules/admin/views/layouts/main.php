<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title><?php echo Yii::app()->name." Admin"; ?></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../assets/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="http://cdn.webrupee.com/font">

 
    <style type="text/css">
      body {
        padding-top: 60px;
        padding-bottom: 40px;
      }
      .sidebar-nav {
        padding: 9px 0;
      }
    </style>
    <link href="../assets/css/bootstrap-responsive.css" rel="stylesheet">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="../assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="../assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="../assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="../assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="../assets/ico/apple-touch-icon-57-precomposed.png">
  </head>

  <body>
 <?php
 $session=new CHttpSession;
 $session->open();

 ?>

    <div class="navbar navbar-inverse navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container-fluid">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="#"><?php echo Yii::app()->name." Admin "; ?></a>
          <div class="nav-collapse collapse">
            <p class="navbar-text pull-right">
              Logged in as <?php 
         echo CHtml::image("https://graph.facebook.com/".$session['me']['id']."/picture?width=75&height=70&return_ssl_results=1","",array("style"=>"width:25px;height:25px;"));
  echo $session['me']['first_name']; 

?> (<a href="javascript:return;" class="logout">Logout</a>)
            </p>
            <!--
            <ul class="nav">
              <li class="active"><a href="#">Home</a></li>
              <li><a href="#about">About</a></li>
              <li><a href="#contact">Contact</a></li>
            </ul>
            -->
          </div><!--/.nav-collapse -->
        </div>
      </div>
    </div>

    <div class="container-fluid">
      <div class="row-fluid">
        <div class="span3">

          <div class="well sidebar-nav">

          <?php $this->widget('bootstrap.widgets.TbMenu', array(
    'type'=>'list',
    'items'=>array(
        array('label'=>'Manage'),
        array('label'=>'Orders', 'icon'=>'icon-th', 'url'=>array('userOrder/index')),
        array('label'=>'Product Templates', 'icon'=>'icon-th', 'url'=>array('productTemplate/index')),
        array('label'=>'Products', 'icon'=>'icon-th', 'url'=>array('product/index')),
        array('label'=>'Vouchers', 'icon'=>'icon-th', 'url'=>array('vouchers/index')),
        array('label'=>'Types', 'icon'=>'icon-tag', 'url'=>array('tag/index')), 
        array('label'=>'Suppliers', 'icon'=>'icon-tag', 'url'=>array('supplier/index')), 
        array('label'=>'Brands', 'icon'=>'icon-th', 'url'=>array('brand/index')), 
        array('label'=>'Occasions', 'icon'=>'icon-th', 'url'=>array('categoryLang/index')), 
        array('label'=>'PapaCj campaign', 'icon'=>'icon-th', 'url'=>array('papacj/index')), 
        array('label'=>'Manage'),
         array('label'=>'Users', 'icon'=>'icon-user', 'url'=>array('user/index')), 
         array('label'=>'Admins', 'icon'=>'icon-user', 'url'=>array('admin/index')), 
            ),
)); ?>
 
          </div><!--/.well -->
        </div><!--/span-->
        <div class="span9">
         <?php echo $content; ?>
          <div class="row-fluid">
           
          </div><!--/row-->
          <div class="row-fluid">
           
          </div><!--/row-->
        </div><!--/span-->
      </div><!--/row-->

      <hr>

      <footer>
        <p>&copy; Social commerce services pvt Ltd. 2012</p>
      </footer>

    </div><!--/.fluid-container-->



  </body>
<div id="fb-root"></div>
 <script type="text/javascript">



        // Load the SDK Asynchronously
        (function(d){
           var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
           if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/en_US/all.js";
           ref.parentNode.insertBefore(js, ref);
         }(document));
         
          window.fbAsyncInit = function() {
          FB.init({
            appId      : "<?php echo Yii::app()->params['facebook_appId']; ?>", // App ID
            //TODO add channel url with proper caching
            //channelUrl : 
            status     : true, // check login status
            cookie     : false, // we use signed_request https://developers.facebook.com/docs/authentication/signed_request/
            xfbml      : true,  // parse XFBML
            oauth      : true
          }); 
      
      	  FB.getLoginStatus(function(response) {
  			if (response.status === 'connected') {
				if(response.authResponse.userID === "<?php echo $session['me']['id']; ?>" ) 
				{
					//alert("loggedin");
                                        																																																																																																																																																																																																																																																																																																																																																															
					//setUserInfo();
					//getFriendsWithBirthdays();
				}
				else
				{
					/*window.location='<?php echo Yii::app()->createUrl("default/logout",array("token"=>Yii::app()->getRequest()->getCsrfToken())); ?>';*/
					//TODO - for our app windows, still this user is logged in.So it gives oauth error on next login.
				}
		  } else if (response.status === 'not_authorized') {
		    // the user is logged in to Facebook, 
		    // but has not authenticated your app
		    //TODO: this condition

		  } else {
		    // the user isn't logged in to Facebook.
		    //TODO: rare case
                    window.location='<?php echo Yii::app()->createUrl("auth/logout",array("token"=>Yii::app()->getRequest()->getCsrfToken())); ?>';
		  }
		 }); /*End login status*/
          } /* end fbAsyncInit */
          
		 
       
		$(document).ready(function(){
                      //alert("ok123");	
			$(".logout").click(function(e){
			//alert("yes");
                        
			FB.logout(function(response) {
					// user is now logged out
					location = "<?php echo CController::createUrl('default/logout',array('token'=>Yii::app()->getRequest()->getCsrfToken()))?>";
					});
					
			});
		});

</script>
</html>




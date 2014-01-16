
<?php /* @var $this Controller */ ?>

<?
$this->widget('ext.widgets.loading.LoadingWidget');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <title>LeaveAGift | Send real free and paid gifts to your friends. Why leave a post when you can LeaveAGift </title>
    <meta property="og:title" content="LeaveAGift | Send real free and paid gifts to your friends. Why leave a post when you can LeaveAGift"/>
    <meta property="og:type" content="website"/>
    <meta property="og:url" content="https://www.leaveagift.com/us.html"/>
    <meta property="og:image" content="https://s3-ap-southeast-1.amazonaws.com/lagdev/mail/logo.jpg"/>
    <meta property="og:site_name" content="LeaveAGift"/>
    <meta property="fb:admins" content="626837"/>
    <meta property="og:description"
          content="Don’t just say happy birthday, congratulations, or thank you.  Send a free or paid real gift card to some of India’s top shopping sites.  Stop liking, poking, sharing.   Make it real. LeaveAGift"/>

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/gift-style.css" />
	<link rel="shortcut icon" type="image/x-icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/favicon.ico">
	        <link rel="icon" type="image/x-icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/favicon.ico">   
	
	<link rel="stylesheet" type="text/css" href="http://cdn.webrupee.com/font">
	<!--load from google for faster loading, maybe later we can use yii inbuilt stuff-->
  	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
	
 <script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
</script>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>


</head>

<body>

 <!-- page wrapper starts -->
<div id="wrapper"> 

<!-- header starts -->

  <div id="header-receiverGift">
         
 <a href="<?php echo Yii::app()->createAbsoluteUrl('auth/index'); ?>">

                  <div id="primary-header">
                    <div style="logoframeinside">

<div class="logoHome">LeaveA<span class="gift-purple">Gift</span>
    </div>

                                <div class="navigation">
                                            <div class="nav-button"><a href="#">Start A New Gift</a></div>
                                            <div class="nav-button"><a href="<?php echo Yii::app()->createUrl('gift/mygifts');  ?>">My Gifts</a></div>
                                            <div class="nav-button"><a href="#"><span>My Freebies</span></a></div>
                                </div>

<div class="userlogin">

<div class="user-fb-pic" >

                                                                
                                                            </div>
                                                              <div class="user" id='logout'>
                                                                  <span id="logged-user-name"></span> <br />

                                                              </div>
                                                           
                                                
                    </div>
      

                  </div>
                              
                                
 <div class="tagline-Home">
 Spread Happiness
 </div>
</a>          
</div>     
</div>
<!--Main header ends here-->

	<?php echo $content; ?>

</div>
<!-- page wrapper ends -->

	

<!-- footer starts -->
  <div id="footer"><a href="#">Home</a> | <a href="<?php echo Yii::app()->createUrl('page/faqs'); ?>">FAQ</a> | <a href="<?php echo Yii::app()->createUrl('page/retailer'); ?>">Retailers</a> | <a href="#">Press</a> | <a href="<?php echo Yii::app()->createUrl('page/about'); ?>">About Us</a><br />
    <br />
Copyright 2012 LeaveAGift | <a href="<?php echo Yii::app()->createUrl('page/contact'); ?>">Contact</a> | <a href="<?php echo Yii::app()->createUrl('page/terms'); ?>">Terms of Service</a> | <a href="<?php echo Yii::app()->createUrl('page/privacy'); ?>">Privacy</a> </div>
  <!-- footer ends --> 






   


</body>
</html>

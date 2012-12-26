<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xmlns:fb="http://www.facebook.com/2008/fbml" xml:lang="en" lang="en">


<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/gift-style.css" media="screen, projection" />
	
	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container" id="page">

	
	
	 <div id="header">
                                            
                                <div class="logo">LeaveA<span class="gift-purple">Gift</span>
                                        <span class="tagline">Unleash Happiness</span></div>
										</div><!-- header -->
                                

	<div id="mainmenu">
		<?php $this->widget('zii.widgets.CMenu',array(
			'items'=>array(
				//array('label'=>'Home', 'url'=>array('/site/index')),
				//array('label'=>'About', 'url'=>array('/site/page', 'view'=>'about')),
				  array('label'=>'Friends', 'url'=>array('/site/friends')),
				//array('label'=>'Login', 'url'=>array('/site/login'), 'visible'=>Yii::app()->user->isGuest),
				//array('label'=>'Logout ('.Yii::app()->user->name.')', 'url'=>array('/site/logout'), 'visible'=>!Yii::app()->user->isGuest)
			),
		)); ?>
	</div><!-- mainmenu -->
	
	<?php echo $content; ?>

	<div class="clear"></div>

	<!-- footer starts -->
  <div id="footer"><a href="#">Home</a> | <a href="#">FAQ</a> | <a href="#">Retailers</a> | <a href="#">Press</a> | <a href="#">About Us</a><br />
    <br />
Copyright 2012 LeaveAGift | <a href="#">Contact</a> | <a href="#">Terms of Service</a> | <a href="#">Privacy</a> </div>
  <!-- footer ends --> 

</div><!-- page -->

</body>
</html>

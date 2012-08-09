<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/screen.css" media="screen, projection" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/print.css" media="print" />
	<!--[if lt IE 8]>
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/ie.css" media="screen, projection" />
	<![endif]-->

	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/main.css" />
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/form.css" />

	<title><?php echo CHtml::encode($this->pageTitle); ?></title>
</head>

<body>

<div class="container" id="page">

	<div id="header">
		<div id="logo"><?php echo CHtml::encode(Yii::app()->name); ?></div>
	</div><!-- header -->

	<div id="mainmenu">
<?php

              
$this->widget('bootstrap.widgets.BootNavbar', array(
    'fixed'=>false,
    'brand'=>CHtml::encode(Yii::app()->name),
    'brandUrl'=>'#',
    'collapse'=>true, // requires bootstrap-responsive.css
    //'htmlOptions'=>array('class'=>'span14 offset2'),
    'items'=>array(
        array(
            'class'=>'bootstrap.widgets.BootMenu',
            'items'=>array(
                array('label'=>'Home', 'url'=>Yii::app()->createUrl('site/index'), 'active'=>true),
            //     array('label'=>'Manage', 'url'=>Yii::app()->createUrl('admin'), 'active'=>false),
               
            ),
        ),
      //  '<form class="navbar-search" action=""><input type="text" class="search-query span2" placeholder="Search"></form>',
      '<div class="pull-right">',
           (Yii::app()->user->isGuest) ? '<div class="span2"><b>':'<div><b>',
            
       !Yii::app()->user->isGuest&&!Yii::app()->user->hasState('FB') ?  "":array(
            	'class'=>'FbLogin',
            	//'htmlOptions'=>array('class'=>'pull-right'),
            	'appId'=>Yii::app()->params['fb_app_id'],
		'secretId'=>Yii::app()->params['fb_app_secret'],
		//'logintable'=>'User',
		//'loginfield'=>'fbid',
		),
         (!Yii::app()->user->hasState('FB')||Yii::app()->user->isGuest) ?  array(
            'class'=>'bootstrap.widgets.BootMenu',
            //'htmlOptions'=>array('class'=>'pull-right'),
            'items'=>array(
           	         Yii::app()->user->isGuest ? array('label'=>'Login', 'url'=>Yii::app()->createUrl('site/login')) : array('label'=>Yii::app()->user->name.'(Logout)', 'url'=>Yii::app()->createUrl('site/logout')), 
            ), 
            ) : '',
            
            
            '</b></div></div>',     
    ),
    
));
         
?>
	</div><!-- mainmenu -->
	<?php if(isset($this->breadcrumbs)):?>
		<?php $this->widget('zii.widgets.CBreadcrumbs', array(
			'links'=>$this->breadcrumbs,
		)); ?><!-- breadcrumbs -->
	<?php endif?>

	<?php echo $content; ?>

	<div class="clear"></div>

	<div id="footer">
		Copyright &copy; <?php echo date('Y'); ?> by My Company.<br/>
		All Rights Reserved.<br/>
		<?php echo Yii::powered(); ?>
	</div><!-- footer -->

</div><!-- page -->

</body>
</html>

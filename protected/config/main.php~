<?php

// uncomment the following to define a path alias
// Yii::setPathOfAlias('local','path/to/local-folder');

// This is the main Web application configuration. Any writable
// CWebApplication properties can be configured here.

if (isset($_SERVER['PLATFORM'])) {
  if ($_SERVER['PLATFORM'] == 'pagoda') {
    $db_name = "yiidemo";
    $db_user = "aisha";
    $db_host = "tunnel.pagodabox.com;mysql:port=3306";
    $db_password = "1bn6mh0P";
  } 
}
else 
  {
      $db_name="yiidemos";
      $db_user="root";
      $db_host="localhost";
      $db_password="123";
  }

return array(
	'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
	'name'=>'Yii demos',

	// preloading 'log' component
	'preload'=>array('log','bootstrap'),

	// autoloading model and component classes
	'import'=>array(
		'application.models.*',
		'application.components.*',
               // 'application.extensions.facebook.*', 
                'application.extensions.fb.*', 
                 'application.extensions.parse.*', 
	),

	'modules'=>array(
		// uncomment the following to enable the Gii tool
		
		'gii'=>array(
			'class'=>'system.gii.GiiModule',
			'password'=>'123',
                         'generatorPaths' => array(
                                                  // 'application.extensions.giiplus',
                                                   //'ext.giiplus', 
                                                     'ext.ajaxgii', 
                                                 //  'ext.giiplus2',    
                                                 ),
		 	// If removed, Gii defaults to localhost only. Edit carefully to taste.
			//'ipFilters'=>array('127.0.0.1','::1'),
		),
		
	),

	// application components
	'components'=>array(
		'user'=>array(
			// enable cookie-based authentication
			'allowAutoLogin'=>true,
		),
                'session' => array(
                        'autoStart'=>true,  
                            ), 
                'bootstrap'=>array(
                        'class'=>'ext.bootstrap.components.Bootstrap', // assuming you extracted bootstrap under extensions
                        'coreCss'=>true, // whether to register the Bootstrap core CSS (bootstrap.min.css), defaults to true
                        'responsiveCss'=>false, // whether to register the Bootstrap responsive CSS (bootstrap-responsive.min.css), default to false
                        'plugins'=>array(
                                              // Optionally you can configure the "global" plugins (button, popover, tooltip and transition)
                                              // To prevent a plugin from being loaded set it to false as demonstrated below
                                        'transition'=>false, // disable CSS transitions
                                        'tooltip'=>array(
                                               'selector'=>'a.tooltip', // bind the plugin tooltip to anchor tags with the 'tooltip' class
                                               'options'=>array(
                                                         'placement'=>'bottom', // place the tooltips below instead
                                                              ),
                                                        ),
		                        ),
                                  ),  
		// uncomment the following to enable URLs in path-format
		/*
		'urlManager'=>array(
			'urlFormat'=>'path',
			'rules'=>array(
				'<controller:\w+>/<id:\d+>'=>'<controller>/view',
				'<controller:\w+>/<action:\w+>/<id:\d+>'=>'<controller>/<action>',
				'<controller:\w+>/<action:\w+>'=>'<controller>/<action>',
			),
		),
		*/
		'db'=>array(
			'connectionString' => 'sqlite:'.dirname(__FILE__).'/../data/testdrive.db',
		),
		// uncomment the following to use a MySQL database
		
		'db'=>array(
			'connectionString' => 'mysql:host='.$db_host.';dbname='.$db_name,
			'emulatePrepare' => true,
			'username' => $db_user,
			'password' => $db_password,
			'charset' => 'utf8',
			'enableProfiling'=>true,

		),
		
		'errorHandler'=>array(
			// use 'site/error' action to display errors
            'errorAction'=>'site/error',
        ),
		'log'=>array(
                        'class'=>'CLogRouter',
                        'routes'=>array(
                                array(
                                'class'=>'CProfileLogRoute',
                                'levels'=>'error, warning, trace, info, profile',
                                ),
                                array(
                                'class'=>'CWebLogRoute',
                                'levels'=>'error, warning, trace, info, profile',
                                'showInFireBug'=>false,
                                ),
                        ),
                    ),
	),

	// application-level parameters that can be accessed
	// using Yii::app()->params['paramName']
	'params'=>array(
		// this is used in contact page
		'adminEmail'=>'webmaster@example.com',
                'fb_app_id'=>'174683815908585',
                'fb_app_secret'=>'16c1ee8315499025482b00e8d2ea229c',
                
                'parse_app_id'=>'nO39c3e5uxMZ7Tmng6Q5oe6L3DEmnrxokReKdV9y',
                'parse_api_key'=>'TDzsT2K3bmLG9LSkuajJ1Y5RGUJszVZ8v92Lpyft',
               
	),
);

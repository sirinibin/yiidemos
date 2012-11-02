<?php
return array(
    'basePath'=>dirname(__FILE__).DIRECTORY_SEPARATOR.'..',
    'name'=>'Cron',
 
    'preload'=>array('log'),
 
    'import'=>array(
		'application.models.*',
                'application.modules.admin.models.*',
		'application.components.*',
		'application.controllers.*',
		'application.helpers.*',
    ),
    // We'll log cron messages to the separate files
    'components'=>array(
	    'urlManager'=>array(
            	'urlFormat'=>'path',
            	'showScriptName'=>false,
             ),
        'log'=>array(
            'class'=>'CLogRouter',
            'routes'=>array(
                array(
                    'class'=>'CFileLogRoute',
                    'logFile'=>'cron.log',
                    'levels'=>'error, warning',
                ),
                array(
                    'class'=>'CFileLogRoute',
                    'logFile'=>'cron_trace.log',
                    'levels'=>'trace',
                ),
            ),
        ),
 
        //DB connection
        'db'=>array(
				'connectionString' => 'mysql:host=localhost;dbname=leaveagift',
				'emulatePrepare' => true,
				'username' => 'root',
               			 'password' => 'lgd*#29LQ',
				'charset' => 'utf8',
			  ),
    ),
		'params' => array(

		'adminEmail' => 'admin@leaveagift.com',
       		 'adminName' => 'LeaveAGift',   
		//for sendgrid
		'hostname' => 'http://www.leaveagift.com/',
		'sendgridurl' =>'http://sendgrid.com/',
		'usersendgrid' => 'jaideep@leaveagift.com',
		'passsendgrid' => 'lovegifts',
		
			
	),
   
);

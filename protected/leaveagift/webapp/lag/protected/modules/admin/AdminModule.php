<?php

class AdminModule extends CWebModule
{
 // public $preload=array('bootstrap');
        protected function preinit()
        {
          /*
           $this->setComponents(array(
                        'bootstrap'=>array(
                                                'class'=>'admin.extensions.bootstrap.components.Bootstrap', 
                                          ),
                ));
          $this->preload=array('bootstrap');
            */  
        }
	public function init()
	{
		// this method is called when the module is being created
		// you may place code here to customize the module or the application

		// import the module-level models and components
                $this->configure(array(
                 'preload'=>array('bootstrap'),
                 'components'=>array(
             'bootstrap'=>array(
                'class'=>'admin.extensions.bootstrap.components.Bootstrap',
                'coreCss'=>true,
                'responsiveCss'=>true,
                'yiiCss'=>true,
                'enableJS'=>true,
                   ),
               )
               ));
               $this->preloadComponents();
                 
                    
		$this->setImport(array(
			'admin.models.*',
			'admin.components.*',
                        'admin.extensions.bootstrap.*',
                        'admin.extensions.giiplus.*'
		));                  
              
	}

	public function beforeControllerAction($controller, $action)
	{
		if(parent::beforeControllerAction($controller, $action))
		{
			// this method is called before any module controller action is performed
			// you may place customized code here
			return true;
		}
		else
			return false;
	}
}

<?php
/**
 * parent controller for all controller
 */
class BaseController extends CController
{
	
   public $layout="main";
    public function filters()
    {
        return array(
            'accessControl',
        );
    }

	public function accessRules()
    {
    	return array(array('allow',
    				'actions'=>array('login','logout','deauthorize','gift','terms','privacy'),
    				'users'=>array('?'),
    		),
    		array('allow',
    				'users'=>array('@'),
    		),
            array('deny'),
        );
    }
	
	public function filterHttps( $filterChain )
	 {
        $filter = new HttpsFilter;
        $filter->filter( $filterChain );
    	}	
}

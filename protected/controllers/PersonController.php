<?php

class PersonController extends CController
{
  
 public $layout="main";
 
  /**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}

	/**
	 * Specifies the access control rules.
	 * This method is used by the 'accessControl' filter.
	 * @return array access control rules
	 */
	public function accessRules()
	{
		return array(
			array('allow',  // allow all users to perform 'index' and 'view' actions
				'actions'=>array('ajax'),
				'users'=>array('@'),
			),
			
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

 public function actionAjax()
 {
    $model=new PersonForm;

   
    // uncomment the following code to enable ajax-based validation
    
    if(isset($_POST['ajax']) && $_POST['ajax']==='person-form')
    {
        echo CActiveForm::validate($model);
        Yii::app()->end();
    }
    
        


    if(isset($_POST['PersonForm']))
    {
       
          
        $model->attributes=$_POST['PersonForm'];
        if($model->validate())
        {
           // form inputs are valid, do something here
           print_r($_REQUEST);
           return;
                    
        
         
        }
    }
    $this->render('person_form',array('model'=>$model));

 }

}
?>

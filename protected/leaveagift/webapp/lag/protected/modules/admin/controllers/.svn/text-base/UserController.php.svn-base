<?php

class UserController extends CController
{
        public $breadcrumbs;
	/**
	 * @var string the default layout for the views. Defaults to '//layouts/column2', meaning
	 * using two-column layout. See 'protected/views/layouts/column2.php'.
	 */
	public $layout='main';

	/**
	 * @return array action filters
	 */
	public function filters()
	{
		return array(
			  'accessControl', // perform access control for CRUD operations
                          'users',
		);
	}
        public function filterUsers($filter)
         {
           $session=new CHttpSession;
           $session->open();
          
            if(Yii::app()->user->isGuest)
		{
                        $this->redirect(Yii::app()->createAbsoluteUrl("auth/index"));
		}
                 $criteria=new CDbCriteria;
                 $criteria->condition="facebook_userid=:facebook_userid";
                 $criteria->params=array(':facebook_userid'=>$session['me']['id']);
                 $user=User::model()->find($criteria);
                 if($user==null)
                  {
                    $this->redirect(Yii::app()->createAbsoluteUrl("auth/index"));
               
                  }
                 if($user->is_admin==0)
                  {
                     $this->redirect(Yii::app()->createAbsoluteUrl("auth/index"));
                  }

              $filter->run();
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
				'actions'=>array('index','view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','GeneratePdf','GenerateExcel','MakeAdmin','RemoveAdmin'),
				'users'=>array('*'),
			),
			array('allow', // allow admin user to perform 'admin' and 'delete' actions
				'actions'=>array('admin','delete'),
				'users'=>array('*'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}

	/**
	 * Displays a particular model.
	 * @param integer $id the ID of the model to be displayed
	 */
	public function actionView($id)
	{
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
		$model=new User;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['User']))
		{
			$model->attributes=$_POST['User'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id_user));
		}

		$this->render('create',array(
			'model'=>$model,
		));
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate($id)
	{
		$model=$this->loadModel($id);

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['User']))
		{
			$model->attributes=$_POST['User'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id_user));
		}

		$this->render('update',array(
			'model'=>$model,
		));
	}

	/**
	 * Deletes a particular model.
	 * If deletion is successful, the browser will be redirected to the 'admin' page.
	 * @param integer $id the ID of the model to be deleted
	 */
	public function actionDelete($id)
	{
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset($_GET['ajax']))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('admin'));
		}
		else
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
       
            $session=new CHttpSession;
            $session->open();		
            $criteria = new CDbCriteria();            

                $model=new User('search');
                $model->unsetAttributes();  // clear any default values

                if(isset($_GET['User']))
		{
                        $model->attributes=$_GET['User'];
			
			
                   	
                       if (!empty($model->id_user)) $criteria->addCondition('id_user = "'.$model->id_user.'"');
                     
                    	
                       if (!empty($model->id_customer)) $criteria->addCondition('id_customer = "'.$model->id_customer.'"');
                     
                    	
                       if (!empty($model->facebook_userid)) $criteria->addCondition('facebook_userid = "'.$model->facebook_userid.'"');
                     
                    	
                       if (!empty($model->facebook_oauthid)) $criteria->addCondition('facebook_oauthid = "'.$model->facebook_oauthid.'"');
                     
                    	
                       if (!empty($model->facebook_email)) $criteria->addCondition('facebook_email = "'.$model->facebook_email.'"');
                     
                    	
                       if (!empty($model->name)) $criteria->addCondition('name = "'.$model->name.'"');
                     
                    	
                       if (!empty($model->date_add)) $criteria->addCondition('date_add = "'.$model->date_add.'"');
                     
                    	
                       if (!empty($model->date_upd)) $criteria->addCondition('date_upd = "'.$model->date_upd.'"');
                     
                    			
		}
                 $session['User_records']=User::model()->findAll($criteria); 
       

                $this->render('index',array(
			'model'=>$model,
		));

	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new User('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['User']))
			$model->attributes=$_GET['User'];

		$this->render('admin',array(
			'model'=>$model,
		));
	}

	/**
	 * Returns the data model based on the primary key given in the GET variable.
	 * If the data model is not found, an HTTP exception will be raised.
	 * @param integer the ID of the model to be loaded
	 */
	public function loadModel($id)
	{
		$model=User::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']==='user-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        public function actionGenerateExcel()
	{
            $session=new CHttpSession;
            $session->open();		
            
             if(isset($session['User_records']))
               {
                $model=$session['User_records'];
               }
               else
                 $model = User::model()->findAll();

		
		Yii::app()->request->sendFile(date('YmdHis').'.xls',
			$this->renderPartial('excelReport', array(
				'model'=>$model
			), true)
		);
	}
        public function actionGeneratePdf() 
	{
           $session=new CHttpSession;
           $session->open();
		Yii::import('application.modules.admin.extensions.giiplus.bootstrap.*');
		require_once('tcpdf/tcpdf.php');
		require_once('tcpdf/config/lang/eng.php');

             if(isset($session['User_records']))
               {
                $model=$session['User_records'];
               }
               else
                 $model = User::model()->findAll();



		$html = $this->renderPartial('expenseGridtoReport', array(
			'model'=>$model
		), true);
		
		//die($html);
		
		$pdf = new TCPDF();
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor(Yii::app()->name);
		$pdf->SetTitle('User Report');
		$pdf->SetSubject('User Report');
		//$pdf->SetKeywords('example, text, report');
		$pdf->SetHeaderData('', 0, "Report", '');
		$pdf->SetHeaderData(PDF_HEADER_LOGO, PDF_HEADER_LOGO_WIDTH, "Example Report by ".Yii::app()->name, "");
		$pdf->setHeaderFont(Array('helvetica', '', 8));
		$pdf->setFooterFont(Array('helvetica', '', 6));
		$pdf->SetMargins(15, 18, 15);
		$pdf->SetHeaderMargin(5);
		$pdf->SetFooterMargin(10);
		$pdf->SetAutoPageBreak(TRUE, 0);
		$pdf->SetFont('dejavusans', '', 7);
		$pdf->AddPage();
		$pdf->writeHTML($html, true, false, true, false, '');
		$pdf->LastPage();
		$pdf->Output("User_002.pdf", "I");
	}
      public function actionMakeAdmin($id)
      {
        $user=User::model()->findbyPk($id);
        $user->is_admin=1;
        $user->save(false);
        $this->redirect(array("user/view",'id'=>$id));
         
      }   
      public function actionRemoveAdmin($id)
      {
        $user=User::model()->findbyPk($id);
        $user->is_admin=0;
        $user->save(false);
        $this->redirect(array("user/view",'id'=>$id));
         
      }       
}

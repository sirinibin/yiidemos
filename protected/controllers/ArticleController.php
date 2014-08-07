<?php

class ArticleController extends CController
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
				'actions'=>array('index','view'),
				'users'=>array('*'),
			),
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array('create','update','GeneratePdf','GenerateExcel'),
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
	public function actionView()
	{
		$id=$_REQUEST["id"];
	     
	       if(Yii::app()->request->isAjaxRequest)
	       {
	         $this->renderPartial('ajax_view',array(
			'model'=>$this->loadModel($id),
		));
	         
	       }
	       else
	       {
		$this->render('view',array(
			'model'=>$this->loadModel($id),
		));
	       }
	}

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{	
            $model=new Article;

		// Uncomment the following line if AJAX validation is needed
		$this->performAjaxValidation($model,"article-create-form");
            if(Yii::app()->request->isAjaxRequest)
	       {
		    if(isset($_POST['Article']))
		    {
			    $model->attributes=$_POST['Article'];
			    if($model->save())
			    {
			      echo $model->id;
			    }
			    else
			    {
			      echo "false";
			    } 
			    return;
		    }
	       }
	       else
	       {
	           if(isset($_POST['Article']))
		    {
			    $model->attributes=$_POST['Article'];
			    if($model->save())
			     $this->redirect(array('view','id'=>$model->id));
			
		    }
               
		    $this->render('create',array(
			    'model'=>$model,
		    ));
	       }	
	}

	/**
	 * Updates a particular model.
	 * If update is successful, the browser will be redirected to the 'view' page.
	 * @param integer $id the ID of the model to be updated
	 */
	public function actionUpdate()
	{
      
	    $id=isset($_REQUEST["id"])?$_REQUEST["id"]:$_REQUEST["Article"]["id"];
	    $model=$this->loadModel($id);
			    
	    // Uncomment the following line if AJAX validation is needed
	      $this->performAjaxValidation($model,"article-update-form");
	    
	  if(Yii::app()->request->isAjaxRequest)
	    {
	    
		if(isset($_POST['Article']))
		{
		  
			$model->attributes=$_POST['Article'];
			if($model->save())
			{
			  echo $model->id;
			}
			else
			{
			  echo "false";
			}
			return;
		}
		    
		  $this->renderPartial('_ajax_update_form',array(
		    'model'=>$model,
		    ));
		  return; 
	    
	    }
	    

	    if(isset($_POST['Article']))
	    {
		    $model->attributes=$_POST['Article'];
		    if($model->save())
			    $this->redirect(array('view','id'=>$model->id));
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
	public function actionDelete()
	{
	        $id=$_POST["id"];
	   
		if(Yii::app()->request->isPostRequest)
		{
			// we only allow deletion via POST request
			$this->loadModel($id)->delete();

			// if AJAX request (triggered by deletion via admin grid view), we should not redirect the browser
			if(!isset(Yii::app()->request->isAjaxRequest))
				$this->redirect(isset($_POST['returnUrl']) ? $_POST['returnUrl'] : array('index'));
			else
			   echo "true";
		}
		else
		{
		    if(!isset($_GET['ajax']))
			throw new CHttpException(400,'Invalid request. Please do not repeat this request again.');
		    else
			   echo "false"; 	
	        }	
	}

	/**
	 * Lists all models.
	 */
	public function actionIndex()
	{
            $session=new CHttpSession;
            $session->open();		
            $criteria = new CDbCriteria();            

                $model=new Article('search');
                $model->unsetAttributes();  // clear any default values

                if(isset($_GET['Article']))
		{
                        $model->attributes=$_GET['Article'];
			
			
                   	
                       if (!empty($model->id)) $criteria->addCondition('id = "'.$model->id.'"');
                     
                    	
                       if (!empty($model->title)) $criteria->addCondition('title = "'.$model->title.'"');
                     
                    	
                       if (!empty($model->content)) $criteria->addCondition('content = "'.$model->content.'"');
                     
                    	
                       if (!empty($model->image)) $criteria->addCondition('image = "'.$model->image.'"');
                     
                    	
                       if (!empty($model->caption)) $criteria->addCondition('caption = "'.$model->caption.'"');
                     
                    	
                       if (!empty($model->author_name)) $criteria->addCondition('author_name = "'.$model->author_name.'"');
                     
                    	
                       if (!empty($model->author_email)) $criteria->addCondition('author_email = "'.$model->author_email.'"');
                     
                    	
                       if (!empty($model->author_twitter)) $criteria->addCondition('author_twitter = "'.$model->author_twitter.'"');
                     
                    	
                       if (!empty($model->link)) $criteria->addCondition('link = "'.$model->link.'"');
                     
                    	
                       if (!empty($model->createdAt)) $criteria->addCondition('createdAt = "'.$model->createdAt.'"');
                     
                    			
		}
                 $session['Article_records']=Article::model()->findAll($criteria); 
       

                $this->render('index',array(
			'model'=>$model,
		));

	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Article('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Article']))
			$model->attributes=$_GET['Article'];

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
		$model=Article::model()->findByPk($id);
		if($model===null)
			throw new CHttpException(404,'The requested page does not exist.');
		return $model;
	}

	/**
	 * Performs the AJAX validation.
	 * @param CModel the model to be validated
	 */
	protected function performAjaxValidation($model,$form_id)
	{
		if(isset($_POST['ajax']) && $_POST['ajax']===$form_id)
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        public function actionGenerateExcel()
	{
            $session=new CHttpSession;
            $session->open();		
            
             if(isset($session['Article_records']))
               {
                $model=$session['Article_records'];
               }
               else
                 $model = Article::model()->findAll();

		
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
		Yii::import('application.extensions.ajaxgii.bootstrap.*');
		require_once('tcpdf/tcpdf.php');
		require_once('tcpdf/config/lang/eng.php');

             if(isset($session['Article_records']))
               {
                $model=$session['Article_records'];
               }
               else
                 $model = Article::model()->findAll();



		$html = $this->renderPartial('expenseGridtoReport', array(
			'model'=>$model
		), true);
		
		//die($html);
		
		$pdf = new TCPDF();
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor(Yii::app()->name);
		$pdf->SetTitle('Article Report');
		$pdf->SetSubject('Article Report');
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
		$pdf->Output("Article_002.pdf", "I");
	}
}

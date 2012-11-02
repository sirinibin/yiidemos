<?php

class UserOrderController extends CController
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
				'actions'=>array('create','update','GeneratePdf','GenerateExcel','export'),
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
		$model=new UserOrder;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['UserOrder']))
		{
			$model->attributes=$_POST['UserOrder'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id_user_gift));
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

		if(isset($_POST['UserOrder']))
		{
			$model->attributes=$_POST['UserOrder'];
			if($model->save())
				$this->redirect(array('view','id'=>$model->id_user_gift));
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

                $model=new UserOrder('search');
                $model->unsetAttributes();
                
            if(!empty($_POST))
	    {
	      Yii::app()->request->cookies['from_date'] = new CHttpCookie('from_date', $_POST['from_date']);  // define cookie for from_date
	      Yii::app()->request->cookies['to_date'] = new CHttpCookie('to_date', $_POST['to_date']);
	      $model->from_date = $_POST['from_date'];
	      $model->to_date = $_POST['to_date'];
	    }
                
                // clear any default values

                if(isset($_GET['UserOrder']))
		{
                        $model->attributes=$_GET['UserOrder'];
			
			 
		         if (!empty($model->date_add)) $criteria->addCondition('t.date_add >= "'.Yii::app()->dateFormatter->format('yyyy-MM-dd 00:00:01', $model->date_add).'"');
		
		         if (!empty($model->endDate)) $criteria->addCondition('t.date_upd <= "'.Yii::app()->dateFormatter->format('yyyy-MM-dd 23:59:59', $model->endDate).'"');  	
                   	
                      
                        // if (!empty($model->date_add)) $criteria->addCondition('t.date_add >= "'. date("Y/m/d 00:00:01",strtotime($model->date_add)).'"');
		
		         // if (!empty($model->endDate)) $criteria->addCondition('t.date_add <= "'.date("Y/m/d 23:59:59",strtotime($model->endDate)).'"'); 
                     
                   	
                       /*if (!empty($model->id_user_gift)) $criteria->addCondition('id_user_gift = "'.$model->id_user_gift.'"');
                     
                    	
                       if (!empty($model->id_cart)) $criteria->addCondition('id_cart = "'.$model->id_cart.'"');
                     
                    	*/
                       if (!empty($model->id_product)) $criteria->addCondition('id_product = "'.$model->id_product.'"');
                     
                    	/*
                       if (!empty($model->id_user)) $criteria->addCondition('id_user = "'.$model->id_user.'"');
                     
                    	
                       if (!empty($model->receiver_fbid)) $criteria->addCondition('receiver_fbid = "'.$model->receiver_fbid.'"');
                     
                    	
                       if (!empty($model->receiver_fbfirstname)) $criteria->addCondition('receiver_fbfirstname = "'.$model->receiver_fbfirstname.'"');
                     
                    	
                       if (!empty($model->receiver_fbemail)) $criteria->addCondition('receiver_fbemail = "'.$model->receiver_fbemail.'"');
                     
                    	
                       if (!empty($model->notify_email)) $criteria->addCondition('notify_email = "'.$model->notify_email.'"');
                     
                    	
                       if (!empty($model->img_url)) $criteria->addCondition('img_url = "'.$model->img_url.'"');
                     
                    	
                       if (!empty($model->message_card)) $criteria->addCondition('message_card = "'.$model->message_card.'"');
                     
                    	
                       if (!empty($model->message_post)) $criteria->addCondition('message_post = "'.$model->message_post.'"');
                     
                    	
                       if (!empty($model->title)) $criteria->addCondition('title = "'.$model->title.'"');
                     
                    	
                       if (!empty($model->delivery_date)) $criteria->addCondition('delivery_date = "'.$model->delivery_date.'"');
                     
                    	
                       if (!empty($model->greeting)) $criteria->addCondition('greeting = "'.$model->greeting.'"');
                     
                    	
                       if (!empty($model->gift_opened)) $criteria->addCondition('gift_opened = "'.$model->gift_opened.'"');
                     
                    	
                       if (!empty($model->gift_rating)) $criteria->addCondition('gift_rating = "'.$model->gift_rating.'"');
                     
                    	
                       if (!empty($model->facebook_postid)) $criteria->addCondition('facebook_postid = "'.$model->facebook_postid.'"');
                     
                    	
                       if (!empty($model->post_email_status)) $criteria->addCondition('post_email_status = "'.$model->post_email_status.'"');
                     
                    	
                       if (!empty($model->thankyouid)) $criteria->addCondition('thankyouid = "'.$model->thankyouid.'"');
                     */
                    	
                       //if (!empty($model->date_add)) $criteria->addCondition('date_add = "'.$model->date_add.'"');
                     
                    	
                      // if (!empty($model->date_upd)) $criteria->addCondition('date_upd = "'.$model->date_upd.'"');
                     
                    			
		}
                 $session['UserOrder_records']=UserOrder::model()->findAll($criteria); 
       

                $this->render('index',array(
			'model'=>$model,
		));

	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new UserOrder('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['UserOrder']))
			$model->attributes=$_GET['UserOrder'];

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
		$model=UserOrder::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='user-order-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
	 
	public function actionExport()
	{
	
	  Yii::import('application.modules.admin.extensions.phpexcel.JPhpExcel');
	  $criteria=new CDbCriteria;
	  
	  if(isset($_REQUEST['from_date'])||isset($_REQUEST['to_date']))
	  {
		if(isset($_REQUEST['from_date']))
		{
		  Yii::app()->request->cookies['from_date'] = new CHttpCookie('from_date', $_REQUEST['from_date']);  // define cookie for from_date
	     
		    if (!empty($_REQUEST['from_date'])) $criteria->addCondition('date_add >= "'.Yii::app()->dateFormatter->format('yyyy-MM-dd 00:00:01', $_REQUEST['from_date']).'"');
		}	
		if(isset($_REQUEST['to_date']))
		{
		   Yii::app()->request->cookies['to_date'] = new CHttpCookie('to_date', $_REQUEST['to_date']);
		    if (!empty($_REQUEST['to_date'])) $criteria->addCondition('date_upd <= "'.Yii::app()->dateFormatter->format('yyyy-MM-dd 23:59:59', $_REQUEST['to_date']).'"');  	
		}
		
		$orders=UserOrder::model()->findAll($criteria);  
		
		foreach (Yii::app()->log->routes as $route)
		{
		 $route->enabled = false;
		}
		
		
		Yii::app()->request->sendFile(date('YmdHis').'.xls',
			$this->renderPartial('excelReport2', array(
				'orders'=>$orders
			), true)
		);
		
	  }	
	   
	  //print_r($_REQUEST);
	  //exit;
	  
	   $this->render("export");
	 
	}
        public function actionGenerateExcel()
	{
            $session=new CHttpSession;
            $session->open();		
            
             if(isset($session['UserOrder_records']))
               {
                $model=$session['UserOrder_records'];
               }
               else
                 $model = UserOrder::model()->findAll();

		
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

             if(isset($session['UserOrder_records']))
               {
                $model=$session['UserOrder_records'];
               }
               else
                 $model = UserOrder::model()->findAll();



		$html = $this->renderPartial('expenseGridtoReport', array(
			'model'=>$model
		), true);
		
		//die($html);
		
		$pdf = new TCPDF();
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor(Yii::app()->name);
		$pdf->SetTitle('UserOrder Report');
		$pdf->SetSubject('UserOrder Report');
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
		$pdf->Output("UserOrder_002.pdf", "I");
	}
}

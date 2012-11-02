<?php

class VouchersController extends CController
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
				'actions'=>array('create','update','GeneratePdf','GenerateExcel','Productlist','Excelimport','GenerateImportFormat','Templatelist','DeActivate'),
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
            Yii::import("application.extensions.S3.*");
		$model=new Vouchers;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Vouchers']))
		{
    
			$model->attributes=$_POST['Vouchers'];

			if($model->validate())
                          {
                            $validity=substr($model->validity,6,4).'-'.substr($model->validity,3,2)."-".substr($model->validity,0,2); 
			    $model->validity=date('Y-m-d',strtotime($validity));

                            
  
                               $templatemodel=ProductTemplate::model()->findbyPk($model->id_template); 
 
		               $product=new Product;
		               $product->id_template=$templatemodel->id_template;
		               $product->id_tag=$templatemodel->id_tag;     
		               $product->id_supplier=$templatemodel->id_supplier;
		               $product->id_brand=$templatemodel->id_brand;      
		               $product->id_category=$templatemodel->id_category; 
		               $product->logo_choice=$templatemodel->logo_choice;
		               $product->is_return_gift=$templatemodel->is_return_gift;   
		               $product->description=$templatemodel->description; 
		               $product->features=$templatemodel->features;    
		               $product->event=$templatemodel->event; 

		               
                              $product->user_validity=$templatemodel->user_validity;  
                              $product->user_validity=$templatemodel->user_validity; 
                    
                               $product->sender_limit=$templatemodel->sender_limit;    
                               $product->voucher_validity=$model->validity; 

                               $product->terms=$templatemodel->terms;    
                               $product->tips=$templatemodel->tips; 
                               $product->redirection_url=$templatemodel->redirection_url; 

		                $product->price=$model->price; 
		                $product->product_value=$model->value;
		                $product->min_purchase=$model->min_purchase;
		                $product->quantity=1;
                        
		               $product->date_upd=date('Y-m-d H:i:s',time());
		               $product->date_add=date('Y-m-d H:i:s',time());    
		               $product->save(false);

		               $product->addProductTag();
		               $product->addProductCategory();
		               $product->addGiftFeatures($product->features);

		                $pl=new ProductLang;
		                $pl->id_product=$product->id_product;
		                $pl->description=$product->description;
		                $pl->id_lang=0;
		                $pl->save(false);

                            $model->id_product=$product->id_product;
                             
                            $model->save(false);
                            $product->copyImagesFromTemplate($templatemodel);
  
				$this->redirect(array('view','id'=>$model->id));
                          }
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
                $model->id_supplier=$model->product->id_supplier;  
                $model->validity=date('d/m/Y',strtotime($model->validity));
                

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Vouchers']))
		{
			$model->attributes=$_POST['Vouchers'];
                       
			if($model->validate())
                          {
                              $validity=substr($model->validity,6,4).'-'.substr($model->validity,3,2)."-".substr($model->validity,0,2); 
			      $model->validity=date('Y-m-d',strtotime($validity));
                              $model->save(false);
				$this->redirect(array('view','id'=>$model->voucher_code));
                          }
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

                $model=new Vouchers('search');
                $model->unsetAttributes();  // clear any default values

                if(isset($_GET['Vouchers']))
		{
                        $model->attributes=$_GET['Vouchers'];
			
			
                   	
                       if (!empty($model->id)) $criteria->addCondition('id = "'.$model->id.'"');
                     
                    	
                       if (!empty($model->voucher_code)) $criteria->addCondition('voucher_code = "'.$model->voucher_code.'"');
                     
                    	
                       if (!empty($model->id_product)) $criteria->addCondition('id_product = "'.$model->id_product.'"');
                     
                    	
                       if (!empty($model->value)) $criteria->addCondition('value = "'.$model->value.'"');
                     
                    	
                       if (!empty($model->validity)) $criteria->addCondition('validity = "'.$model->validity.'"');
                     
                    	
                       if (!empty($model->status)) $criteria->addCondition('status = "'.$model->status.'"');
                     
                    	
                       if (!empty($model->timestamp)) $criteria->addCondition('timestamp = "'.$model->timestamp.'"');
                     
                    			
		}
                 $session['Vouchers_records']=Vouchers::model()->findAll($criteria); 
       

                $this->render('index',array(
			'model'=>$model,
		));

	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Vouchers('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Vouchers']))
			$model->attributes=$_GET['Vouchers'];

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
		$model=Vouchers::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='vouchers-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        public function actionGenerateExcel()
	{
            $session=new CHttpSession;
            $session->open();		
            
             if(isset($session['Vouchers_records']))
               {
                $model=$session['Vouchers_records'];
               }
               else
                 $model = Vouchers::model()->findAll();

		
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

             if(isset($session['Vouchers_records']))
               {
                $model=$session['Vouchers_records'];
               }
               else
                 $model = Vouchers::model()->findAll();



		$html = $this->renderPartial('expenseGridtoReport', array(
			'model'=>$model
		), true);
		
		//die($html);
		
		$pdf = new TCPDF();
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor(Yii::app()->name);
		$pdf->SetTitle('Vouchers Report');
		$pdf->SetSubject('Vouchers Report');
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
		$pdf->Output("Vouchers_002.pdf", "I");
	}
        public function actionProductlist()
       	{
          if(isset($_REQUEST['Vouchers']['id_supplier']))
           {
            $id_supplier=$_REQUEST['Vouchers']['id_supplier'];
           }
          else if(isset($_REQUEST['VoucherExcelImportForm']['id_supplier']))
           {
            $id_supplier=$_REQUEST['VoucherExcelImportForm']['id_supplier'];
           }

            $criteria=new CDbCriteria;
            $criteria->condition="id_supplier=:id_supplier";
            $criteria->order="id_product desc";
            $criteria->params=array(':id_supplier'=>$id_supplier);
          

        
	    $data=Product::model()->findAll($criteria);
	     //print_r($data);
            
	   // $data=CHtml::listData($data,'id_product','tags[0]->name');
                echo CHtml::tag('option',
		           array('value'=>''),CHtml::encode('Choose a product'),true);
	    foreach($data as $k=>$record)
	    {
            // echo $record->tags[0]->name."<br/>";
               
		echo CHtml::tag('option',
		           array('value'=>$record->id_product),CHtml::encode($record->tags[0]->name."(INR:".number_format($record->price,0,".","").",id:".$record->id_product.")"),true);
	    }
	}
       public function actionTemplatelist()
       	{
          if(isset($_REQUEST['Vouchers']['id_supplier']))
           {
            $id_supplier=$_REQUEST['Vouchers']['id_supplier'];
           }
          else if(isset($_REQUEST['VoucherExcelImportForm']['id_supplier']))
           {
            $id_supplier=$_REQUEST['VoucherExcelImportForm']['id_supplier'];
           }

            $criteria=new CDbCriteria;
            $criteria->condition="id_supplier=:id_supplier";
            $criteria->order="id_template desc";
            $criteria->params=array(':id_supplier'=>$id_supplier);
          

        
	    $data=ProductTemplate::model()->findAll($criteria);
	     //print_r($data);
            
	   // $data=CHtml::listData($data,'id_product','tags[0]->name');
                echo CHtml::tag('option',
		           array('value'=>''),CHtml::encode('Choose a template'),true);
	    foreach($data as $k=>$record)
	    {
            // echo $record->tags[0]->name."<br/>";
               
		echo CHtml::tag('option',
		           array('value'=>$record->id_template),CHtml::encode($record->name),true);
	    }
	}
      public function actionExcelimport()
	{
           Yii::import("application.extensions.S3.*");
	    $model=new VoucherExcelImportForm;

	    // uncomment the following code to enable ajax-based validation
	    /*
	    if(isset($_POST['ajax']) && $_POST['ajax']==='voucher-excel-import-form-excelimport_form-form')
	    {
		echo CActiveForm::validate($model);
		Yii::app()->end();
	    }
	    */

	    if(isset($_POST['VoucherExcelImportForm']))
	    {
		$model->attributes=$_POST['VoucherExcelImportForm'];
                $excelFile=CUploadedFile::getInstance($model,'excel');   
		if($model->validate())
		{
                   if(isset($excelFile))  
                   {  
                    /* echo "<pre>";
                     print_r($_FILES);
                     echo "</pre>";*/ 
                       //  mb_internal_encoding("UTF-16LE");

                        /* Display current internal character encoding */
                       /// echo mb_internal_encoding();
                     //exit;
                     Yii::import('application.modules.admin.extensions.phpexcelreader.JPhpExcelReader');
                     $file=$excelFile->getTempName();
                     /*if(is_readable($file))
                      {
                        echo "readable";
                       // exit;
                      } 
                      else
                      {
                       echo "not readable";
                        exit;
                      }*/
                    
                     //$excelFile->saveAs(Yii::app()->basePath.'/assets/images/');
                     try{
 
                           $data=new JPhpExcelReader($file);
                        }
                      catch(Exception $e)
                        {
                               $model->addError('excel','This file is not readable,Please make a normal excel sheet with the same data and try aagin.');
                               $model->id_supplier='';
                               $this->render('excelimport_form',array('model'=>$model));
                               return;
                          /* echo "<pre>"; 
                           print_r($e);
                           echo "</pre>";
                           exit;*/
                        }  
                      /*echo "<pre>";
                      print_r($data->sheets[0]['cells']);
                      echo "</pre>";
                      exit;*/
                     foreach($data->sheets[0]['cells'][1] as $key1=>$templateid)
                     {
                       if($key1==1)
                       continue;
                       $templatemodel=ProductTemplate::model()->findbyPk($templateid); 
 
                       $product=new Product;
                       $product->id_template=$templatemodel->id_template;
                       $product->id_tag=$templatemodel->id_tag;     
                       $product->id_supplier=$templatemodel->id_supplier;
                       $product->id_brand=$templatemodel->id_brand;      
                       $product->id_category=$templatemodel->id_category; 
                       $product->logo_choice=$templatemodel->logo_choice;
                       $product->is_return_gift=$templatemodel->is_return_gift;   
                    
                       $product->description=$templatemodel->description; 
                       $product->features=$templatemodel->features;   
                       $product->terms=$templatemodel->terms;    
                       $product->tips=$templatemodel->tips;
                       $product->redirection_url=$templatemodel->redirection_url; 
  
                       $product->event=$templatemodel->event; 
 
                       $product->user_validity=$templatemodel->user_validity;

                       $product->sender_limit=$templatemodel->sender_limit;    
                       $product->receiver_limit=$templatemodel->receiver_limit; 
                     
                       

                        $product->price=(isset($data->sheets[0]['cells'][3][$key1]))?$data->sheets[0]['cells'][3][$key1]:0; 
                        $product->product_value=(isset($data->sheets[0]['cells'][4][$key1]))?$data->sheets[0]['cells'][4][$key1]:0;
                        $product->min_purchase=(isset($data->sheets[0]['cells'][5][$key1]))?$data->sheets[0]['cells'][5][$key1]:0;
                        $product->quantity=1;
                        
                       $product->date_upd=date('Y-m-d H:i:s',time());
                       $product->date_add=date('Y-m-d H:i:s',time());    
                       $product->save(false);

                       $product->addProductTag();
                       $product->addProductCategory();
                       $product->addGiftFeatures($product->features);

                       $product->copyImagesFromTemplate($templatemodel);

                        $pl=new ProductLang;
                        $pl->id_product=$product->id_product;
                        $pl->description=$product->description;
                        $pl->id_lang=0;
                        $pl->save(false);
                         
                        $values="";
                        $connection=Yii::app()->db;
                        $sql="insert into lag_vouchers(voucher_code,id_product,value,validity) values";   
                        $quantity=0;
                         
                        $validity="";  
                        
                        foreach($data->sheets[0]['cells'] as $key2=>$vouchercode)
                        {
                          if($key2<8)
                           continue;
                           
                         $validity=$data->sheets[0]['cells'][6][$key1];
                         if(substr($validity,1,1)=='/')
                         {
                           $c1=1;
                           if(substr($validity,3,1)=='/')
                            {
                              $from1=2;
                              $from2=4;
                              $c2=1;
                            }
                           else
                           {
                              $from1=2;
                              $from2=5;
                              $c2=2;
                           }
                           
                         }
                        else
                         {
                           $c1=2;
                            if(substr($validity,4,1)=='/')
                            {
                              $from1=3;
                              $from2=5;    
                              $c2=1;
                            }
                            else
                            {
                              $from1=3;
                              $from2=6;
                               $c2=2;
                            }
 
                         }
                        
                          
                         $date=substr($validity,0,$c1);
                         $month=substr($validity,$from1,$c2);
                         $year=substr($validity,$from2,4);
                         $validity=date('Y-m-d',strtotime($year."/".$month."/".$date));
                   
                         $values.="('".$vouchercode[$key1]."','".$product->id_product."','".$product->product_value."','".$validity."'),";                          
                         $quantity++;
             
                        } 
                    

                        $values=eregi_replace(',$', '', $values); 
                      $sql.=$values.";";

                       if($values!="")
                          {
                           $transaction=$connection->beginTransaction();
                           try
                            {
                              $connection->createCommand($sql)->execute();
                              $transaction->commit();
                            }
                           catch(Exception $e) // an exception is raised if a query fails
                             {
                               $transaction->rollBack();
                               $model->addError('excel',$e->errorInfo[2]);
                               $model->id_supplier='';
                               $this->render('excelimport_form',array('model'=>$model));
                               return;
                              
                               /*echo "<pre>";
                               print_r($e);
                               echo "</pre>";*/  
                               //exit;
                             
                             }
                            $product->quantity=$quantity;
                            $product->voucher_validity=$validity;
                            $product->save(false);
                          } 
           
         
                     
 
                     }//endfor1

                                           

                      /*echo "date:".$data->sheets[0]['cells'][2][3];
                      $date=substr($data->sheets[0]['cells'][2][3],0,2);
                      $month=substr($data->sheets[0]['cells'][2][3],3,2);
                      $year=substr($data->sheets[0]['cells'][2][3],6,4);
                      echo "<br/>".$year."-".$month."-".$date;
                      echo "<br/>".date('Y-m-d',strtotime($year."/11/25"));
                      exit;*/
                     /* $values="";
                      $connection=Yii::app()->db;
                      $sql="insert into lag_vouchers(voucher_code,id_product,value,validity) values";                     
                      foreach($data->sheets[0]['cells'] as $key=>$row)
                      { 
                      if($key==1)
                       continue;
                        $date=substr($row[3],0,2);
                        $month=substr($row[3],3,2);
                        $year=substr($row[3],6,4);
                        $row[3]=date('Y-m-d',strtotime($year."/".$month."/".$date));
                   
                       $values.="('".$row[1]."','".$model->id_product."','".$row[2]."','".$row[3]."'),";

                      }
                      $values=eregi_replace(',$', '', $values); 
                      $sql.=$values.";";
                       if($values!="")
                          {
                           $transaction=$connection->beginTransaction();
                           try
                            {
                              $connection->createCommand($sql)->execute();
                              $transaction->commit();
                            }
                           catch(Exception $e) // an exception is raised if a query fails
                             {
                               $transaction->rollBack();
                               $model->addError('excel',$e->errorInfo[2]);
                               $model->id_supplier='';
                               $this->render('excelimport_form',array('model'=>$model));
                               return;
                              
                               /*echo "<pre>";
                               print_r($e);
                               echo "</pre>";*/  
                               //exit;
                             
                            // }
                          //}
                         
                      $this->redirect(array("vouchers/index"));
                   } 

		    // form inputs are valid, do something here
		    return;
		}
	    }
	    $this->render('excelimport_form',array('model'=>$model));
	}
   public function actionGenerateImportFormat()
        {
	
         Yii::import('application.modules.admin.extensions.phpexcel.JPhpExcel');
         $id_supplier=$_REQUEST['sid'];
           $supplier=Supplier::model()->findbyPk($id_supplier);
       //  echo $id_supplier;
          $criteria=new CDbCriteria;
          $criteria->condition="id_supplier=:id_supplier";
          $criteria->params=array(':id_supplier'=> $id_supplier);
          $templates=ProductTemplate::model()->findAll( $criteria);
          
          $templateids[]='template id';
          $templatenames[]='template name';
          foreach($templates as $k=>$t)
          {
           $templateids[]=$t->id_template;
           $templatenames[]=$t->name;
          }
           
        // print_r($tarray);
       		         
	$data = array(
            $templateids,
	    $templatenames,
            array('price',''),
            array('value',''),
            array('min purchase',''),
            array('validity(d/m/Y)',''),
            array('voucher code',''), 
	);

	$xls = new JPhpExcel('UTF-8', false, 'Voucher import form for '.$supplier->name);
	$xls->addArray($data);
	$xls->generateXML('Voucher import form for '.$supplier->name);
                    
        }  
    public function actionDeActivate()
    { 
     $model=Vouchers::model()->findbyPk($_REQUEST['id']);
     if($model->status==0)
      {
       $model->status=1;   
      }
      else
      {
       $model->status=0;
      }
     $model->save(false); 
      
     $this->redirect(array("vouchers/view",'id'=>$model->id));  
       
    }
}

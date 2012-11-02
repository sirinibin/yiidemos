<?php

class ProductController extends CController
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
				'actions'=>array('create','update','GeneratePdf','GenerateExcel','Excelimport','Imagesimport','Publish','Generate','MakeSoldOut'),
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
        public function actionExcelimport()
	{
            Yii::import("application.extensions.S3.*");
        
	    $model=new ExcelImportForm;

	    // uncomment the following code to enable ajax-based validation
	    /*
	    if(isset($_POST['ajax']) && $_POST['ajax']==='excel-import-form-excelimport_form-form')
	    {
		echo CActiveForm::validate($model);
		Yii::app()->end();
	    }
	    */

	    if(isset($_POST['ExcelImportForm']))
	    {
		$model->attributes=$_POST['ExcelImportForm'];
                $excelFile=CUploadedFile::getInstance($model,'excel');  
                /*echo  $excelFile;
                echo "<pre>";
                print_r($_FILES);
                echo "</pre>";*/ 
    
		if($model->validate())
		{
                  if(isset($excelFile))  
                   {  
                    /*/  echo "<pre>";
                     print_r($_FILES);
                     echo "</pre>"; 
                     */
                     Yii::import('application.modules.admin.extensions.phpexcelreader.JPhpExcelReader');
                     $file=$excelFile->getTempName();
                     $data=new JPhpExcelReader($file);
                    // echo $data->dump(true,true);
                     /*echo "<pre>";
                     print_r($data->sheets[0]['cells']);
                     echo "</pre>";  
                     exit;*/
                          $j=0;                 
                        foreach($data->sheets[0]['cells'] as $k=>$row)
                         {
                              if($k==1)
                               continue;

 
                            $p=new Product;
                            $p->id_supplier=$row[2];
                            $p->id_brand=$row[3];
                            $p->quantity=$row[4];
                            $p->is_return_gift=$row[6];
                            $p->price=$row[7];
                            $p->product_value=$row[8];
                            $p->redeem_valid_days=$row[9];
                            $p->min_purchase=$row[10];
                            $p->features=$row[11];
                            $p->description=$row[12];
                            $p->date_add=date('Y-m-d H:i:s',time());
                            $p->date_upd=date('Y-m-d H:i:s',time());
                            $p->save(false);

                            $p->id_tag=$row[1];
                            $p->id_category=$row[5];
                            $p->addProductTag();
                            $p->addProductCategory();   

                                $pl=new ProductLang;
                                $pl->id_product=$p->id_product;
                                $pl->description=$p->description;
                                $pl->id_lang=0;
                                $pl->save(false);
                        
                          /*  if(isset($row[13]))
                             {
                              $p->image=$row[13];
                              $p->addImageAttachment();
                             }*/ 
                             /* 
                                   $attachment=new Attachment;
                                   $attachment->file_name=$row[13];
                                   $attachment->mime="image/png";   
                                   $attachment->save(false);
                                   */
            
                            $dir_path=Yii::app()->basePath.'/assets/images/productpicstemp/';
                            $subDirectories1=scandir($dir_path);
                           // print_r($subDirectories1);
                            //exit;
                            
			    foreach($subDirectories1 as $sub1)
                               {
                      
                                
                                if($sub1=="."||$sub1=="..")
                                  continue;
                                
                                 $stored=0;

                                  if(is_file($dir_path.'/'.$sub1))
                                   {
                               
                                                       foreach(Yii::app()->params['productResizeDimensions'] as $key=>$dimension)
						           {
                                                            if($sub1==(string)($dimension[0].$dimension[1].$row[13]))
                                                             {
                                                               
		                                                    $image=new Image;
								    $image->id_product=$p->id_product;
								    $image->position=$key;
								    $rnd = md5(rand(0,9999));  // generate random number between 0-9999 and use its
								    $image->filename = "{$rnd}-{$row[13]}";  // random number + file name
								    $image->save(false);   
								    Yii::app()->s3->upload($dir_path."/".$sub1, 'productpics/'.$image->filename, 'lagdev' );
                                                           
						                $stored++;
						              } /*end foreach3*/ 
                                                             
                                                            }
					         
					                  if($stored==count(Yii::app()->params['productResizeDimensions']))
                                                           {
                                                             $stored=0;
                                                             break;
                                                           }
                                     continue;


                                   }
 
                                   
                                   $subDirectories2=scandir($dir_path.'/'.$sub1);

					   //$i=0;
					    foreach ($subDirectories2 as $sub2)
                                                {
                                                 // echo "<br/>i:".$i;
                                                 // $i++; 
                                                    if($sub2=="."||$sub2==".."||is_dir($dir_path.'/'.$sub1.'/'.$sub2))
                                                
                                                       continue;
                                                  
                                                         
                                                        foreach(Yii::app()->params['productResizeDimensions'] as $key=>$dimension)
						           {
                                                            if($sub2==(string)($dimension[0].$dimension[1].$row[13]))
                                                            {
                                                               //echo "ok";
                                                               //exit;
                                                               
		                                                    $image=new Image;
								    $image->id_product=$p->id_product;
								    $image->position=$key;
								    $rnd = md5(rand(0,9999));  // generate random number between 0-9999 and use its
								    $image->filename = "{$rnd}-{$row[13]}";  // random number + file name
								    $image->save(false);   
								    Yii::app()->s3->upload($dir_path.$sub1."/".$dimension[0].$dimension[1].$row[13], 'productpics/'.$image->filename, 'lagdev' );
                                                           
                                                                   //echo "<br/>j:".($j+1);
                                                             // unlink($dir_path.$entry."/".$dimension[0].$dimension[1].strtolower($row[13]));
       
						                $stored++;
						              } /*end foreach3*/ 
                                                             
                                                            }
                                                          // else
                                                           //{ echo "not ok" ; exit; }
					         
					                  if($stored==count(Yii::app()->params['productResizeDimensions']))
                                                           {
                                                             $stored=0;
                                                             break;
                                                           }

                                               } /*end foreach2*/

                                          
                               

                              
                                 
 
                                   

                                  }/*end foreach1*/
                            
                             

                          }

                     // $subDirectories1=scandir($dir_path);
                       $this->recursiveDelete($dir_path);
                       mkdir(Yii::app()->basePath.'/assets/images/productpicstemp');
                                        
                       $this->redirect(array('product/index'));
                             
                   
                   }
		    // form inputs are valid, do something here
		   // return;
		}
	    }
	    $this->render('excelimport_form',array('model'=>$model));
	}
       public function recursiveDelete($str)
        {
		if(is_file($str))
                {
		    return unlink($str);
		}
		else if(is_dir($str))
                 {
		    $scan = glob(rtrim($str,'/').'/*');
		    foreach($scan as $index=>$path)
                   {
		        $this->recursiveDelete($path);
		   }
                   // if($str==Yii::app()->basePath.'/assets/images/productpicstemp/')
                    // return(true);
                    //else
		      return rmdir($str);
		 }
        }

        public function actionImagesimport()
	{
           Yii::import('application.extensions.image.Image');
           Yii::import("application.extensions.S3.*");
           
	    $model=new ImagesImportForm;

	    // uncomment the following code to enable ajax-based validation
	    /*
	    if(isset($_POST['ajax']) && $_POST['ajax']==='images-import-form-imagesimport_form-form')
	    {
		echo CActiveForm::validate($model);
		Yii::app()->end();
	    }
	    */

	    if(isset($_POST['ImagesImportForm']))
	    {
		$model->attributes=$_POST['ImagesImportForm'];
                $zipFile=CUploadedFile::getInstance($model,'zip');  
		if($model->validate())
		{
                  if(isset($zipFile))  
                  { 
                    $zip = new ZipArchive();
		    $x = $zip->open( $zipFile->getTempName());
                      //echo "in:".$x->getNameIndex();
                       // echo "ok".$x.$zipFile;
                      //  exit;
		    if ($x === true) 
                     {
                         // echo "ok";
                        //exit;
                                $dir_path=Yii::app()->basePath.'/assets/images/productpicstemp';
		        	$zip->extractTo($dir_path); // change this to the correct site path
		 	        $zip->close();
                                $subDirectories=scandir($dir_path);
                               // print_r($subDirectories);
                                  
                           if(file_exists(Yii::app()->basePath.'/assets/images/productpicstemp/'.$subDirectories[2].'/'))
                             {
                              $dir_path=Yii::app()->basePath.'/assets/images/productpicstemp/'.$subDirectories[2].'/';
                             }
                           else
                             {
                              $dir_path=Yii::app()->basePath.'/assets/images/productpicstemp/';
                             }  
                              
                            

                         if ($handle = opendir($dir_path))
                          {
			    echo "<br/>Directory handle: $handle\n";
			    echo "<br/>Entries:\n";

			    /* This is the correct way to loop over the directory. */
			    while (false !== ($entry = readdir($handle))) {
                              //  echo  "<br/>e:".$entry;
                                
                               if(file_exists($dir_path.$entry)&&$entry!="."&&$entry!=".."&&!is_dir($dir_path.$entry))
				{
                                //  echo "ok";
                                 // exit;
                                 $originalImagePath=$dir_path.$entry;      
                                 // echo $dir_path.$entry."<br/>";
                                 foreach(Yii::app()->params['productResizeDimensions'] as $d)
                                  {
                                    //echo "<br/>coool";
                                  $image = new Image($originalImagePath);
                                  $image->resize($d[0], $d[1])->rotate(0)->quality(100)->sharpen(0);
                                  //$image->background("#FFF");  
                                  $resizedImagePath=$dir_path.$d[0].$d[1].$entry; 

                                  $image->save($resizedImagePath);

                                  
                                //   echo "<br/>".$resizedImagePath; 
                                   // $success = Yii::app()->s3->upload( $resizedImagePath , 'productpicstemp/'.$d[0].$d[1].$entry, 'lagdev' );
                                    //unlink($resizedImagePath);
                                  
                                  }
                                  unlink($originalImagePath); 

                                }
                               else
                                {
                               // echo $dir_path.$entry."<br/>";
                                }
                           
			    }
                             // exit;
                              if(file_exists($dir_path.$zipFile))
                             {
                              //echo "done";
                             // rmdir($dir_path.$zipFile);
                             }
                             else{
                               //echo "not removed the directory";
                              }
			  
				    closedir($handle);
		          }

                          $this->redirect(array("product/Excelimport",'file'=>$zipFile));                            
                         // exit;

		                // form inputs are valid, do something here
		               // return;
		     }
                   
                  }
                }   
 
	    }
	    $this->render('imagesimport_form',array('model'=>$model));
	  }

	/**
	 * Creates a new model.
	 * If creation is successful, the browser will be redirected to the 'view' page.
	 */
	public function actionCreate()
	{
          Yii::import('application.extensions.image.Image');
          Yii::import("application.extensions.S3.*");
		$model=new Product;

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Product']))
		{
			$model->attributes=$_POST['Product'];
                        $model->id_tag=$_POST['Product']['id_tag'];
                        $model->id_category=$_POST['Product']['id_category'];
                        $model->description=$_POST['Product']['description'];
 
                        $uploadedFile=CUploadedFile::getInstance($model,'image');
 
                                      

                        
                       /*

                        echo "<pre>";
                        print_r($_FILES);
                        echo "</pre>";  
                        echo "<pre>";
                        print_r($uploadedFile);
                        echo "</pre>";
                        echo "<pre>";
                        print_r($model->attributes);
                        echo "</pre>";  
                        exit; 
                        */
                          $model->date_upd=date('Y-m-d H:i:s',time());
                          $model->date_add=date('Y-m-d H:i:s',time());
			if($model->save())
                           {

                                $model->addProductTag();
                                $model->addProductCategory();
                                //$model->addValidity($_POST['Product']['valid_till']);
                                $model->addGiftFeatures($_POST['Product']['features']);


                                $pl=new ProductLang;
                                $pl->id_product=$model->id_product;
                                $pl->description=$model->description;
                                $pl->id_lang=0;
                                $pl->save(false);

                                 if(isset($uploadedFile))
                                   {
                                      /* echo "<pre>";
                                       print_r($uploadedFile);
                                       print_r($_FILES);
                                       echo "</pre>"; 
                                       exit;*/
                                   
                                       
                                       $dir_path=Yii::app()->basePath.'/assets/images/'; 
                                
                         
		                         foreach(Yii::app()->params['productResizeDimensions'] as $key=>$d)
		                          {
		                            //echo "<br/>coool";
		                          $image = new Image($uploadedFile->getTempName());
		                          $image->resize($d[0], $d[1])->rotate(0)->quality(100)->sharpen(0);
                                          $fileName=$uploadedFile->getName().$model->id_product.$d[0].$d[1].".png";

		                          $resizedImagePath=$dir_path.$fileName; 

		                          $image->save($resizedImagePath);
                                  

		                           $success = Yii::app()->s3->upload( $resizedImagePath , 'productpics/'.$fileName, 'lagdev' );

                                           $pimage=new ProductImage;
                                           $pimage->id_product=$model->id_product;
                                           $pimage->position=$key;
					   $pimage->filename = $fileName;  // random number + file name
					   $pimage->save(false);

		                            unlink($resizedImagePath);
		                          
		                          }
		                      
                         
                                      /* $attachment=new Attachment; 
                                       $attachment->file_name=$fileName;
                                       $attachment->mime=$uploadedFile->type;
                                       $attachment->save(false);

                                       $product_attachment=new ProductAttachment;
                                       $product_attachment->id_product=$model->id_product;
                                       $product_attachment->id_attachment=$attachment->id_attachment;           
     
                                       $product_attachment->save(false);*/

                                   
                                    }



				$this->redirect(array('view','id'=>$model->id_product));
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
          Yii::import('application.extensions.image.Image');
          Yii::import("application.extensions.S3.*");
		$model=$this->loadModel($id);
             
               if(isset($model->tags[0]))
                {
                 $model->id_tag=$model->tags[0]->id_tag; 
                }
                if(isset($model->product_lang->description))
                {
                 $model->description=$model->product_lang->description; 
                }  
                 if(isset($model->categories[0]->id_category))
                {
                 $model->id_category=$model->categories[0]->id_category; 
                } 
                  
                 if(empty($model->tips))
                 {
                  $model->tips=' <ul> 
                                                          <li>tip1:Gift Cards cannot be replaced if lost or stolen.
                                                          <li>tip2:Gift Cards cannot be redeemed for cash.
                                                          <li>tip3:Gift cards expire 30 days after their date of issue.
                                                          <li>tip4:Gift Cards purchased for $supplierURL expire 90 days after their date of issue.
                                                          <li>tip5:LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.
                               </ul>
';
                 }
 
               if(empty($model->terms))
                 {
 
                $model->terms=' 
                                 <ul>
      
                                                               <li> Gift Cards cannot be replaced if lost or stolen.

							       <li> Gift Cards purchased online may be redeemed at  {SUPPLIER URL}
							       <li> Gift Cards cannot be redeemed for cash.

							       <li> Gift cards expire 30 days after their date of issue.
							       <li> Gift Cards purchased for $supplierURL expire 90 days after their date of issue.

							       <li> LeaveAGift.com maintains the right to dishonor gift cards for invalid Facebook accounts.'; 
                 }

               // if(isset($model->featurevalues[0]->value))
                // $model->valid_till=$model->featurevalues[0]->value;
   
                //if(isset($model->featurevalues[1]))
                 //$model->features=$model->featurevalues[1]->value;    
               

		// Uncomment the following line if AJAX validation is needed
		// $this->performAjaxValidation($model);

		if(isset($_POST['Product']))
		{
                        
			$model->attributes=$_POST['Product'];
                        $model->id_tag=$_POST['Product']['id_tag'];
                        $model->id_category=$_POST['Product']['id_category'];
                        $model->description=$_POST['Product']['description'];
                        $model->date_upd=date('Y-m-d H:i:s',time());
 
                         $uploadedFile=CUploadedFile::getInstance($model,'image'); 

                          $uploadedFile2=CUploadedFile::getInstance($model,'image2');

			if($model->save())
                          {
                            $model->removeProductTag();
                            $model->addProductTag();
 
                            $model->removeProductCategory();
                            $model->addProductCategory();

                            //$model->updateValidity($_POST['Product']['valid_till']);
                            //$model->updateGiftFeatures($_POST['Product']['features']);
                            
                            $criteria=new CDbCriteria;
                            $criteria->condition='id_product=:id_product';
                            $criteria->params=array(':id_product'=>$model->id_product);
                           
                            $pl=ProductLang::model()->find($criteria);
                            if($pl==null)
                             {
                               $pl=new ProductLang;   
                               $pl->id_product=$model->id_product;   
                             }
                            $pl->description=$model->description;
                            $pl->save(false); 

                                 if(isset($uploadedFile))
                                   {
                                       $model->removeProductImage(0);
                                       $model->saveImageToS3($uploadedFile,0);
                                   }
                                   if(isset($uploadedFile2))
                                   {
                                     $model->removeProductImage(1);
                                     $model->saveImageToS3($uploadedFile2,1);
                         
                                   }


				$this->redirect(array('view','id'=>$model->id_product));
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
                        $model=$this->loadModel($id);

                        
                       if($model->voucher_count==0)
                        { 
                         $model->removeProductTag();
                         $model->removeProductCategory();
                         $model->removeAttachments();
			 $model->delete();
                        }

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
                    

                $model=new Product('search');
                
                $model->unsetAttributes();  // clear any default values
            

                if(isset($_GET['Product']))
		{
                        $model->attributes=$_GET['Product'];
			//print_r($model->tags);
                      // if (!empty($model->id_tag)) $criteria->addCondition('tags.id_tag = "2"');
                      /* $criteria2 = new CDbCriteria();
                       $criteria2->condition='id_tag="'.$model->id_tag.'"';          
                       $pr=ProductTag::model()->findAll($criteria2);
                        $condition="t.id_product=";
                    
                          $i=0;
                         foreach($pr as $p)
                         { 
                          if($i==(count($pr)-1))
                           $condition.=" '".$p->id_product."'";
                          else
                           $condition.=" '".$p->id_product."' || "; 
 
                          $i++;
                         }
                       if (!empty($model->id_tag)) $criteria->addCondition($condition);
                        */

                      // if (!empty($model->id_product)) $criteria->addCondition('id_product = "'.$model->id_product.'"');
                     
                        // if (!empty($model->id_tag)) $criteria->addCondition('tags.id_tag = "'.$model->id_tag.'"');

                        /*if (!empty($model->id_tag))
                        $criteria->with=array( 'tags'=>array(
                                      'select'=>false,
                                      'joinType'=>'INNER JOIN',
                                      'alias'=>'pt',  
                                      'together'=>true,
                                      'condition'=>'pt.id_tag="'.$model->id_tag.'"',
                                         ),);*/ 
	
                       if (!empty($model->id_supplier)) $criteria->addCondition('id_supplier = "'.$model->id_supplier.'"');
                     
                    	
                       if (!empty($model->id_manufacturer)) $criteria->addCondition('id_manufacturer = "'.$model->id_manufacturer.'"');
                     
                    	
                       if (!empty($model->id_tax_rules_group)) $criteria->addCondition('id_tax_rules_group = "'.$model->id_tax_rules_group.'"');
                     
                    	
                       if (!empty($model->id_category_default)) $criteria->addCondition('id_category_default = "'.$model->id_category_default.'"');
                     
                    	
                       if (!empty($model->id_color_default)) $criteria->addCondition('id_color_default = "'.$model->id_color_default.'"');
                     
                    	
                       if (!empty($model->on_sale)) $criteria->addCondition('on_sale = "'.$model->on_sale.'"');
                     
                    	
                       if (!empty($model->online_only)) $criteria->addCondition('online_only = "'.$model->online_only.'"');
                     
                    	
                       if (!empty($model->ean13)) $criteria->addCondition('ean13 = "'.$model->ean13.'"');
                     
                    	
                       if (!empty($model->upc)) $criteria->addCondition('upc = "'.$model->upc.'"');
                     
                    	
                       if (!empty($model->ecotax)) $criteria->addCondition('ecotax = "'.$model->ecotax.'"');
                     
                    	
                       if (!empty($model->quantity)) $criteria->addCondition('quantity = "'.$model->quantity.'"');
                     
                    	
                       if (!empty($model->minimal_quantity)) $criteria->addCondition('minimal_quantity = "'.$model->minimal_quantity.'"');
                     
                    	
                       if (!empty($model->price)) $criteria->addCondition('price = "'.$model->price.'"');
                     
                    	
                       if (!empty($model->wholesale_price)) $criteria->addCondition('wholesale_price = "'.$model->wholesale_price.'"');
                     
                    	
                       if (!empty($model->unity)) $criteria->addCondition('unity = "'.$model->unity.'"');
                     
                    	
                       if (!empty($model->unit_price_ratio)) $criteria->addCondition('unit_price_ratio = "'.$model->unit_price_ratio.'"');
                     
                    	
                       if (!empty($model->additional_shipping_cost)) $criteria->addCondition('additional_shipping_cost = "'.$model->additional_shipping_cost.'"');
                     
                    	
                       if (!empty($model->reference)) $criteria->addCondition('reference = "'.$model->reference.'"');
                     
                    	
                       if (!empty($model->supplier_reference)) $criteria->addCondition('supplier_reference = "'.$model->supplier_reference.'"');
                     
                    	
                       if (!empty($model->location)) $criteria->addCondition('location = "'.$model->location.'"');
                     
                    	
                       if (!empty($model->width)) $criteria->addCondition('width = "'.$model->width.'"');
                     
                    	
                       if (!empty($model->height)) $criteria->addCondition('height = "'.$model->height.'"');
                     
                    	
                       if (!empty($model->depth)) $criteria->addCondition('depth = "'.$model->depth.'"');
                     
                    	
                       if (!empty($model->weight)) $criteria->addCondition('weight = "'.$model->weight.'"');
                     
                    	
                       if (!empty($model->out_of_stock)) $criteria->addCondition('out_of_stock = "'.$model->out_of_stock.'"');
                     
                    	
                       if (!empty($model->quantity_discount)) $criteria->addCondition('quantity_discount = "'.$model->quantity_discount.'"');
                     
                    	
                       if (!empty($model->customizable)) $criteria->addCondition('customizable = "'.$model->customizable.'"');
                     
                    	
                       if (!empty($model->uploadable_files)) $criteria->addCondition('uploadable_files = "'.$model->uploadable_files.'"');
                     
                    	
                       if (!empty($model->text_fields)) $criteria->addCondition('text_fields = "'.$model->text_fields.'"');
                     
                    	
                       if (!empty($model->active)) $criteria->addCondition('active = "'.$model->active.'"');
                     
                    	
                       if (!empty($model->available_for_order)) $criteria->addCondition('available_for_order = "'.$model->available_for_order.'"');
                     
                    	
                       if (!empty($model->condition)) $criteria->addCondition('condition = "'.$model->condition.'"');
                     
                    	
                       if (!empty($model->show_price)) $criteria->addCondition('show_price = "'.$model->show_price.'"');
                     
                    	
                       if (!empty($model->indexed)) $criteria->addCondition('indexed = "'.$model->indexed.'"');
                     
                    	
                       if (!empty($model->cache_is_pack)) $criteria->addCondition('cache_is_pack = "'.$model->cache_is_pack.'"');
                     
                    	
                       if (!empty($model->cache_has_attachments)) $criteria->addCondition('cache_has_attachments = "'.$model->cache_has_attachments.'"');
                     
                    	
                       if (!empty($model->cache_default_attribute)) $criteria->addCondition('cache_default_attribute = "'.$model->cache_default_attribute.'"');
                     
                    	
                       if (!empty($model->date_add)) $criteria->addCondition('date_add = "'.$model->date_add.'"');
                     
                    	
                       if (!empty($model->date_upd)) $criteria->addCondition('date_upd = "'.$model->date_upd.'"');
                     
                    			
		}
                 $session['Product_records']=Product::model()->findAll($criteria); 
       

                $this->render('index',array(
			'model'=>$model,
		));

	}

	/**
	 * Manages all models.
	 */
	public function actionAdmin()
	{
		$model=new Product('search');
		$model->unsetAttributes();  // clear any default values
		if(isset($_GET['Product']))
			$model->attributes=$_GET['Product'];

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
		$model=Product::model()->findByPk($id);
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
		if(isset($_POST['ajax']) && $_POST['ajax']==='product-form')
		{
			echo CActiveForm::validate($model);
			Yii::app()->end();
		}
	}
        public function actionGenerateExcel()
	{
            $session=new CHttpSession;
            $session->open();		
            
             if(isset($session['Product_records']))
               {
                $model=$session['Product_records'];
               }
               else
                 $model = Product::model()->findAll();

		// header('Content-Type:application/vnd.ms-excel');
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

             if(isset($session['Product_records']))
               {
                $model=$session['Product_records'];
               }
               else
                 $model = Product::model()->findAll();



		$html = $this->renderPartial('expenseGridtoReport', array(
			'model'=>$model
		), true);
		
		//die($html);
		
		$pdf = new TCPDF();
		$pdf->SetCreator(PDF_CREATOR);
		$pdf->SetAuthor(Yii::app()->name);
		$pdf->SetTitle('Product Report');
		$pdf->SetSubject('Product Report');
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
		$pdf->Output("Product_002.pdf", "I");
	}
    public function actionPublish()
    { 
     $model=Product::model()->findbyPk($_REQUEST['pid']);
     if($model->is_published==0)
      {
       $model->is_published=1;   
      }
      else
      {
       $model->is_published=0;
      }
     $model->save(false); 
      
     $this->redirect(array("product/view",'id'=>$model->id_product));  
       
    } 
   public function actionMakeSoldOut()
    { 
     $model=Product::model()->findbyPk($_REQUEST['pid']);
     if($model->out_of_stock==0)
      {
       $model->out_of_stock=1;   
      }
      else
      {
       $model->out_of_stock=0;
      }
     $model->save(false); 
      
     $this->redirect(array("product/view",'id'=>$model->id_product));        
    }    
  
   
}

<?php

class SiteController extends Controller
{
	/**
	 * Declares class-based actions.
	 */
   public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}
	/**
	 * @return array rules for the "accessControl" filter.
	 */
	 
	public function accessRules()
	{
		return array(
		
		       array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array(
				                
				         
				                 'paypal',
				                 'PaypalReturn',
				                 'PaypalCancel',
				                 'paypalDemo',
				                 'RequestPayment',
				                
				                 'BitcoinCancel',
				                 'BitcoinSuccess',
				                 'BitcoinCallback',
				                 'Logout',
				                 'index',
				       
				                ),
				'users'=>array('@'),
			),
			
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array(
				               //  'login',
				                 //'index',
				                 'login',
				                 'error', 
				                 'signup',
				                 'Bitcoin',
				                 'Fileupload',
				                 'Ppt'
				               //  'logout'
				                ),
				'users'=>array('*'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}
	public function actionLogin()
	{
		//$this->layout = 'main';
		

		$model = new LoginForm();

		if (isset($_POST['ajax']) && $_POST['ajax'] === 'login-form')
		{
			echo CActiveForm::validate($model, array('username', 'password', 'verifyCode'));
			Yii::app()->end();
		}

		if (isset($_POST['LoginForm']))
		{
			$model->attributes = $_POST['LoginForm'];
			if ($model->validate(array('username', 'password')) && $model->login())
			{
			    $this->redirect(Yii::app()->user->returnUrl);
			}
		}

		
		//$sent = r()->getParam('sent', 0);
		$this->render('login', array(
			'model' => $model,
			//'sent' => $sent,
		));
	}
        public function actionSignup()
	{
	    $model=new User;

	    // uncomment the following code to enable ajax-based validation
	    /*
	    if(isset($_POST['ajax']) && $_POST['ajax']==='user-signup-form')
	    {
		echo CActiveForm::validate($model);
		Yii::app()->end();
	    }
	    */

	    if(isset($_POST['User']))
	    {
		$model->attributes=$_POST['User'];
		if($model->validate())
		{ 
		    $login=new LoginForm;
		    $login->username=$model->email;
		    $login->password=$model->password;
		    
		  $model->save(false);
		  
		  
			if ($login->validate(array('username', 'password')) && $login->login())
			        {
			        
			        	$this->redirect(Yii::app()->user->returnUrl);
				}
			else
			{
			   echo "Email:".$model->email;
			   echo "Password:".$model->password;
			   
			       $this->render('login',array('model'=>$login));
			       return;
			}
		      
		    // form inputs are valid, do something here
		  
		}
	    }
	    $this->render('signup',array('model'=>$model));
	}
	 
	/**
	 * This is the action that handles user's logout
	 */
	public function actionLogout()
	{
		Yii::app()->user->logout();
		$this->redirect(Yii::app()->homeUrl);
	}

   

       /*
        public function actionAskPermission()
        {
         $session=new CHttpSession;
         $session->open(); 
        
         
         $auth_url = "https://www.facebook.com/dialog/oauth?client_id=".Yii::app()->controller->module->app_id. "&redirect_uri=" . urlencode($session['page_link']."?sk=app_".Yii::app()->controller->module->app_id)."&scope=email,user_location";
                  
         echo("<script> top.location.href='" . $auth_url . "'</script>");
             

        }
         */
	/**
	 * This is the default 'index' action that is invoked
	 * when an action is not explicitly requested by users.
	 */
	public function actionIndex()
	{
	  $this->render('index');
	}

	/**
	 * This is the action to handle external exceptions.
	 */
	public function actionError()
	{
	    if($error=Yii::app()->errorHandler->error)
	    {
	    	if(Yii::app()->request->isAjaxRequest)
	    		echo $error['message'];
	    	else
	        	$this->render('error', $error);
	    }
	}

	/**
	 * Displays the contact page
	 */
	public function actionContact()
	{
		$model=new ContactForm;
		if(isset($_POST['ContactForm']))
		{
			$model->attributes=$_POST['ContactForm'];
			if($model->validate())
			{
				$headers="From: {$model->email}\r\nReply-To: {$model->email}";
				mail(Yii::app()->params['adminEmail'],$model->subject,$model->body,$headers);
				Yii::app()->user->setFlash('contact','Thank you for contacting us. We will respond to you as soon as possible.');
				$this->refresh();
			}
		}
		$this->render('contact',array('model'=>$model));
	}


	public function actionAjaxCrop()
	{
	
	 $this->render('ajaxcrop');
	}
	public function actionDocrop()
	{
	  Yii::import('ext.jcrop.EJCropper');
	  $assetsDir = dirname(__FILE__).'/../assets';
	 // $imagetobecroped='689x1000.jpg';
	  $imagetobecroped='images.jpeg';
	  
	 //print_r($_REQUEST);
	  //exit;
	  $jcropper = new EJCropper();
	  $jcropper->thumbPath = $assetsDir."/cropedimage";
	  
	  // some settings ...
	  $jcropper->jpeg_quality = 95;
	  $jcropper->png_compression = 8;
	  
	  // get the image cropping coordinates (or implement your own method)
	   $coords = $jcropper->getCoordsFromPost('imageId');
	  
	  // returns the path of the cropped image, source must be an absolute path.
	  $thumbnail = $jcropper->crop($assetsDir."/". $imagetobecroped, $coords);
	} 
        public function actionIcrop()
        {
         Yii::import('ext.icrop.Icrop');
         $this->render("icrop");
        }

        public function actionIcropApi()
        {
         Yii::import('ext.icrop.Icrop');
         $this->render("icropapi");
        } 
        
        public function actionParse()
        {
          // echo "ok";
        //  Yii::import("application.extensions.parse.NParse");
          
          // $p=new NParse;
           
           $model=new ParseTest;
           $model->name="sirin";
           $model->age="123";
           
          // $model->save();
           
           
           if($model->save())
            {
              echo "saved"; 
              echo "<br/	>id:".$model->id;
            }
            else
            {
             $e=$model->getErrors();
             print_r($e);
            }
            
        }
        public function actionParseView($id)
        {
          $model=ParseTest::model()->findbyPk($id); 
          
          $model->name="Sirin";
          $model->age="24";
          if($model->save())
            {
              echo "saved"; 
              echo "<br/>id:".$model->id;
            }
            else
            {
             $e=$model->getErrors();
             print_r($e);
            }
           $model->name="coool";
           $model->save();
        }
        public function actionPaypalDemo()
        {
          $this->render('paypal_demo');
        }
        public function actionRequestPayment()
        {
          $products=array(
              
			'0'=>array(
				  'NAME'=>'Milk Shake with Ice Cream',
				  'AMOUNT'=>'20',
				  'QTY'=>'1'
				  ),
			
    
                         );
                         /*Optional */
             $shipping_address=array(
    
			'FIRST_NAME'=>'Sirin',
			'LAST_NAME'=>'K',
			'EMAIL'=>'sirinibin2006@gmail.com',
			'MOB'=>'0918606770278',
			'ADDRESS'=>'mannarkkad', 
			'SHIPTOSTREET'=>'mannarkkad',
			'SHIPTOCITY'=>'palakkad',
			'SHIPTOSTATE'=>'kerala',
			'SHIPTOCOUNTRYCODE'=>'IN',
			'SHIPTOZIP'=>'678761'
                 );
    
		    $e=new ExpressCheckout;
		    
		    $e->setCurrencyCode("USD");
		    
		    $e->setProducts($products);
		    
		    $e->setShippingCost(0);/*Optional*/
		    
		    $e->setShippingInfo($shipping_address); //Optional
		    
		    $e->returnURL=Yii::app()->createAbsoluteUrl("site/PaypalReturn");
    
                    $e->cancelURL=Yii::app()->createAbsoluteUrl("site/PaypalCancel");
		    
		    $result=$e->requestPayment();
		      
		
		    if(strtoupper($result["ACK"])=="SUCCESS")
		      {
			    //$token = urldecode($resArray["TOKEN"]);
			    
			    header("location:".$e->PAYPAL_URL.$result["TOKEN"]);
		      }
		      else
		      {
		    
		           $this->render("paypal_error",array('ack'=>$result));   
		   
		      }
                     
        
        }
        public function actionPaypalReturn()
        {
   
		     $e=new ExpressCheckout;
		    
		    if(isset($_REQUEST['token']))
		    {
		      $paymentDetails=$e->getPaymentDetails($_REQUEST['token']);
	          
	              if($paymentDetails['ACK']=="Success")
		      {
		        $ack=$e->doPayment($paymentDetails);
		        $this->render("paypal_success",array('ack'=>$ack));
		      }
		      else
		      {
		        $this->render("paypal_error",array('ack'=>$ack));   
		      }
		    } 
		   
	   
	
        }
        public function actionPaypalCancel()
        {
                     $this->render("paypal_cancel");        
        } 
        public function actionBitcoin()
        {
         $this->render("bitcoin");
        }
        public function actionBitcoinCallback()
        {
          $response=Yii::app()->bitcoin->getAccessToken();
          
          echo "response1:<pre>";
          print_r($response); 
          echo "</pre>";
          
          $response2=Yii::app()->bitcoin->getBalance($response['access_token']);
          
          echo "response2:<pre>";
          print_r($response2); 
          echo "</pre>";
         
          
          echo "<pre>";
          print_r($_REQUEST); 
          echo "</pre>";
        }
        public function actionBitcoinCancel()
        { 
          echo "<pre>";
          print_r($_REQUEST); 
          echo "</pre>";
        }
        public function actionBitcoinSuccess()
        {
           echo "<pre>";
           print_r($_REQUEST); 
           echo "</pre>";
        
        }
        public function actionFileupload()
	{
	    $model=new FileUpload;

	    // uncomment the following code to enable ajax-based validation
	    /*
	    if(isset($_POST['ajax']) && $_POST['ajax']==='file-upload-file_upload-form')
	    {
		echo CActiveForm::validate($model);
		Yii::app()->end();
	    }
	    */

	      $rows=array(); 
	      $columns=array();
	      $slides=array();
	    if(isset($_POST['FileUpload']))
	    {
		$model->attributes=$_POST['FileUpload'];
		if($model->validate())
		{
		
		 //  $slides=$this->pptx_to_text(Yii::app()->baseUrl."/files/samplePowerPoint.pptx");
		   
		   $file=CUploadedFile::getInstance($model,'file'); 
		
		    //$ext="pptx";
		    $ext=pathinfo($file->getName(), PATHINFO_EXTENSION);
		 
		      if($ext=="pptx")
		       {
		         $slides=$this->pptx_to_text($file->getTempName());
		         //$slides=$this->pptx_to_text("files/samplePowerPoint.pptx");
		       }
		       else if($ext=="xls"||$ext=="xlsx")
		       {
		                  Yii::import('ext.phpexcelreader.JPhpExcelReader');
		     
	
                     
						      try{
							  $data=new JPhpExcelReader($file->getTempName());
							  }
							  catch(Exception $e)
							  {
							  $model->addError("file",$e->getMessage());
							  //echo "Error:".$e->getMessage();
							  
							  }
							
							
							$i=0;
							/* 
							  echo "Data:<pre>";
						      print_r($data);
						      echo "</pre>";
						      */
						      //exit;
						      
							foreach($data->sheets as $k1=>$s)
							{
							/*
							  echo "Cells:<pre>";
							print_r($s);
							  echo "</pre>";
							  */
									      if(isset($s['cells']))
									      for($j=0;$j<count($s['cells']);$j++)
									      {
										    if($j==0)
											{
											  $columns=$s['cells'][$j+1]; 
											  
											}
											else
											{
											    for($k=0;$k<count($columns);$k++)
											    {
												$rows[$k1][$i][$columns[$k+1]]=$s['cells'][$j+1][$k+1];
																    
												/*                                    
												$rows[$k1][$i][$columns[$k+1]]=array(
																      'value'=>$s['cells'][$j+1][$k+1],
																      'style'=>''
																    );  
													  */                           
												  
											  
												  
											    }
											    
											    $i++;
											  
											  
											}
									      
										}
							
							}
					}		
                      
                   
		}
	    }
	    $this->render('file_upload',array('model'=>$model,
	                                      'sheets'=>$rows,
	                                      'columns'=>$columns,
	                                      'slides'=>$slides
	                                      ));
	}
	public function actionPpt()
	{
	 // $t=$this->pptx_to_text("files/samplePowerPoint.pptx");
	//  $t=$this->pptx_to_text("files/MAC_PP2004.ppt");
	  $t=$this->pptx_to_text2("files/MAC_PP2011.pptx");
	   
	  
	  //$t=$this->pptx_to_text("files/sampleKeynote.zip");
	 // $t=$this->pptx_to_text("files/index.zip");
	  
	  echo "<pre>";
	  print_r($t);
	  echo "</pre>";
	  //echo "Text:".$t;
	  
	//  $f=$this->loadSerialized("files/MAC_PP2011.pptx");
	}
	public function loadSerialized($pFilename)
	{
	    $oArchive = new \ZipArchive();
	    if ($oArchive->open($pFilename) === true) {
	      
		$xmlContent = $oArchive->getFromName('PHPPowerPoint.xml');
		
		
		
                 echo "Xml:".$xmlContent;
                 
		if (!empty($xmlContent)) {   
		    echo "cool";
		    exit;
		    $xmlData = simplexml_load_string($xmlContent);                    
		    $file    = unserialize(base64_decode((string) $xmlData->data));

		    
		    // Update media links
		    for ($i = 0; $i < $file->getSlideCount(); ++$i) {
		    
			for ($j = 0; $j < $file->getSlide($i)->getShapeCollection()->count(); ++$j) {
			
			 if ($file->getSlide($i)->getShapeCollection()->offsetGet($j) instanceof AbstractDrawing) {
				
				$file->getSlide($i)->getShapeCollection()->offsetGet($j)->setPath('zip://' . $pFilename . '#media/' . $file->getSlide($i)->getShapeCollection()->offsetGet($j)->getFilename(), false);
			    
			    }
			}
		    }

		    $oArchive->close();
		    return $file;
		}
	    }

	    return null;
	}
	public function pptx_to_text2($input_file)
	{
	
	      /*
	     $status_header = 'HTTP/1.1 200 OK ';
             $content_type="application/xml; charset=utf-8";
           
             header($status_header);
             header('Content-type: ' . $content_type);
             header('X-Powered-By: ' . "Nintriva <nintriva.com>");
             */
             
		$zip_handle = new ZipArchive;
		$output_text = "";
		
		$content=array();
		$i=0;
		
		$level=null;
		
		if(true === $zip_handle->open($input_file)){
		    $slide_number = 1; //loop through slide files
		    
		    while(($xml_index = $zip_handle->locateName("ppt/slides/slide".$slide_number.".xml")) !== false){
		    
			$xml_datas = $zip_handle->getFromIndex($xml_index);
			 
			// $xmlData = simplexml_load_strin); 
			/*
			  echo "<pre>";
			  print_r($xml_datas);
			  echo "</pre>";
			  exit;
			  */
		    
		        $obj=new DOMDocument;
			$xml_handle = $obj->loadXML($xml_datas, LIBXML_NOENT | LIBXML_XINCLUDE | LIBXML_NOERROR | LIBXML_NOWARNING);
			//$xml_handle = DOMDocument::loadXML($xml_datas, LIBXML_NOENT | LIBXML_XINCLUDE | LIBXML_NOERROR | LIBXML_NOWARNING);
			//$output_text .= strip_tags($obj->saveXML());
			$output_text .= strip_tags($obj->saveXML());
			//echo $obj->saveXML();
			//echo '<pre>', htmlentities($obj->saveXML()), '</pre>';
			//exit;
			//echo "OT:".$output_text;
			//$output_text .= strip_tags($xml_handle->saveXML());
			//$output_xml = $xml_handle->saveXML();
		
		    
			    /*
			    $xml = simplexml_load_string($obj->saveXML());
                             $json = json_encode($xml);
                             $array = json_decode($json,TRUE);
                             
                             $p = xml_parser_create();
                             */
                            $p = xml_parser_create();
			    xml_parse_into_struct($p, $obj->saveXML(), $vals, $index);
			    xml_parser_free($p);
			    
			    
			    /*
			    echo "Index array\n";
			     echo "<pre>";
			    print_r($index);
			     echo "</pre>";
			     */
			     /*
			    $xml = simplexml_load_string($obj->saveXML());
			    
			     echo "\nXml:\n";
			    echo "<pre>";
			    print_r($xml);
			    echo "</pre>";
			      */
			    /*
			    if(  $slide_number==2)
			    {
			    echo "\nVals array\n";
			    echo "<pre>";
			    print_r($vals);
			    echo "</pre>";
			    echo "<hr/>";
			    }*/
			    $size=null;
			    $color=null;
			    $font=null;
			    $textbox_id=null;
			    $type="";
			    $is_textbox=0;
			    $spid=null;
			    $shape=null;
			             $is_image=0;
			            $image_name=null;
			            $image_filename=null;
			            
			            $marl=null;
			           $indent=null;
			           $align=null;
			            
			            $is_vertical=0;
			            $vert=null;
			            $bold=0;
			            $strike=0;
			            $spc=0;
			            $baseline=0;
			            
			             /*Shadow params*/
			            $alpha=null;
			            $scheme_color=null;
			            $glow=null;
			            $lin=null;
			            $shade=null;
			            $tint=null;
			            $gs=null;
			            $miter=null;
			            $PRSTDAS=null;
			            $ln=null;
			            /*bullet_list params*/
			            $BUFONT=null;
			            $BUCHAR=null;
			            $bullet_list=0;
			            
			    foreach($vals as $p)
			    {
			     $text=null;
			      if($p['tag']=="A:RPR")
			       {
			         if(isset($p['attributes']['SZ']))
			          {
			           $size=$p['attributes']['SZ'];
			           $size=$size/100;
			          }
			          
			       }
			       
			       else if($p['tag']=="A:SRGBCLR")
			       {
			         if(isset($p['attributes']['VAL']))
			          {
			           $color=$p['attributes']['VAL'];
			          // echo "Color:".$color."<br/>";
			          }
			          
			       }
			       else if($p['tag']=="A:LATIN")
			       {
			         if(isset($p['attributes']['TYPEFACE']))
			          {
			           $font=$p['attributes']['TYPEFACE'];
			           //echo "FONT:".$font."<br/>";;
			          }
			          
			       }
			       else if($p['tag']=="A:OFF")
			       {
			         if(isset($p['attributes']))
			          {
			           $off_position=array('X'=>(int)($p['attributes']['X']/10000),'Y'=>(int)($p['attributes']['Y']/10000));
			           //echo "FONT:".$font."<br/>";;
			          }
			          
			       }
			        else if($p['tag']=="A:EXT")
			       {
			         if(isset($p['attributes']))
			          {
			           $ext_position=array('CX'=>(int)($p['attributes']['CX']/10000),'CY'=>(int)($p['attributes']['CY']/10000));
			           //echo "FONT:".$font."<br/>";;
			          }
			          
			       }
			        else if($p['tag']=="A:CHOFF")
			       {
			         if(isset($p['attributes']))
			          {
			           $choff_position=array('X'=>$p['attributes']['X']/100000,'Y'=>$p['attributes']['Y']/100000);
			           //echo "FONT:".$font."<br/>";;
			          }
			          
			       }
			        else if($p['tag']=="A:CHEXT")
			       {
			         if(isset($p['attributes']))
			          {
			           $chext_position=array('CX'=>$p['attributes']['CX']/100000,'CY'=>$p['attributes']['CY']/100000);
			           //echo "FONT:".$font."<br/>";;
			          }
			          
			       }
			        else if($p['tag']=="A:RPR")
			       {
			         if(isset($p['attributes']))
			          {
			           $lang=$p['attributes']['LANG'];
			           if(isset($p['attributes']['B']))
			            {
			             $bold=$p['attributes']['B'];
			            }
			            if(isset($p['attributes']['STRIKE']))
			            {
			             $strike=$p['attributes']['STRIKE'];
			            }
			             if(isset($p['attributes']['SPC']))
			            {
			             $spc=$p['attributes']['SPC'];
			            }
			            
			            if(isset($p['attributes']['BASELINE']))
			            {
			             $baseline=$p['attributes']['BASELINE'];
			            }
			           //echo "FONT:".$font."<br/>";;
			          }
			          
			       }
			       else if($p['tag']=="P:CNVPR")
			       {
			         if(isset($p['attributes']))
			          {
			           $textbox_id=$p['attributes']['ID'];
			           
			           if(isset($p['attributes']['DESCR'])&&isset($p['attributes']['NAME']))
			           {
			            $is_image=1;
			            $image_name=$p['attributes']['NAME'];
			            $image_filename=$p['attributes']['DESCR'];
			            
			           }
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			        else if($p['tag']=="P:CNVSPPR")
			       {
			         if(isset($p['attributes']))
			          {
			           $is_textbox=$p['attributes']['TXBOX'];
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			        else if($p['tag']=="P:SPTGT")
			       {
			         if(isset($p['attributes']))
			          {
			           $spid=$p['attributes']['SPID'];
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			       else if($p['tag']=="A:PRSTGEOM")
			       {
			         if(isset($p['attributes']))
			          {
			           $shape=$p['attributes']['PRST'];
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			       else if($p['tag']=="A:PPR")
			       {
			         if(isset($p['attributes']))
			          {
			           if(isset($p['attributes']['MARL']))
			           $marl=$p['attributes']['MARL'];
			           
			           if(isset($p['attributes']['INDENT']))
			           $indent=$p['attributes']['INDENT'];
			        
			            
			            if(isset($p['attributes']['ALGN']))
			            $align=$p['attributes']['ALGN'];
			          }
			         
			          
			       }
			        else if($p['tag']=="P:PH")
			       {
			         if(isset($p['attributes']))
			          {
			           $type=$p['attributes']['TYPE'];
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			       
			        else if($p['tag']=="A:BODYPR")
			       {
			         if(isset($p['attributes']))
			          {
			           if(isset($p['attributes']['VERT']))
			           {
			             $is_vertical=1;
			             $vert=$p['attributes']['VERT'];
			           }  
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			       else if($p['tag']=="A:BUCHAR")
			       {
			         if(isset($p['attributes']))
			          {
			           if(isset($p['attributes']['CHAR']))
			           {
			          
			             $BUCHAR=$p['attributes']['CHAR'];
			           }  
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			       else if($p['tag']=="A:BUFONT")
			       {
			         if(isset($p['attributes']))
			          {
			           if(isset($p['attributes']['CHAR']))
			           {
			          
			             $BUFONT=$p['attributes']['CHAR'];
			           }  
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			       else if($p['tag']=="A:LN")
			       {
			         if(isset($p['attributes']))
			          {
			           if(isset($p['attributes']['W']))
			           {
			          
			             $ln=$p['attributes']['W'];
			             
			              if(isset($p['attributes']['CMPD']))
			               $cmpd=$p['attributes']['CMPD'];
			           }  
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			        else if($p['tag']=="A:PRSTDASH")
			       {
			         if(isset($p['attributes']))
			          {
			           if(isset($p['attributes']['VAL']))
			           {
			          
			             $PRSTDASH=$p['attributes']['VAL'];
			             
			           }  
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			        else if($p['tag']=="A:MITER")
			       {
			         if(isset($p['attributes']))
			          {
			           if(isset($p['attributes']['LIM']))
			           {
			          
			             $miter=$p['attributes']['LIM'];
			             
			           }  
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			       else if($p['tag']=="A:GS"&&isset($p['attributes']))
			       {
			         
			           if(isset($p['attributes']['POS']))
			           {
			          
			             $gs=$p['attributes']['POS'];
			             
			           }  
			       
			          
			       }
			       
			        else if($p['tag']=="A:TINT"&&isset($p['attributes']))
			       {
			         
			           if(isset($p['attributes']['VAL']))
			           {
			          
			             $tint=$p['attributes']['VAL'];
			             
			           }  
			       
			          
			       }
			        else if($p['tag']=="A:SHADE"&&isset($p['attributes']))
			       {
			         
			           if(isset($p['attributes']['VAL']))
			           {
			          
			             $shade=$p['attributes']['VAL'];
			             
			           }  
			       
			          
			       }
			        else if($p['tag']=="A:LIN"&&isset($p['attributes']))
			       {
			         
			           if(isset($p['attributes']['ANG']))
			           {
			          
			             $lin=$p['attributes']['ANG'];
			             
			           }  
			       
			          
			       }
			       else if($p['tag']=="A:GLOW"&&isset($p['attributes']))
			       {
			         
			           if(isset($p['attributes']['RAD']))
			           {
			          
			             $glow=$p['attributes']['RAD'];
			             
			           }  
			       
			          
			       }
			        else if($p['tag']=="A:SCHEMECLR"&&isset($p['attributes']))
			       {
			         
			           if(isset($p['attributes']['VAL']))
			           {
			          
			             $scheme_color=$p['attributes']['VAL'];
			             
			           }  
			       
			          
			       }
			        else if($p['tag']=="A:ALPHA"&&isset($p['attributes']))
			       {
			         
			           if(isset($p['attributes']['VAL']))
			           {
			          
			             $alpha=$p['attributes']['VAL'];
			             
			           }  
			       
			          
			       }
			        else if($p['tag']=="A:LSTSTYLE")
			       {
			         
			           $bullet_list=1;
			          
			       }
			        else if($p['tag']=="A:T")
			       {
			         if(isset($p['value']))
			          {
			           $text=$p['value'];
			           //echo "TEXT:".$text;
			          }
			          
			          
			       }
			       
			        /*Shadow params*/
			            /*
			            $alpha=null;
			            $Scheme_color=null;
			            $glow=null;
			            $lin=null;
			            $shade=null;
			            $tint=null;
			            $gs=null;
			            $miter=null;
			            $PRSTDAS=null;
			            $ln=null;
			            /*bullet_list params*/
			            /*$BUFONT=null;
			            $BUCHAR=null;
			            $bullet_list=null;
			            */
			       /*
			       if($textbox_id!=null)
			       {
			       
			       }
			       */
			       if($text!=null)
			       {
			          
			       
				    if($textbox_id!=null)
				    {
				     // $content[$slide_number-1][$i]['content'].=$text;
				    
				      $content[$slide_number-1][$i]['textbox_id']=$textbox_id;     
				       
				    }
				  
				    
			         $content[$slide_number-1][$i]['content']=$text;
			         
			         $content[$slide_number-1][$i]['color']=$color;
			         $content[$slide_number-1][$i]['font']=$font;
			         $content[$slide_number-1][$i]['size']=$size;
			         
			         $content[$slide_number-1][$i]['lang']=$lang;
			         
			         $content[$slide_number-1][$i]['type']=$type;
			         
			         $content[$slide_number-1][$i]['textbox']= $is_textbox;
			         
			         $content[$slide_number-1][$i]['spid']= $spid;
			         
			         $content[$slide_number-1][$i]['shape']= $shape;
			         
			         $content[$slide_number-1][$i]['marl']= $marl;
			         
			         $content[$slide_number-1][$i]['indent']= $indent;
			         
			         $content[$slide_number-1][$i]['align']= $align;
			         
			         
			         $content[$slide_number-1][$i]['is_vertical']= $is_vertical;
			         
			         $content[$slide_number-1][$i]['vert']= $vert;
			         
			         $content[$slide_number-1][$i]['bold']= $bold;
			         
			         $content[$slide_number-1][$i]['strike']= $strike;
			         
			         $content[$slide_number-1][$i]['spc']= $spc;
			         
			           $content[$slide_number-1][$i]['baseline']= $baseline;
			           
			           
			           $content[$slide_number-1][$i]['alpha']= $alpha;
			           
			            $content[$slide_number-1][$i]['satmod']= $alpha;
			            $content[$slide_number-1][$i]['scheme_color']= $scheme_color;
			            $content[$slide_number-1][$i]['glow']= $glow;
			            $content[$slide_number-1][$i]['lin']= $lin;
			            $content[$slide_number-1][$i]['shade']= $shade;
			            $content[$slide_number-1][$i]['tint']= $tint;
			            $content[$slide_number-1][$i]['gs']= $gs;
			            $content[$slide_number-1][$i]['miter']= $miter;
			            $content[$slide_number-1][$i]['PRSTDASH']= $PRSTDASH;
			            $content[$slide_number-1][$i]['ln']= $ln;
			            
			            $content[$slide_number-1][$i]['BUFONT']= $BUFONT;
			            $content[$slide_number-1][$i]['BUCHAR']= $BUCHAR;
			            $content[$slide_number-1][$i]['bullet_list']= $bullet_list;
			            
			              /*shadow params*/
				                        /*'alpha'=>$s1['alpha'],
				                        'satmod'=>$s1['satmod'],
				                        'scheme_color'=>$s1['scheme_color'],
				                        'glow'=>$s1['glow'],
				                        'lin'=>$s1['lin'],
				                        'shade'=>$s1['shade'],
				                        'tint'=>$s1['tint'],
				                        'gs'=>$s1['gs'],
				                        'miter'=>$s1['miter'],
				                        'PRSTDASH'=>$s1['PRSTDASH'],
				                        'LN'=>$s1['LN'],
				                        */
				                        /*Bulleted list params*/
				                       /* 'BUFONT'=>$s1['BUFONT'],
				                        'BUCHAR'=>$s1['BUCHAR'],
				                        'bullet_list'=>$s['bullet_list']
				                        
				                        */
			         //if(isset($image_name)&&isset($image_filename))
                                 {
                                   
                                    $content[$slide_number-1][$i]['is_image']=$is_image;
                                    
                                    $content[$slide_number-1][$i]['image_name']=$image_name;
			         
			            $content[$slide_number-1][$i]['image_filename']=$image_filename;
                                 
                                 }
			         
			         $content[$slide_number-1][$i]['width']=(int)$off_position['X']-(int)$ext_position['CX'];
			         
			         $content[$slide_number-1][$i]['height']=(int)$off_position['Y']-(int)$ext_position['CY'];
			           
			         $content[$slide_number-1][$i]['off_position']=$off_position;
			           
			         $content[$slide_number-1][$i]['ext_position']=$ext_position;
			           
			          
			             
			         $content[$slide_number-1][$i]['choff_position']=$choff_position;
			             
			          $content[$slide_number-1][$i]['chext_position']=$chext_position;
			             
			          
			          $size=null;
				  $color=null;
				  $font=null;
				  
				  $i++;
				
			       }
			       
			    }
                            $textbox_id=null;
			     
			   $slide_number++;
			   $i=0;
			   
			  /* echo $json;
                            //$array = (array)$xml;
                            echo "<pre>";
			     print_r($array);
			    echo "</pre>";*/
			    /*
			  $txtbody=$obj->getElementsByTagName("p");
			    
			  
			    
			  $content[$i]['header']="";  
			  $content[$i]['content']="";
			    foreach($txtbody as $k=>$b)
			    {
			       if($k==0)
			        {
			          $content[$i]['header']=trim($b->nodeValue);
			        }
			       else 
			        {
			          $content[$i]['content'].=trim($b->nodeValue);
			        }
			        
			      //echo $k.":".trim($b->nodeValue);
			      //echo "<hr/>";
			    }
			    
			    $i++;
			    */
	    
		    }
		    
		    if($slide_number == 1){
			$output_text .="";
		    }
		    $zip_handle->close();
		}else{
		$output_text .="";
		}
		 
		 // echo "Content:".$output_text;
		  
		 //exit;
		 
		 $data=array();
		
		 $text="";
		 $words=array();
		 
		 $textbox_id=null;
		 foreach($content as $k1=>$slide)
		 {
		    
		     $textbox_id=null;
		    
		   foreach($slide as $k2=>$s1)
		   {
		      // echo  "<br/>Text box idA:".$s1['textbox_id']; 
		       
		     if(!empty($s1['textbox_id']))
		     {
		
			  //echo "<br/>TEXT box idA:".$s1['textbox_id'];
			 // echo  "<br/>Text box idB:".$textbox_id; 
			   
			            /*  if	($textbox_id==null)
			              {
			              
			              }
			              */
			              
				      
				      if(($textbox_id!=$s1['textbox_id'])||$textbox_id==null)
				       {
				             if($textbox_id==null&&$s1['textbox']==0)
				              {
				                $data[]=array(
						      'slide'=>($k1+1),
						      'textbox_id'=>$s1['textbox_id'],
						      'content'=>$s1['content'],
						      'words'=>array($s1['content']),
						      'textbox'=>$s1['textbox'],
						      'off_possition'=>$s1['off_position'],
						      'ext_possition'=>$s1['ext_position'],
						      'spid'=>$s1['spid'],
						      'shape'=>$s1['shape'],
						      'is_image'=>$s1['is_image'],
						      'image_name'=>$s1['image_name'],
						      'image_filename'=>$s1['image_filename'],
						      'marl'=>$s1['marl'],
						      'indent'=>$s1['indent'],
						      'align'=>$s1['align'],
						     //  'type'=>$s1['type']
						      
						    );
				              
				              }
				              else if(!empty($textbox_id))
				              {
					      $data[]=array(
						      'slide'=>($k1+1),
						      'textbox_id'=>$textbox_id,
						      'content'=>$text,
						      'words'=>$words,
						      'textbox'=>$s1['textbox'],
						      'off_possition'=>$s1['off_position'],
						      'ext_possition'=>$s1['ext_position'],
						      'spid'=>$s1['spid'],
						      'shape'=>$s1['shape'],
						      'is_image'=>$s1['is_image'],
						      'image_name'=>$s1['image_name'],
						      'image_filename'=>$s1['image_filename'],
						      'marl'=>$s1['marl'],
						      'indent'=>$s1['indent'],
						      'align'=>$s1['align'],
						      'bullet_list'=>$s1['bullet_list']
						     //  'type'=>$s1['type']
						      
						    );
						    
						    $words=array();
				                    $text="";
					       }	    
						    
				               
				       
				       } 
				     
				    
				     if($textbox_id!=null||$s1['textbox']==1)
				     {
				      $text.= $s1['content'];
				      if(!empty(trim($s1['content'])))
				       {
				         $words[]=array(
				                        'word'=>$s1['content'],
				                        'font'=>$s1['font'],
				                        'size'=>$s1['size'],
				                        'color'=>$s1['color'],
				                        'lang'=>$s1['lang'],
				                        'bold'=>$s1['bold'],
				                        'strike'=>$s1['strike'],
				                        'spc'=>$s1['spc'], //losely coupled
				                        'baseline'=>$s1['baseline'], //losely coupled
				                           /*shadow params*/
				                        'alpha'=>$s1['alpha'],
				                        'satmod'=>$s1['satmod'],
				                        'scheme_color'=>$s1['scheme_color'],
				                        'glow'=>$s1['glow'],
				                        'lin'=>$s1['lin'],
				                        'shade'=>$s1['shade'],
				                        'tint'=>$s1['tint'],
				                        'gs'=>$s1['gs'],
				                        'miter'=>$s1['miter'],
				                        'PRSTDASH'=>$s1['PRSTDASH'],
				                        'LN'=>$s1['LN'],
				                        
				                        /*Bulleted list params*/
				                        'BUFONT'=>$s1['BUFONT'],
				                        'BUCHAR'=>$s1['BUCHAR'],
				                        'bullet_list'=>$s1['bullet_list']
				                       ); 
				         
				       }
				      $textbox_id=$s1['textbox_id'];
				     } 
				   
				  
		      
		      
		     }
		   }
		   /*
		   if($k1==0)
		     {
		       echo "<pre>";
		       print_r($data);
		       echo "</pre>";
		      exit;
		     }
		     */
		 }
		  /*
		  echo "<pre>";
		 print_r($content);
		 echo "</pre>";
		 */
		 echo "<pre>";
		 print_r($data);
		 echo "</pre>";
		 exit;
		return $content;
          }
         public  function xml_to_array($xml,$main_heading = '') {
    $deXml = simplexml_load_string($xml);
    $deJson = json_encode($deXml);
    $xml_array = json_decode($deJson,TRUE);
    if (! empty($main_heading)) {
        $returned = $xml_array[$main_heading];
        return $returned;
    } else {
        return $xml_array;
    }
  }

	public function pptx_to_text($input_file)
	{
	
	      /*
	     $status_header = 'HTTP/1.1 200 OK ';
             $content_type="application/xml; charset=utf-8";
           
             header($status_header);
             header('Content-type: ' . $content_type);
             header('X-Powered-By: ' . "Nintriva <nintriva.com>");
             */
             
		$zip_handle = new ZipArchive;
		$output_text = "";
		
		$content=array();
		$i=0;
		
		if(true === $zip_handle->open($input_file)){
		    $slide_number = 1; //loop through slide files
		    
		    while(($xml_index = $zip_handle->locateName("ppt/slides/slide".$slide_number.".xml")) !== false){
		    
			$xml_datas = $zip_handle->getFromIndex($xml_index);
			
			  
		    
		        $obj=new DOMDocument;
			$xml_handle = $obj->loadXML($xml_datas, LIBXML_NOENT | LIBXML_XINCLUDE | LIBXML_NOERROR | LIBXML_NOWARNING);
			//$xml_handle = DOMDocument::loadXML($xml_datas, LIBXML_NOENT | LIBXML_XINCLUDE | LIBXML_NOERROR | LIBXML_NOWARNING);
			//$output_text .= strip_tags($obj->saveXML());
			$output_text .= strip_tags($obj->saveXML());
			//echo $obj->saveXML();
			//echo '<pre>', htmlentities($obj->saveXML()), '</pre>';
			//exit;
			//echo "OT:".$output_text;
			//$output_text .= strip_tags($xml_handle->saveXML());
			//$output_xml = $xml_handle->saveXML();
		
		    
			    /*
			    $xml = simplexml_load_string($obj->saveXML());
                             $json = json_encode($xml);
                             $array = json_decode($json,TRUE);
                             
                             $p = xml_parser_create();
                             */
                             $p = xml_parser_create();
			    xml_parse_into_struct($p, $obj->saveXML(), $vals, $index);
			    xml_parser_free($p);
			    
			    
			    /*
			    echo "Index array\n";
			     echo "<pre>";
			    print_r($index);
			     echo "</pre>";
			     */
			     
			    echo "\nVals array\n";
			    echo "<pre>";
			    print_r($vals);
			    echo "</pre>";
			    
			    $size=null;
			    $color=null;
			    $font=null;
			    foreach($vals as $p)
			    {
			     $text=null;
			      if($p['tag']=="A:RPR")
			       {
			         if(isset($p['attributes']['SZ']))
			          {
			           $size=$p['attributes']['SZ'];
			           $size=$size/100;
			          }
			          
			       }
			       
			       else if($p['tag']=="A:SRGBCLR")
			       {
			         if(isset($p['attributes']['VAL']))
			          {
			           $color=$p['attributes']['VAL'];
			          // echo "Color:".$color."<br/>";
			          }
			          
			       }
			       else if($p['tag']=="A:LATIN")
			       {
			         if(isset($p['attributes']['TYPEFACE']))
			          {
			           $font=$p['attributes']['TYPEFACE'];
			           //echo "FONT:".$font."<br/>";;
			          }
			          
			       }
			        else if($p['tag']=="A:T")
			       {
			         if(isset($p['value']))
			          {
			           $text=$p['value'];
			           //echo "TEXT:".$text;
			          }
			          
			       }
			       
			       if($text!=null)
			       {
			         
			         $content[$slide_number-1][$i]['content']=$text;
			         $content[$slide_number-1][$i]['color']=$color;
			         $content[$slide_number-1][$i]['font']=$font;
			         $content[$slide_number-1][$i]['size']=$size;
			          
			          $size=null;
				  $color=null;
				  $font=null;
				  
				  $i++;
			       }
			    
			    }

			   $slide_number++;
			   $i=0;
			   
			  /* echo $json;
                            //$array = (array)$xml;
                            echo "<pre>";
			     print_r($array);
			    echo "</pre>";*/
			    /*
			  $txtbody=$obj->getElementsByTagName("p");
			    
			  
			    
			  $content[$i]['header']="";  
			  $content[$i]['content']="";
			    foreach($txtbody as $k=>$b)
			    {
			       if($k==0)
			        {
			          $content[$i]['header']=trim($b->nodeValue);
			        }
			       else 
			        {
			          $content[$i]['content'].=trim($b->nodeValue);
			        }
			        
			      //echo $k.":".trim($b->nodeValue);
			      //echo "<hr/>";
			    }
			    
			    $i++;
			    */
	    
		    }
		    
		    if($slide_number == 1){
			$output_text .="";
		    }
		    $zip_handle->close();
		}else{
		$output_text .="";
		}
		 
		 // echo "Content:".$output_text;
		  
		 //exit;
		return $content;
          }
        
       
}

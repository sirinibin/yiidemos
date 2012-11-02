<?php




/* GiftController is used to customize gifts*/

class GiftController extends AuthController
{
	
 
  public function filters()
    {
        return array(
            'SessionLose'
        );
    }

    public function filterSessionLose($filter)
	{
	   $session=new CHttpSession;
           $session->open();
           
          if(!isset($session['me']))
	    { 	
	        $this->redirect(array("auth/logout","token"=>Yii::app()->getRequest()->getCsrfToken()));
	    }
           
	  $filter->run();
	}	
	
 public function actionUploadProfilePic()
 {
   Yii::import("application.extensions.S3.*");
   Yii::import('application.extensions.image.Image');
   $session=new CHttpSession;
   $session->open();
  $model=new ProfilePicForm;

  if(isset($_REQUEST['pid']))
   {
     $model->pid=$_REQUEST['pid'];
   }
    // uncomment the following code to enable ajax-based validation
    /*
    if(isset($_POST['ajax']) && $_POST['ajax']==='profile-pic-form-edit_profilepic-form')
    {
        echo CActiveForm::validate($model);
        Yii::app()->end();
    }
    */
    $upload_error=false;

    if(isset($_POST['ProfilePicForm']))
    {
       
        $model->attributes=$_POST['ProfilePicForm'];
        $uploadedFile=CUploadedFile::getInstance($model,'image'); 
 
        

		//$this->redirect(array("product/CustomizeGift",'pid'=>$model->pid));

        if($model->validate())
        {
        
            if(isset( $uploadedFile))
             {
	       $resp = $model->saveImageToS3($uploadedFile) ;
	       $session['img_url']=$resp[0];
	       $session['img_dimension']=array($resp[1],$resp[2]);
	       
	      //echo $session['img_url'] ;
	      //exit; 
             }          
 
            $this->redirect(array("product/CustomizeGift",'pid'=>$model->pid,'upload_error'=>$upload_error));
            //  return;
        }
        else
        {
           $upload_error=true;
           $e=$model->getErrors();
           $errors=json_encode($e);
           $this->redirect(array("product/CustomizeGift",'pid'=>$model->pid,'upload_error'=>$upload_error,'errors'=>$errors));
        /* $e=$model->getErrors();
         echo "<pre>";
         print_r($e);
         echo "</pre>";
         exit;
        */
        }
        
    }
    $this->renderPartial('edit_profilepic',array('model'=>$model,'upload_error'=>$upload_error));
   

  
 }
 public function actionEditTitle()
 {
   $session=new CHttpSession;
   $session->open();
   
    $model=new TitleForm;
 
    if(isset($_REQUEST['old_title']))
      {
        $model->title=$_REQUEST['old_title'];
      }
     if(isset($session['title']))
      {
        $model->title=$session['title'];
      }

    // uncomment the following code to enable ajax-based validation
    /*
    if(isset($_POST['ajax']) && $_POST['ajax']==='title-form-edit_title-form')
    {
        echo CActiveForm::validate($model);
        Yii::app()->end();
    }
    */
        
      Yii::app()->clientScript->scriptMap['jquery.js'] = false;


    if(isset($_POST['TitleForm']))
    {
       
          
        $model->attributes=$_POST['TitleForm'];
        if($model->validate())
        {

           //print_r($_REQUEST);
		   $session['title'] = $model->title;
           return;
                    
            // form inputs are valid, do something here
           // return;
        }
    }
    $this->renderPartial('edit_title',array('model'=>$model));
 


 }
 public function actionEditName()
 {
    $session=new CHttpSession;
    $session->open();
   $model=new NameForm;

     if(isset($_REQUEST['old_name']))
      {
        $model->name=$_REQUEST['old_name'];
      }
     if(isset($session['name']))
      {
        $model->name=$session['name'];
      }

    // uncomment the following code to enable ajax-based validation
    /*
    if(isset($_POST['ajax']) && $_POST['ajax']==='name-form-edit_name-form')
    {
        echo CActiveForm::validate($model);
        Yii::app()->end();
    }
    */
    Yii::app()->clientScript->scriptMap['jquery.js'] = false;

    if(isset($_POST['NameForm']))
    {
        $model->attributes=$_POST['NameForm'];
        if($model->validate())
        {
            //print_r($_REQUEST);
            $session['name'] = $model->name;
            return;
            
            // form inputs are valid, do something here
        }
    }
    $this->renderPartial('edit_name',array('model'=>$model));

 }
 public function actionEditMessage()
 {
   $session=new CHttpSession;
   $session->open();
     $model=new MessageForm;
 
      if(isset($_REQUEST['old_message']))
      {
        $model->message=$_REQUEST['old_message'];
      }
     /*if(isset($session['message']))
      {
        $model->message=$session['message'];
      }*/
 

    // uncomment the following code to enable ajax-based validation
    /*
    if(isset($_POST['ajax']) && $_POST['ajax']==='message-form-edit_message-form')
    {
        echo CActiveForm::validate($model);
        Yii::app()->end();
    }
    */
    Yii::app()->clientScript->scriptMap['jquery.js'] = false;
 
    if(isset($_POST['MessageForm']))
    {
        $model->attributes=$_POST['MessageForm'];
        if($model->validate())
        {
            $session['message'] = $model->message;
            // echo "message:".$session['message'];
            //print_r($_REQUEST);
            return;
           
        }
    }
    $this->renderPartial('edit_message',array('model'=>$model));


 }
 
 public function actionMyGifts()
 {
   $this->layout="receiver";
   $this->render("mygifts");
 }
 public function actionSentGiftView()
 {
   $this->layout="receiver";
   $this->render("sentgiftView",array('id_user_gift'=>$_REQUEST['id_user_gift']));
 }
 public function actionTerms()
 {
   $this->render("terms");
 }

 public function actionPrivacy()
 {
   $this->render("privacy");
 }


}
?>

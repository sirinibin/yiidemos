<?php

class ProfilePicForm extends CFormModel
{

 	public $image;
        public $pid;/* product id */

	/**
	 * Declares the validation rules.
	 * title is required
	 */
	public function rules()
	{
		return array(
			array('image', 'file', 
                           'types'=>'jpg, gif, png, bmp, jpeg',
                           'maxSize'=>1024 * 1024 * 10, // 10MB
                           'tooLarge'=>'The file was larger than 10MB. Please upload a smaller file.',
                           'allowEmpty' => true
                           ),
                        array('pid','safe'), 
		       );
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'image'=>'image',
		);
	}
      public function saveImageToS3($uploadedFile)
	{  
	$dir_path=Yii::app()->basePath.'/assets/images/'; 
	$sizes=getimagesize($uploadedFile->getTempName());
				      
	$ext = pathinfo($uploadedFile->getName(), PATHINFO_EXTENSION);
	
	$resizeDimensions=$this->getResizeDimensions($uploadedFile,160,160);
	// print_r($resizeDimensions);
	//exit;
	$image = new Image($uploadedFile->getTempName());
	$image->resize($resizeDimensions[0], $resizeDimensions[1])->rotate(0)->quality(100)->sharpen(0);

	 $rnd = md5(rand(0,9999));  // generate random number between 0-9999 and use its md5 
	 $filename=$uploadedFile->getName().$rnd.$resizeDimensions[0].$resizeDimensions[1].".".$ext;
	 $savePath=$dir_path.$filename; 
	    
	 $image->save($savePath);
	 
	   // $uploadedFile->saveAs($savePath);
	    
	    $success = Yii::app()->s3->upload( $savePath , 'uploaded/'.$filename, 'lagdev' );
	    

	    unlink($savePath);
	    
	   return(array($filename,$resizeDimensions[0],$resizeDimensions[1]));  

	}	

     public function getResizeDimensions($uploadedFile,$containerwidth,$containerheight)
     {
      $sizes=getimagesize($uploadedFile->getTempName());
       
      $X=$sizes[0];
      $Y=$sizes[1];
       
       $a=(float)($X/$containerwidth);
       $b=(float)($Y/$containerheight);
       
       
       if($a>$b)
        {
          return(array((float)($X/$a),(float)($Y/$a)));
        }
        else 
        {
          return(array((float)($X/$b),(float)($Y/$b)));
        }  
     
     }
    

 
}

?>

<?php

/**
 * icrop Yii extension
 * 
 * Select a cropping area fro an image using the Jcrop jQuery tool and crop
 * it using PHP's GD functions.
 *
 * @copyright © Social Commerce Services pvt Ltd <www.leaveagift.com> 2012
 * @license GNU Lesser General Public License v1.0
 * @author Sirin k
 *
 */
Yii::import('zii.widgets.jui.CJuiWidget');

/**
 * Base class.
 */
class Icrop extends CJuiWidget
{
  public $img_url;
  
  public $type="preview";
  


	public function init()
	{
	 
	    $assetsDir = dirname(__FILE__).'/assets/';
            $cs = Yii::app()->getClientScript();
	  // Publishing and registering JavaScript file
	
	     $cs->registerScriptFile(
	      Yii::app()->assetManager->publish($assetsDir.'js/jquery.min.js'),
	      CClientScript::POS_HEAD
	      );
	      
	    $cs->registerScriptFile(
	      Yii::app()->assetManager->publish($assetsDir.'js/jquery.Jcrop.js'),
	      CClientScript::POS_HEAD
	      );
	      $cs->registerCssFile(
	    Yii::app()->assetManager->publish(
	    $assetsDir.'/css/jquery.Jcrop.css')
	    // CClientScript::POS_END
	    );
            $cs->registerCssFile(
	    Yii::app()->assetManager->publish(
	    $assetsDir.'/css/demo.css')
	    // CClientScript::POS_END
	    );
	 
	    
	   if($this->type=="preview")
	    {
	  
           $cs->registerScriptFile(
	      Yii::app()->assetManager->publish($assetsDir.'js/crop1.js'),
	      CClientScript::POS_HEAD
	      );
            }
            else if($this->type=="api")
            {
              
            
	     $cs->registerScriptFile(
	      Yii::app()->assetManager->publish($assetsDir.'js/crop2.js'),
	      CClientScript::POS_HEAD
	      );    
	    }  
	    /*      Yii::app()->clientScript->scriptMap=array(
        'jquery.js'=>false,
);*/
	       
	    // Publishing and registering CSS file
	   
	    
	    
		
	}
	public function run()
	{
	
	 if($this->type=="preview")
	  {
	   
	   $this->render("icrop");
	  }
	  else if($this->type=="api")
	  {
	  
	   $this->render("icropapi");
	  }
	} 
	
    	public function getCoordsFromPost($attribute)
	{
		$coords = array('x' => null, 'y' => null, 'h' => null, 'w' => null);
		foreach ($coords as $key => $value) {
			$coords[$key] = $_POST[$attribute . '_' . $key];
		}
		return $coords;
	}

	/**
	 * Crop an image and save the thumbnail.
	 * 
	 * @param string $src Source image's full path.
	 * @param array $coords Cropping coordinates indexed by : x, y, h, w
	 * @return string $thumbName Path of thumbnail.
	 */
	public function crop($src, array $coords)
	{
		if (!$this->thumbPath) {
			throw new CException(__CLASS__ . ' : thumbpath is not specified.');
		}
		$file_type = pathinfo($src, PATHINFO_EXTENSION);
		$thumbName = $this->thumbPath . '/' . pathinfo($src, PATHINFO_BASENAME);

		if ($file_type == 'jpg' || $file_type == 'jpeg') {
			$img = imagecreatefromjpeg($src);
		}
		elseif ($file_type == 'png') {
			$img = imagecreatefrompng($src);
		}
		else {
			return false;
		}
		$dest_r = imagecreatetruecolor($this->targ_w, $this->targ_h);
		if (!imagecopyresampled($dest_r, $img, 0, 0, $coords['x'], $coords['y'], $this->targ_w, $this->targ_h, $coords['w'], $coords['h'])) {
			return false;
		}
		// save only png or jpeg pictures
		if ($file_type == 'jpg' || $file_type == 'jpeg') {
			imagejpeg($dest_r, $thumbName, $this->jpeg_quality);
		}
		elseif ($file_type == 'png') {
			imagepng($dest_r, $thumbName, $this->png_compression);
		}
		return $thumbName;
	}	
	

	 
}

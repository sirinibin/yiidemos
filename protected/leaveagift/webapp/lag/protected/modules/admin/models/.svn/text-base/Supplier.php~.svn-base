<?php

/**
 * This is the model class for table "ps_supplier".
 *
 * The followings are the available columns in table 'ps_supplier':
 * @property string $id_supplier
 * @property string $name
 * @property string $date_add
 * @property string $date_upd
 * @property integer $active
 * @property string $logo
 */
class Supplier extends CActiveRecord
{
  public $logo2;

	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Supplier the static model class
	 */
	public static function model($className=__CLASS__)
	{
		return parent::model($className);
	}

	/**
	 * @return string the associated database table name
	 */
	public function tableName()
	{
		return 'ps_supplier';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('name,supplier_code', 'required'),
                        array('logo,logo2', 'file', 
                           'types'=>'jpg, gif, png, bmp, jpeg',
                           'maxSize'=>1024 * 1024 * 1, // 1MB
                           'tooLarge'=>'The file was larger than 1MB. Please upload a smaller file.',
                           'allowEmpty' => true,
                           ),
			array('active', 'numerical', 'integerOnly'=>true),
			array('name', 'length', 'max'=>64),
			array('logo', 'length', 'max'=>255),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_supplier, name, date_add, date_upd, active, logo', 'safe', 'on'=>'search'),
		);
	}

	/**
	 * @return array relational rules.
	 */
	public function relations()
	{
		// NOTE: you may need to adjust the relation name and the related
		// class name for the relations automatically generated below.
		return array(
                       'frontendimage'=>array(self::HAS_ONE, 'SupplierImages','id_supplier','condition'=>'frontendimage.position="0"'), 
 
                       'receiverendimage'=>array(self::HAS_ONE, 'SupplierImages','id_supplier','condition'=>'receiverendimage.position="1"'), 

                       'receiverendimage2'=>array(self::HAS_ONE, 'SupplierImages','id_supplier','condition'=>'receiverendimage2.position="2"'),
                       
                     'products_count'=>array(self::STAT, 'Product','id_supplier'),
                     'images'=>array(self::HAS_MANY, 'SupplierImages','id_supplier'), 
                     'images_count'=>array(self::STAT, 'SupplierImages','id_supplier'), 
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_supplier' => 'Id Supplier',
			'name' => 'Name',
			'date_add' => 'Date Add',
			'date_upd' => 'Date Upd',
			'active' => 'Active',
			'logo' => 'Logo1(Front end)',
                        'logo2' => 'Logo2(Receiver end)',
		);
	}

	/**
	 * Retrieves a list of models based on the current search/filter conditions.
	 * @return CActiveDataProvider the data provider that can return the models based on the search/filter conditions.
	 */
	public function search()
	{
		// Warning: Please modify the following code to remove attributes that
		// should not be searched.

		$criteria=new CDbCriteria;

		$criteria->compare('id_supplier',$this->id_supplier,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('date_add',$this->date_add,true);
		$criteria->compare('date_upd',$this->date_upd,true);
		$criteria->compare('active',$this->active);
		$criteria->compare('logo',$this->logo,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
       public function isUsed()
       {
         if($this->products_count>0)
            return(true);
         else
            return(false); 
       } 
       public function removepreveousImages()
       {
           if($this->images_count>0)
           {
             $criteria=new CDbCriteria;
             $criteria->condition='id_supplier=:id_supplier';
             $criteria->params=array('id_supplier'=>$this->id_supplier);
              return(SupplierImages::model()->deleteAll($criteria));
           }
           return(false);
       }
  public function addSupllierImage($filename,$pos)
  {
           $image=new SupplierImages;
           $image->id_supplier=$this->id_supplier;
           $image->position=$pos;
	   $image->filename = $filename;  
	   $image->save(false);

  }

  public function saveImageToS3($uploadedFile,$pos=0)
  {  
   $dir_path=Yii::app()->basePath.'/assets/images/'; 
   $sizes=getimagesize($uploadedFile->getTempName());
                                 
   $ext = pathinfo($uploadedFile->getName(), PATHINFO_EXTENSION);

       $filename=$uploadedFile->getName().$this->id_supplier.$sizes[0].$sizes[1].".".$ext;
       $savePath=$dir_path.$filename; 
       $uploadedFile->saveAs($savePath);
       $success = Yii::app()->s3->upload( $savePath , 'supplierpics/'.$filename, 'lagdev' );


       $this->addSupllierImage($filename,$pos);
       
        unlink($savePath);
       
         if($pos==0)
          {
            /*Resizing image for return gift*/
            
            $url=Yii::app()->params['supplierpics'].$filename;
            //echo $url;
            //exit;
            $resizeDimensions=$this->getResizeDimensions(false,100,34,$url);
            
            $s3=Yii::app()->s3->getInstance();
            
            $s3->getObject('lagdev', 'supplierpics/'.$filename, $dir_path.$filename);
            $file=$dir_path.$filename;
            
            
            $image = new Image($file);
	    $image->resize($resizeDimensions[0], $resizeDimensions[1])->rotate(0)->quality(100)->sharpen(0);

	
	    $filename=$uploadedFile->getName().$this->id_supplier.$resizeDimensions[0].$resizeDimensions[1].".".$ext;
	    $savePath=$dir_path.$filename;   
	    $image->save($savePath);
	    $success = Yii::app()->s3->upload( $savePath , 'supplierpics/'.$filename, 'lagdev' );
	    $this->addSupllierImage($filename,2);
            
            unlink($file);
            
          }
       

      // unlink($savePath);

  }
  
     public function getResizeDimensions($uploadedFile,$containerwidth,$containerheight,$url=false)
     {   
      
      if($url==false)
       {
        $file=$uploadedFile->getTempName();
        $sizes=getimagesize($file);
       }
      else
       {
       // echo "url:".$url;
        //exit;
        $sizes=getimagesize($url);
      
       }
       
       /*
        echo "<br/>Source image dimension:";
        echo "<pre>"; 
        print_r($sizes);
        echo "</pre>"; 
        exit;
        */
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
  
  public function removeSupplierImage($pos=0) 
    {
      
      if($this->images_count>0)
       {
        $criteria=new CDbCriteria;
        $criteria->condition='id_supplier=:id_supplier and position=:position';
        $criteria->params=array(':id_supplier'=>$this->id_supplier,':position'=>$pos);
 
         $image=SupplierImages::model()->find($criteria);
         if($image==null)
          return(false);
         $filename=$image->filename;


         $s3=Yii::app()->s3->getInstance();
         if($image->delete())
         {
          if($s3->deleteObject('lagdev','supplierpics/'.$filename))
           {
             return(true);
           }
         }

         return(false);
       
       
       }
    }

  public function getImage($pos=0,$type="text")  
  {
      
   if($pos==0)
   {
    if(isset($this->frontendimage->filename))
     {
       if($type=="text")
        return(Yii::app()->params['supplierpics'].$this->frontendimage->filename);   
       else if($type=="html")
       return("<img src='".Yii::app()->params['supplierpics'].$this->frontendimage->filename."' >");
     }
    else
     return("");
   }
   else if($pos==1)
   {
    if(isset($this->receiverendimage->filename))
      {
        if($type=="text") 
         return(Yii::app()->params['supplierpics'].$this->receiverendimage->filename);
        else if($type=="html")
         return("<img src='".Yii::app()->params['supplierpics'].$this->receiverendimage->filename."' >");
      }
    else
      return("");
   }
   else if($pos==2)
   {
    if(isset($this->receiverendimage2->filename))
      {
        if($type=="text") 
         return(Yii::app()->params['supplierpics'].$this->receiverendimage2->filename);
        else if($type=="html")
         return("<img src='".Yii::app()->params['supplierpics'].$this->receiverendimage2->filename."' >");
      }
    else
      {
         
           $dir_path=Yii::app()->basePath.'/assets/images/';
           Yii::import('application.extensions.image.Image');
           Yii::import("application.extensions.S3.*");
         
            $url=Yii::app()->params['supplierpics'].$this->frontendimage->filename;
            $filename=$this->frontendimage->filename;
            
            $ext = pathinfo($this->frontendimage->filename, PATHINFO_EXTENSION);
            
             //echo "url:".$url;
            // exit;
            
            
            $s3=Yii::app()->s3->getInstance();
            
            $s3->getObject('lagdev', 'supplierpics/'.$filename, $dir_path.$filename);
            $file=$dir_path.$filename;
            $image = new Image($file);
            
            $resizeDimensions=$this->getResizeDimensions(false,100,34,$dir_path.$filename);
            
            /*  echo "<br/>Resized dimensions:";
              echo "<pre>"; 
              print_r( $resizeDimensions);
              echo "</pre>"; 
              exit;
            */
	    $image->resize($resizeDimensions[0], $resizeDimensions[1])->rotate(0)->quality(100)->sharpen(0);

	
	    $filename=$this->frontendimage->filename.$this->id_supplier.$resizeDimensions[0].$resizeDimensions[1].".".$ext;
	    $savePath=$dir_path.$filename;   
	    $image->save($savePath);
	  
	    $success = Yii::app()->s3->upload( $savePath , 'supplierpics/'.$filename, 'lagdev' );
	    $this->addSupllierImage($filename,2);
	    unlink($savePath);
	    unlink($file);
	    
	     if($type=="text") 
            return(Yii::app()->params['supplierpics'].$filename);
            else if($type=="html")
            return("<img src='".Yii::app()->params['supplierpics'].$filename."' >");
         
      }
   }
   
  }
  

 
}

<?php

/**
 * This is the model class for table "lag_product_template".
 *
 * The followings are the available columns in table 'lag_product_template':
 * @property integer $id_template
 * @property integer $id_tag
 * @property integer $id_supplier
 * @property integer $id_brand
 * @property integer $id_category
 * @property integer $logo_choice
 * @property integer $is_return_gift
 * @property string $description
 * @property string $features
 * @property string $event
 * @property string $date_add
 * @property string $date_upd
 */
class ProductTemplate extends CActiveRecord
{
  public $image;
  
  public $image2;
/* for the receiver end*/

	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return ProductTemplate the static model class
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
		return 'lag_product_template';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('tips,terms,id_tag,sender_limit,receiver_limit,user_validity,redirection_url,name, id_supplier,id_category, logo_choice, description, features, event, date_add, date_upd', 'required'),
                        array('redirection_url','url'),
                        array('image,image2', 'file', 
                           'types'=>'jpg, gif, png, bmp, jpeg,pdf',
                           'maxSize'=>1024 * 1024 * 1, // 1MB
                           'tooLarge'=>'The file was larger than 1MB. Please upload a smaller file.',
                           'allowEmpty' => true,
     
                           ),
        
      
			array('id_tag, id_supplier, id_brand, id_category, logo_choice, is_return_gift', 'numerical', 'integerOnly'=>true),
			array('description', 'length', 'max'=>500),
			array('features', 'length', 'max'=>3000),
			array('event', 'length', 'max'=>100),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_template, id_tag, id_supplier, id_brand, id_category, logo_choice, is_return_gift, description, features, event, date_add, date_upd', 'safe', 'on'=>'search'),
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
                 'products_count'=>array(self::STAT, 'Product','id_template'), 
                 'images'=>array(self::HAS_MANY, 'TemplateImage','id_template'), 
 
                 'frontendimage'=>array(self::HAS_ONE, 'TemplateImage','id_template','condition'=>'frontendimage.position="0"'), 
 
                 'receiverendimage'=>array(self::HAS_ONE, 'TemplateImage','id_template','condition'=>'receiverendimage.position="1"'), 
 
                 'images_count'=>array(self::STAT, 'TemplateImage','id_template'),
                 'tag'=>array(self::BELONGS_TO, 'Tag','id_tag'),
                 'supplier'=>array(self::BELONGS_TO, 'Supplier','id_supplier'),
                 'brand'=>array(self::BELONGS_TO, 'Brand','id_brand'),
                 'category'=>array(self::BELONGS_TO, 'Category','id_category'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
                        'tips'=>'Tips',
                        'terms'=>'Terms & Conditions',
                        'image'=>'Image1(Front end)',
                        'image2'=>'Image2(Receiver end)',
			'id_template' => 'Id Template',
			'id_tag' => 'Type',
			'id_supplier' => 'Supplier',
			'id_brand' => 'Brand',
			'id_category' => 'Occasion',
			'logo_choice' => 'Logo Choice',
			'is_return_gift' => 'Is Return Gift',
			'description' => 'Description',
			'features' => 'Features',
			'event' => 'Event',
			'date_add' => 'Date Add',
			'date_upd' => 'Date Upd',
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

		$criteria->compare('id_template',$this->id_template);
		$criteria->compare('id_tag',$this->id_tag);
		$criteria->compare('id_supplier',$this->id_supplier);
		$criteria->compare('id_brand',$this->id_brand);
		$criteria->compare('id_category',$this->id_category);
		$criteria->compare('logo_choice',$this->logo_choice);
		$criteria->compare('is_return_gift',$this->is_return_gift);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('features',$this->features,true);
		$criteria->compare('event',$this->event,true);
		$criteria->compare('date_add',$this->date_add,true);
		$criteria->compare('date_upd',$this->date_upd,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
   public function getSupplierOptions()
    {
      $suppliers=Supplier::model()->findAll();
      return(CHtml::listData($suppliers,'id_supplier','name'));
    }  
    public function getBrandOptions()
    {
      $brands=Brand::model()->findAll();
      return(CHtml::listData($brands,'id_brand','name'));
    }
    public function getLogoChoiceOptions()
    {
      return array(
             '1'=>'Use Supplier logo',
             '2'=>'Use Brand logo',
           );
    }
    public function getTagOptions()
    {
      $tags=Tag::model()->findAll();
      return(CHtml::listData($tags,'id_tag','name'));
    }
    public function getCategoryOptions()
    {
      $tags=CategoryLang::model()->findAll();
      return(CHtml::listData($tags,'id_category','name'));
    } 
   public function getReturnIsGiftOptions()
  {
   return array(
         '0'=>'NO',
         '1'=>'YES',
         '2'=>'both',   
       ); 
  }
   public function getReturnGiftvalue()
   {
     if($this->is_return_gift==0)
        return("NO");
     else if($this->is_return_gift==1)
        return("YES");  
     else if($this->is_return_gift==2)
        return("both");
   }
   public function getLogoChoicevalue()
   {
     if($this->logo_choice==1)
        return("Use supplier logo");
     else if($this->logo_choice==2)
        return("Use Brand logo");  
   }

    public function getSupplierLogo()
    {
      $assetsDir = dirname(__FILE__).'/../../../assets'; 
             if($this->logo_choice==1)
              {
                if(isset($this->supplier->images[0]))
                {
                  return(Yii::app()->params['supplierpics'].$this->supplier->images[0]->filename);

                }
               else if(isset($this->supplier->logo)&&file_exists($assetsDir.'/images/suppliers/'.$this->supplier->logo))
		{ 
                  return(Yii::app()->assetManager->publish(
                  $assetsDir.'/images/suppliers/'.$this->supplier->logo));
		  
		}

                
              }
             else if($this->logo_choice==2)
              {
                if(isset($this->brand->images[0]))
                {
                 return($this->supplier_logo=Yii::app()->params['brandpics'].$this->brand->images[0]->filename);
                }
                else if(isset($this->brand->logo)&&file_exists($assetsDir.'/images/brands/'.$this->brand->logo))
		{ 
                  return(Yii::app()->assetManager->publish(
                  $assetsDir.'/images/brands/'.$this->brand->logo));
		  
		}

              }
 
        return(null);
    }
  public function getTemplateImage($pos,$type="text")  
  {
   if($pos==0)
   {
	   if(isset($this->frontendimage))
	     {
		if($type=="html")
		 return("<img src='".Yii::app()->params['producttemplatepics'].$this->frontendimage->filename."' >"); 
		else
		 return(Yii::app()->params['producttemplatepics'].$this->frontendimage->filename);
	     }
            
   }
  else if($pos==1)
   {
	   if(isset($this->receiverendimage))
	     {
		if($type=="html")
		 return("<img src='".Yii::app()->params['producttemplatepics'].$this->receiverendimage->filename."' >"); 
		else
		 return(Yii::app()->params['producttemplatepics'].$this->receiverendimage->filename);
	     }
           
   }
    
     return("");
  }

  public function saveImageToS3($uploadedFile,$pos=0)
  {  
   $dir_path=Yii::app()->basePath.'/assets/images/'; 
   $sizes=getimagesize($uploadedFile->getTempName());
                                 
   $ext = pathinfo($uploadedFile->getName(), PATHINFO_EXTENSION);

       $fileName=$uploadedFile->getName().$this->id_template.$sizes[0].$sizes[1].".".$ext;
       $savePath=$dir_path.$fileName; 
       $uploadedFile->saveAs($savePath);
       $success = Yii::app()->s3->upload( $savePath , 'producttemplatepics/'.$fileName, 'lagdev' );

           $ptimage=new TemplateImage;
           $ptimage->id_template=$this->id_template;
           $ptimage->position=$pos;
	   $ptimage->filename = $fileName;  // random number + file name
	   $ptimage->save(false);

           unlink($savePath);

  }
    public function removeTemplateImage($pos=0) 
    {
      
      if($this->images_count>0)
       {
        $criteria=new CDbCriteria;
        $criteria->condition='id_template=:id_template and position=:position';
        $criteria->params=array(':id_template'=>$this->id_template,':position'=>$pos);
 
         $image=TemplateImage::model()->find($criteria);
         if($image==null)
          return(false);
         $filename=$image->filename;


         $s3=Yii::app()->s3->getInstance();
         if($image->delete())
         {
          if($s3->deleteObject('lagdev','producttemplatepics/'.$filename))
           {
             return(true);
           }
         }

         return(false);
       
       
       }
    }
  
}

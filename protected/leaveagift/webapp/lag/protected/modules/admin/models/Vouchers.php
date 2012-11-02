<?php

/**
 * This is the model class for table "lag_vouchers".
 *
 * The followings are the available columns in table 'lag_vouchers':
 * @property integer $id
 * @property string $voucher_code
 * @property integer $id_product
 * @property double $value
 * @property string $validity
 * @property integer $status
 * @property string $timestamp
 */
class Vouchers extends CActiveRecord
{
  public $id_supplier;

  public $id_template;

  public $price;
   
  public $min_purchase;


	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Vouchers the static model class
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
		return 'lag_vouchers';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_supplier,voucher_code, id_template, value, validity,price,min_purchase', 'required'),
                        array('validity','date','format'=>'dd/mm/yyyy'),
			array('id_product, status', 'numerical', 'integerOnly'=>true),
			array('value', 'numerical'),
			array('voucher_code', 'length', 'max'=>128),
                        array('voucher_code','unique'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, voucher_code, id_product, value, validity, status, timestamp', 'safe', 'on'=>'search'),
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
                  'product'=>array(self::BELONGS_TO, 'Product','id_product'), 
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
                        'id_supplier'=>'Select a supplier',
                        'id_template'=>'Select a Template',
			'voucher_code' => 'Voucher Code',
			'id_product' => 'Product',
			'value' => 'Value',
			'validity' => 'Validity',
			'status' => 'Status',
			'timestamp' => 'Timestamp',
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

		$criteria->compare('id',$this->id);
		$criteria->compare('voucher_code',$this->voucher_code,true);
		$criteria->compare('id_product',$this->id_product);
		$criteria->compare('value',$this->value);
		$criteria->compare('validity',$this->validity,true);
		$criteria->compare('status',$this->status);
		$criteria->compare('timestamp',$this->timestamp,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
        public function getSupplierOptions()
        {
         $suppliers=Supplier::model()->findAll();
         return CHtml::listData($suppliers,'id_supplier','name');
        }
        public function getProductOptions()
        {
            $criteria=new CDbCriteria;
            $criteria->condition="id_supplier=:id_supplier";
            $criteria->order="id_product desc";
            $criteria->params=array(':id_supplier'=>$this->id_supplier);   
	    $products=Product::model()->findAll($criteria);
            // $options=array();
            foreach($products as $k=>$record)
	    {
              $options[$record->id_product]=CHtml::encode($record->tags[0]->name."(INR:".number_format($record->price,0,".","").",id:".$record->id_product.")"); 
                
	    }
            if(isset($options))
           {
             //unset($options[0]);
             return($options);
           }
            else
            return(array());  
           // return CHtml::listData($products,'id_product','productwithprice');
        
        }
        public function getProductTemplateOptions()
        {
            $criteria=new CDbCriteria;
            $criteria->condition="id_supplier=:id_supplier";
            $criteria->order="id_template desc";
            $criteria->params=array(':id_supplier'=>$this->id_supplier);   
	    $templates=ProductTemplate::model()->findAll($criteria);
            // $options=array();
            foreach($templates as $k=>$record)
	    {
              $options[$record->id_template]=CHtml::encode($record->name); 
                
	    }
            if(isset($options))
           {
             //unset($options[0]);
             return($options);
           }
            else
            return(array());  
           // return CHtml::listData($products,'id_product','productwithprice');
        
        }    
        public function getStatusText()
        {
          if($this->status==0)
            return "INACTIVE";
          else if($this->status==1)
            return "ACTIVE";
          else if($this->status==2)
           return "SOLD";
          else if($this->status==3)
           return "REDEEMED";
        }
}

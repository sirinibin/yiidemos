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
class Voucher extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Voucher the static model class
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
			array('voucher_code, id_product, value, validity, timestamp', 'required'),
			array('id_product, status', 'numerical', 'integerOnly'=>true),
			array('value', 'numerical'),
			array('voucher_code', 'length', 'max'=>128),
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
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id' => 'ID',
			'voucher_code' => 'Voucher Code',
			'id_product' => 'Id Product',
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
}
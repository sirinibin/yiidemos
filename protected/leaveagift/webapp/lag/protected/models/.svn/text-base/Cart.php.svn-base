<?php

/**
 * This is the model class for table "ps_cart".
 *
 * The followings are the available columns in table 'ps_cart':
 * @property string $id_cart
 * @property string $id_carrier
 * @property string $id_lang
 * @property string $id_address_delivery
 * @property string $id_address_invoice
 * @property string $id_currency
 * @property string $id_customer
 * @property string $id_guest
 * @property string $secure_key
 * @property integer $recyclable
 * @property integer $gift
 * @property string $gift_message
 * @property string $date_add
 * @property string $date_upd
 */
class Cart extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Cart the static model class
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
		return 'ps_cart';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			//array('id_carrier, id_lang, id_address_delivery, id_address_invoice, id_currency, id_customer, id_guest, date_add, date_upd', 'required'),
			array('recyclable, gift', 'numerical', 'integerOnly'=>true),
			array('id_carrier, id_lang, id_address_delivery, id_address_invoice, id_currency, id_guest', 'length', 'max'=>10),
			array('id_customer', 'length', 'max'=>64),
			array('secure_key', 'length', 'max'=>32),
			array('gift_message', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_cart, id_carrier, id_lang, id_address_delivery, id_address_invoice, id_currency, id_customer, id_guest, secure_key, recyclable, gift, gift_message, date_add, date_upd', 'safe', 'on'=>'search'),
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
			'id_cart' => 'Id Cart',
			'id_carrier' => 'Id Carrier',
			'id_lang' => 'Id Lang',
			'id_address_delivery' => 'Id Address Delivery',
			'id_address_invoice' => 'Id Address Invoice',
			'id_currency' => 'Id Currency',
			'id_customer' => 'Id Customer',
			'id_guest' => 'Id Guest',
			'secure_key' => 'Secure Key',
			'recyclable' => 'Recyclable',
			'gift' => 'Gift',
			'gift_message' => 'Gift Message',
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

		$criteria->compare('id_cart',$this->id_cart,true);
		$criteria->compare('id_carrier',$this->id_carrier,true);
		$criteria->compare('id_lang',$this->id_lang,true);
		$criteria->compare('id_address_delivery',$this->id_address_delivery,true);
		$criteria->compare('id_address_invoice',$this->id_address_invoice,true);
		$criteria->compare('id_currency',$this->id_currency,true);
		$criteria->compare('id_customer',$this->id_customer,true);
		$criteria->compare('id_guest',$this->id_guest,true);
		$criteria->compare('secure_key',$this->secure_key,true);
		$criteria->compare('recyclable',$this->recyclable);
		$criteria->compare('gift',$this->gift);
		$criteria->compare('gift_message',$this->gift_message,true);
		$criteria->compare('date_add',$this->date_add,true);
		$criteria->compare('date_upd',$this->date_upd,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
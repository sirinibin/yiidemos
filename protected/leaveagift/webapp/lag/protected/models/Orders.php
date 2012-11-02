<?php

/**
 * This is the model class for table "ps_orders".
 *
 * The followings are the available columns in table 'ps_orders':
 * @property string $id_order
 * @property string $id_carrier
 * @property string $id_lang
 * @property string $id_customer
 * @property string $id_cart
 * @property string $id_currency
 * @property string $id_address_delivery
 * @property string $id_address_invoice
 * @property string $secure_key
 * @property string $payment
 * @property string $conversion_rate
 * @property string $module
 * @property integer $recyclable
 * @property integer $gift
 * @property string $gift_message
 * @property string $shipping_number
 * @property string $total_discounts
 * @property string $total_paid
 * @property string $total_paid_real
 * @property string $total_products
 * @property string $total_products_wt
 * @property string $total_shipping
 * @property string $carrier_tax_rate
 * @property string $total_wrapping
 * @property string $invoice_number
 * @property string $delivery_number
 * @property string $invoice_date
 * @property string $delivery_date
 * @property string $valid
 * @property string $date_add
 * @property string $date_upd
 */
class Orders extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Orders the static model class
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
		return 'ps_orders';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_carrier, id_lang, id_customer, id_cart, id_currency, id_address_delivery, id_address_invoice, payment, invoice_date, delivery_date, date_add, date_upd', 'required'),
			array('recyclable, gift', 'numerical', 'integerOnly'=>true),
			array('id_carrier, id_lang, id_currency, id_address_delivery, id_address_invoice, carrier_tax_rate, invoice_number, delivery_number', 'length', 'max'=>10),
			array('id_customer, id_cart', 'length', 'max'=>64),
			array('secure_key, shipping_number', 'length', 'max'=>32),
			array('payment, module', 'length', 'max'=>255),
			array('conversion_rate', 'length', 'max'=>13),
			array('total_discounts, total_paid, total_paid_real, total_products, total_products_wt, total_shipping, total_wrapping', 'length', 'max'=>17),
			array('valid', 'length', 'max'=>1),
			array('gift_message', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_order, id_carrier, id_lang, id_customer, id_cart, id_currency, id_address_delivery, id_address_invoice, secure_key, payment, conversion_rate, module, recyclable, gift, gift_message, shipping_number, total_discounts, total_paid, total_paid_real, total_products, total_products_wt, total_shipping, carrier_tax_rate, total_wrapping, invoice_number, delivery_number, invoice_date, delivery_date, valid, date_add, date_upd', 'safe', 'on'=>'search'),
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
			'id_order' => 'Id Order',
			'id_carrier' => 'Id Carrier',
			'id_lang' => 'Id Lang',
			'id_customer' => 'Id Customer',
			'id_cart' => 'Id Cart',
			'id_currency' => 'Id Currency',
			'id_address_delivery' => 'Id Address Delivery',
			'id_address_invoice' => 'Id Address Invoice',
			'secure_key' => 'Secure Key',
			'payment' => 'Payment',
			'conversion_rate' => 'Conversion Rate',
			'module' => 'Module',
			'recyclable' => 'Recyclable',
			'gift' => 'Gift',
			'gift_message' => 'Gift Message',
			'shipping_number' => 'Shipping Number',
			'total_discounts' => 'Total Discounts',
			'total_paid' => 'Total Paid',
			'total_paid_real' => 'Total Paid Real',
			'total_products' => 'Total Products',
			'total_products_wt' => 'Total Products Wt',
			'total_shipping' => 'Total Shipping',
			'carrier_tax_rate' => 'Carrier Tax Rate',
			'total_wrapping' => 'Total Wrapping',
			'invoice_number' => 'Invoice Number',
			'delivery_number' => 'Delivery Number',
			'invoice_date' => 'Invoice Date',
			'delivery_date' => 'Delivery Date',
			'valid' => 'Valid',
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

		$criteria->compare('id_order',$this->id_order,true);
		$criteria->compare('id_carrier',$this->id_carrier,true);
		$criteria->compare('id_lang',$this->id_lang,true);
		$criteria->compare('id_customer',$this->id_customer,true);
		$criteria->compare('id_cart',$this->id_cart,true);
		$criteria->compare('id_currency',$this->id_currency,true);
		$criteria->compare('id_address_delivery',$this->id_address_delivery,true);
		$criteria->compare('id_address_invoice',$this->id_address_invoice,true);
		$criteria->compare('secure_key',$this->secure_key,true);
		$criteria->compare('payment',$this->payment,true);
		$criteria->compare('conversion_rate',$this->conversion_rate,true);
		$criteria->compare('module',$this->module,true);
		$criteria->compare('recyclable',$this->recyclable);
		$criteria->compare('gift',$this->gift);
		$criteria->compare('gift_message',$this->gift_message,true);
		$criteria->compare('shipping_number',$this->shipping_number,true);
		$criteria->compare('total_discounts',$this->total_discounts,true);
		$criteria->compare('total_paid',$this->total_paid,true);
		$criteria->compare('total_paid_real',$this->total_paid_real,true);
		$criteria->compare('total_products',$this->total_products,true);
		$criteria->compare('total_products_wt',$this->total_products_wt,true);
		$criteria->compare('total_shipping',$this->total_shipping,true);
		$criteria->compare('carrier_tax_rate',$this->carrier_tax_rate,true);
		$criteria->compare('total_wrapping',$this->total_wrapping,true);
		$criteria->compare('invoice_number',$this->invoice_number,true);
		$criteria->compare('delivery_number',$this->delivery_number,true);
		$criteria->compare('invoice_date',$this->invoice_date,true);
		$criteria->compare('delivery_date',$this->delivery_date,true);
		$criteria->compare('valid',$this->valid,true);
		$criteria->compare('date_add',$this->date_add,true);
		$criteria->compare('date_upd',$this->date_upd,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
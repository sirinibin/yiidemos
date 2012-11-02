<?php

/**
 * This is the model class for table "ps_customer".
 *
 * The followings are the available columns in table 'ps_customer':
 * @property string $id_customer
 * @property string $id_gender
 * @property string $id_default_group
 * @property string $firstname
 * @property string $lastname
 * @property string $email
 * @property string $passwd
 * @property string $last_passwd_gen
 * @property string $birthday
 * @property integer $newsletter
 * @property string $ip_registration_newsletter
 * @property string $newsletter_date_add
 * @property integer $optin
 * @property string $secure_key
 * @property string $note
 * @property integer $active
 * @property integer $is_guest
 * @property integer $deleted
 * @property string $date_add
 * @property string $date_upd
 */
class Customer extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Customer the static model class
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
		return 'ps_customer';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_gender, firstname, lastname, email, passwd, last_passwd_gen, date_add, date_upd', 'required'),
			array('newsletter, optin, active, is_guest, deleted', 'numerical', 'integerOnly'=>true),
			array('id_gender, id_default_group', 'length', 'max'=>10),
			array('firstname, lastname, passwd, secure_key', 'length', 'max'=>32),
			array('email', 'length', 'max'=>128),
			array('ip_registration_newsletter', 'length', 'max'=>15),
			array('birthday, newsletter_date_add, note', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_customer, id_gender, id_default_group, firstname, lastname, email, passwd, last_passwd_gen, birthday, newsletter, ip_registration_newsletter, newsletter_date_add, optin, secure_key, note, active, is_guest, deleted, date_add, date_upd', 'safe', 'on'=>'search'),
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
			'id_customer' => 'Id Customer',
			'id_gender' => 'Id Gender',
			'id_default_group' => 'Id Default Group',
			'firstname' => 'Firstname',
			'lastname' => 'Lastname',
			'email' => 'Email',
			'passwd' => 'Passwd',
			'last_passwd_gen' => 'Last Passwd Gen',
			'birthday' => 'Birthday',
			'newsletter' => 'Newsletter',
			'ip_registration_newsletter' => 'Ip Registration Newsletter',
			'newsletter_date_add' => 'Newsletter Date Add',
			'optin' => 'Optin',
			'secure_key' => 'Secure Key',
			'note' => 'Note',
			'active' => 'Active',
			'is_guest' => 'Is Guest',
			'deleted' => 'Deleted',
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

		$criteria->compare('id_customer',$this->id_customer,true);
		$criteria->compare('id_gender',$this->id_gender,true);
		$criteria->compare('id_default_group',$this->id_default_group,true);
		$criteria->compare('firstname',$this->firstname,true);
		$criteria->compare('lastname',$this->lastname,true);
		$criteria->compare('email',$this->email,true);
		$criteria->compare('passwd',$this->passwd,true);
		$criteria->compare('last_passwd_gen',$this->last_passwd_gen,true);
		$criteria->compare('birthday',$this->birthday,true);
		$criteria->compare('newsletter',$this->newsletter);
		$criteria->compare('ip_registration_newsletter',$this->ip_registration_newsletter,true);
		$criteria->compare('newsletter_date_add',$this->newsletter_date_add,true);
		$criteria->compare('optin',$this->optin);
		$criteria->compare('secure_key',$this->secure_key,true);
		$criteria->compare('note',$this->note,true);
		$criteria->compare('active',$this->active);
		$criteria->compare('is_guest',$this->is_guest);
		$criteria->compare('deleted',$this->deleted);
		$criteria->compare('date_add',$this->date_add,true);
		$criteria->compare('date_upd',$this->date_upd,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
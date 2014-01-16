<?php

/**
 * This is the model class for table "lag_user".
 *
 * The followings are the available columns in table 'lag_user':
 * @property string $id_user
 * @property integer $id_customer
 * @property string $facebook_userid
 * @property string $facebook_oauthid
 * @property string $facebook_email
 * @property string $name
 * @property string $date_add
 * @property string $date_upd
 */
class User extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return User the static model class
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
		return 'lag_user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_customer, facebook_userid, facebook_oauthid, facebook_email, name, date_add, date_upd', 'required'),
			array('id_customer', 'numerical', 'integerOnly'=>true),
			array('facebook_userid', 'length', 'max'=>32),
			array('facebook_oauthid', 'length', 'max'=>512),
			array('facebook_email, name', 'length', 'max'=>128),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_user, id_customer, facebook_userid, facebook_oauthid, facebook_email, name, date_add, date_upd', 'safe', 'on'=>'search'),
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
                 'gifts_sent'=>array(self::HAS_MANY, 'UserOrder','id_user'),
                 'address_count'=>array(self::STAT, 'UserAddress','id_user'),
                 'address'=>array(self::HAS_ONE, 'UserAddress','id_user'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_user' => 'Id User',
			'id_customer' => 'Id Customer',
			'facebook_userid' => 'Facebook Userid',
			'facebook_oauthid' => 'Facebook Oauthid',
			'facebook_email' => 'Facebook Email',
			'name' => 'Name',
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

		$criteria->compare('id_user',$this->id_user,true);
		$criteria->compare('id_customer',$this->id_customer);
		$criteria->compare('facebook_userid',$this->facebook_userid,true);
		$criteria->compare('facebook_oauthid',$this->facebook_oauthid,true);
		$criteria->compare('facebook_email',$this->facebook_email,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('date_add',$this->date_add,true);
		$criteria->compare('date_upd',$this->date_upd,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}

   
}

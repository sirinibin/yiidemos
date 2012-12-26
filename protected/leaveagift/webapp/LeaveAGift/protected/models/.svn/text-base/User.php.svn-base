<?php

/**
 * This is the model class for table "lag_user".
 *
 * The followings are the available columns in table 'lag_user':
 * @property string $id_user
 * @property string $facebook_id
 * @property string $oauth_id
 * @property string $email_id
 * @property string $first_name
 * @property string $middle_name
 * @property string $last_name
 * @property string $profile_pic_url
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
			array('facebook_id, oauth_id, email_id, first_name, middle_name, last_name, profile_pic_url, date_add, date_upd', 'required'),
			array('facebook_id, oauth_id, profile_pic_url', 'length', 'max'=>100),
			array('email_id', 'length', 'max'=>30),
			array('first_name, middle_name, last_name', 'length', 'max'=>80),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_user, facebook_id, oauth_id, email_id, first_name, middle_name, last_name, profile_pic_url, date_add, date_upd', 'safe', 'on'=>'search'),
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
			'id_user' => 'Id User',
			'facebook_id' => 'Facebook',
			'oauth_id' => 'Oauth',
			'email_id' => 'Email',
			'first_name' => 'First Name',
			'middle_name' => 'Middle Name',
			'last_name' => 'Last Name',
			'profile_pic_url' => 'Profile Pic Url',
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
		$criteria->compare('facebook_id',$this->facebook_id,true);
		$criteria->compare('oauth_id',$this->oauth_id,true);
		$criteria->compare('email_id',$this->email_id,true);
		$criteria->compare('first_name',$this->first_name,true);
		$criteria->compare('middle_name',$this->middle_name,true);
		$criteria->compare('last_name',$this->last_name,true);
		$criteria->compare('profile_pic_url',$this->profile_pic_url,true);
		$criteria->compare('date_add',$this->date_add,true);
		$criteria->compare('date_upd',$this->date_upd,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
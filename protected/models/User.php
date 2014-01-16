<?php

/**
 * This is the model class for table "user".
 *
 * The followings are the available columns in table 'user':
 * @property integer $id
 * @property string $email
 * @property string $first_name
 * @property string $last_name
 * @property string $password
 * @property integer $create_time
 * @property integer $update_time
 */
class User extends CActiveRecord
{
    public $password_confirm;
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
		return 'user';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('email, first_name, last_name, password,password_confirm', 'required'),
			 array('password_confirm', 'compare', 'compareAttribute' => 'password', 'message' => Yii::t('validation', "Passwords don't match")),
			array('create_time, update_time', 'numerical', 'integerOnly'=>true),
			array('email','email'),
			array('email', 'length', 'max'=>500),
			array('first_name, last_name', 'length', 'max'=>200),
			array('password,password_confirm', 'length', 'max'=>300,'min'=>6),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, email, first_name, last_name, password, create_time, update_time', 'safe', 'on'=>'search'),
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
			'email' => 'Email',
			'first_name' => 'First Name',
			'last_name' => 'Last Name',
			'password' => 'Password',
			'create_time' => 'Create Time',
			'update_time' => 'Update Time',
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
		$criteria->compare('email',$this->email,true);
		$criteria->compare('first_name',$this->first_name,true);
		$criteria->compare('last_name',$this->last_name,true);
		$criteria->compare('password',$this->password,true);
		$criteria->compare('create_time',$this->create_time);
		$criteria->compare('update_time',$this->update_time);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	
	public function beforeSave()
	{
	  if($this->isNewRecord)
	   {
	     $this->create_time=time();
	     $this->update_time=time();
	   }
	   else
	   {
	     $this->update_time=time();
	   }
	   
	    $this->password=md5($this->password);
	   return parent::beforeSave();
	}
	   /**
     * Generates a new validation key (additional security for cookie)
     */
     /*
    public function regenerateValidationKey()
    {
        $this->saveAttributes(array(
            'validation_key' => md5(mt_rand() . mt_rand() . mt_rand()),
        ));
    }
    */
}
<?php

/**
 * This is the model class for table "lag_user_order".
 *
 * The followings are the available columns in table 'lag_user_order':
 * @property string $id_user_gift
 * @property string $id_cart
 * @property string $id_product
 * @property string $id_user
 * @property string $receiver_fbid
 * @property string $receiver_fbemail
 * @property string $notify_email
 * @property string $img_url
 * @property string $message_card
 * @property string $message_post
 * @property string $title
 * @property string $delivery_date
 * @property string $greeting
 * @property string $gift_opened
 * @property string $gift_rating
 * @property string $date_add
 * @property string $date_upd
 */
class UserOrder extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return UserOrder the static model class
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
		return 'lag_user_order';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			//array('id_cart, id_product, id_user, title, delivery_date, greeting, gift_opened, gift_rating, date_add, date_upd', 'required'),UserOrde
			
			array('id_cart, id_product, id_user', 'length', 'max'=>64),
			array('receiver_fbid, receiver_fbemail, notify_email, img_url, title', 'length', 'max'=>128),
			array('greeting', 'length', 'max'=>32),
			array('gift_opened, gift_rating', 'length', 'max'=>8),
			array('message_card, message_post', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_user_gift, id_cart, id_product, id_user, receiver_fbid, receiver_fbemail, notify_email, img_url, message_card, message_post, title, delivery_date, greeting, gift_opened, gift_rating, date_add, date_upd', 'safe', 'on'=>'search'),
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
                   'sender'=>array(self::BELONGS_TO,'User','id_user'),
                   'product'=>array(self::BELONGS_TO,'Product','id_product'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_user_gift' => 'Id User Gift',
			'id_cart' => 'Id Cart',
			'id_product' => 'Id Product',
			'id_user' => 'Id User',
			'receiver_fbid' => 'Receiver Fbid',
			'receiver_fbemail' => 'Receiver Fbemail',
			'notify_email' => 'Notify Email',
			'img_url' => 'Img Url',
			'message_card' => 'Message Card',
			'message_post' => 'Message Post',
			'title' => 'Title',
			'delivery_date' => 'Delivery Date',
			'greeting' => 'Greeting',
			'gift_opened' => 'Gift Opened',
			'gift_rating' => 'Gift Rating',
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

		$criteria->compare('id_user_gift',$this->id_user_gift,true);
		$criteria->compare('id_cart',$this->id_cart,true);
		$criteria->compare('id_product',$this->id_product,true);
		$criteria->compare('id_user',$this->id_user,true);
		$criteria->compare('receiver_fbid',$this->receiver_fbid,true);
		$criteria->compare('receiver_fbemail',$this->receiver_fbemail,true);
		$criteria->compare('notify_email',$this->notifUserOrdey_email,true);
		$criteria->compare('img_url',$this->img_url,true);
		$criteria->compare('message_card',$this->message_card,true);
		$criteria->compare('message_post',$this->message_post,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('delivery_date',$this->delivery_date,true);
		$criteria->compare('greeting',$this->greeting,true);
		$criteria->compare('gift_opened',$this->gift_opened,true);
		$criteria->compare('gift_rating',$this->gift_rating,true);
		$criteria->compare('date_add',$this->date_add,true);
		$criteria->compare('date_upd',$this->date_upd,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
/*
        public function reserveVoucher($id_user_gift)
	{
						
		

	
	}
*/
}

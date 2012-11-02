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
 * @property string $receiver_fbfirstname
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
 * @property string $facebook_postid
 * @property integer $post_email_status
 * @property integer $thankyouid
 * @property string $date_add
 * @property string $date_upd
 */
class UserOrder extends CActiveRecord
{
    public $endDate;
    public $from_date;
    public $to_date;
    
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
			array('id_cart, id_product, id_user, title, delivery_date, greeting, gift_opened, gift_rating, date_add, date_upd', 'required'),
			array('post_email_status, thankyouid', 'numerical', 'integerOnly'=>true),
			array('id_cart, id_product, id_user, receiver_fbfirstname, facebook_postid', 'length', 'max'=>64),
			array('receiver_fbid, receiver_fbemail, notify_email, img_url, title', 'length', 'max'=>128),
			array('greeting', 'length', 'max'=>32),
			array('gift_opened, gift_rating', 'length', 'max'=>8),
			array('message_card, message_post,from_date,to_date,date_add', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_user_gift, id_cart, id_product, id_user, receiver_fbid, receiver_fbfirstname, receiver_fbemail, notify_email, img_url, message_card, message_post, title, delivery_date, greeting, gift_opened, gift_rating, facebook_postid, post_email_status, thankyouid, date_add, date_upd,endDate,from_date,to_date', 'safe', 'on'=>'search'),
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
                  'sender'=>array(self::BELONGS_TO, 'User','id_user'),
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
			'id_product' => 'Product',
			'id_user' => 'Sender',
			'receiver_fbid' => 'Receiver Fbid',
			'receiver_fbfirstname' => 'Receiver',
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
			'facebook_postid' => 'Facebook Postid',
			'post_email_status' => 'Post Email Status',
			'thankyouid' => 'Thankyouid',
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
                $criteria->order='id_user_gift desc';
                $criteria->with=array('sender');
 
              
		$criteria->compare('id_user_gift',$this->id_user_gift,true);
		$criteria->compare('id_cart',$this->id_cart,true);
		$criteria->compare('id_product',$this->id_product,true);
		$criteria->compare('sender.name',$this->id_user,true);
		$criteria->compare('receiver_fbid',$this->receiver_fbid,true);
		$criteria->compare('receiver_fbfirstname',$this->receiver_fbfirstname,true);
		$criteria->compare('receiver_fbemail',$this->receiver_fbemail,true);
		$criteria->compare('notify_email',$this->notify_email,true);
		$criteria->compare('img_url',$this->img_url,true);
		$criteria->compare('message_card',$this->message_card,true);
		$criteria->compare('message_post',$this->message_post,true);
		$criteria->compare('title',$this->title,true);
		$criteria->compare('delivery_date',$this->delivery_date,true);
		$criteria->compare('greeting',$this->greeting,true);
		$criteria->compare('gift_opened',$this->gift_opened,true);
		$criteria->compare('gift_rating',$this->gift_rating,true);
		$criteria->compare('facebook_postid',$this->facebook_postid,true);
		$criteria->compare('post_email_status',$this->post_email_status);
		$criteria->compare('thankyouid',$this->thankyouid);
		 
		//$criteria->compare('date_add',$this->date_add,true);
		//$criteria->compare('date_upd',$this->date_upd,true);
		
		 // if (!empty($this->date_add)) $criteria->addCondition('t.date_add >= "'.date("Y/m/d 00:00:01",strtotime($this->date_add)).'"');
		  //if (!empty($this->endDate)) $criteria->addCondition('t.date_add <= "'.date("Y/m/d 23:59:59",strtotime($this->endDate)).'"');
		
		   if (!empty($this->date_add)) $criteria->addCondition('t.date_add >= "'.Yii::app()->dateFormatter->format('yyyy-MM-dd 00:00:01', $this->date_add).'"');
		   if (!empty($this->endDate)) $criteria->addCondition('t.date_upd <= "'.Yii::app()->dateFormatter->format('yyyy-MM-dd 23:59:59', $this->endDate).'"');
               
                /*echo "from:".$this->from_date;
                echo "to:".$this->from_date;
                
                exit;*/
                
                // if (!empty($this->from_date)) $criteria->compare('date_add',' >= "'.$this->from_date.'"',true);
                // if (!empty($this->to_date)) $criteria->compare('date_add',' <= "'.$this->to_date.'"',true);
                
                //if (!empty($this->from_date)) $criteria->addCondition('date_add >= "'.Yii::app()->dateFormatter->format('yyyy-MM-dd 00:00:01', $this->from_date).'"');
		// if (!empty($this->to_date)) $criteria->addCondition('date_add <= "'.Yii::app()->dateFormatter->format('yyyy-MM-dd 23:59:59', $this->to_date).'"');
		 /*
                if(!empty($this->from_date) && empty($this->to_date))
		  {
		      $criteria->condition = "t.date_add >= '".$this->from_date."'";  // date is database date column field
		  }else if(!empty($this->to_date) && empty($this->from_date))
		  {
		      $criteria->condition = "t.date_add <= '".$this->to_date."'";
		  }else if(!empty($this->to_date) && !empty($this->from_date))
		  {
		     // $from=(isset(Yii::app()->request->cookies['from_date'])) ? Yii::app()->request->cookies['from_date']->value : '';
		      //$to=(isset(Yii::app()->request->cookies['to_date'])) ? Yii::app()->request->cookies['to_date']->value : '';
		      $criteria->addCondition( "t.date_add  >= '".$this->from_date."' and t.date_add <= '".$this->to_date."'");
		     // $criteria->condition = "date_add  >= '".$this->from_date."' and date_add <= '".$this->to_date."'";
		  } 
                 */
		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
   public function getTagOptions()
    {
      $tags=Tag::model()->findAll();
      return(CHtml::listData($tags,'id_tag','name'));
    }
  public function getSender()
   {  
     
     if(isset($this->sender))
      {
    return(CHtml::image("https://graph.facebook.com/".$this->sender->facebook_userid."/picture?width=75&height=70&return_ssl_results=1","",array("style"=>"width:25px;height:25px;")).$this->sender->name);

      }
     else
     {
      return("");
     }

   }
  public function getReceiver()
  {
   if($this->receiver_fbid&&$this->receiver_fbfirstname)
   {  
   return(CHtml::image("https://graph.facebook.com/".$this->receiver_fbid."/picture?width=75&height=70&return_ssl_results=1","",array("style"=>"width:25px;height:25px;")) .$this->receiver_fbfirstname);
   }
   else
     return("");

  }
  public function getProductType($type='text')
  {
   
    if(isset($this->product->tags[0]->name))
     { 
       if($type=='text')
        return($this->product->tags[0]->name);
       else if($type=="link")
        return("<a href='".Yii::app()->createUrl('admin/product/view',array('id'=>$this->id_product))."' >".$this->product->tags[0]->name."</a>");
     }
    else
       return("");
  }
  public function getDeliveryDate()
  {
   if(!isset($this->delivery_date))
    {
      return("Pending");
    }
   else
   return(date("M-d-Y",strtotime($this->delivery_date)));
 
  }
   public function getUserValidity()
  {
   return(date('M-d-Y',strtotime($this->delivery_date." +".$this->product->user_validity." days")));      
  }
  public function isUserReceiver()
 {
   $session=new CHttpSession;
   $session->open(); 
     
   if($this->receiver_fbid==$session['me']['id'])
    {
       return(true);
    }
    else
    {
       return(false);
    }    
  
 }
   
}

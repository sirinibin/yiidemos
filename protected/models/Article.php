<?php

/**
 * This is the model class for table "article".
 *
 * The followings are the available columns in table 'article':
 * @property integer $id
 * @property string $title
 * @property string $content
 * @property string $image
 * @property string $caption
 * @property string $author_name
 * @property string $author_email
 * @property string $author_twitter
 * @property string $link
 * @property string $createdAt
 */
class Article extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Article the static model class
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
		return 'article';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('title', 'required'),
			array('link','unique'),
			array('content','safe'),
			array('title, image, caption', 'length', 'max'=>300),
			array('author_name, author_email, author_twitter', 'length', 'max'=>100),
			array('link', 'length', 'max'=>400),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, title, content, image, caption, author_name, author_email, author_twitter, link, createdAt', 'safe', 'on'=>'search'),
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
			'title' => 'Title',
			'content' => 'Content',
			'image' => 'Image',
			'caption' => 'Caption',
			'author_name' => 'Author Name',
			'author_email' => 'Author Email',
			'author_twitter' => 'Author Twitter',
			'link' => 'Link',
			'createdAt' => 'Created At',
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
		$criteria->compare('title',$this->title,true);
		$criteria->compare('content',$this->content,true);
		$criteria->compare('image',$this->image,true);
		$criteria->compare('caption',$this->caption,true);
		$criteria->compare('author_name',$this->author_name,true);
		$criteria->compare('author_email',$this->author_email,true);
		$criteria->compare('author_twitter',$this->author_twitter,true);
		$criteria->compare('link',$this->link,true);
		$criteria->compare('createdAt',$this->createdAt,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
	public function getImage()
	{
	 
	  return("<img src='".$this->image."' width='200' height='200'>");
	}
}
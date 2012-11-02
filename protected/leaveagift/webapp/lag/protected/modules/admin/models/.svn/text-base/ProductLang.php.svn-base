<?php

/**
 * This is the model class for table "ps_product_lang".
 *
 * The followings are the available columns in table 'ps_product_lang':
 * @property string $id_product
 * @property string $id_lang
 * @property string $description
 * @property string $description_short
 * @property string $link_rewrite
 * @property string $meta_description
 * @property string $meta_keywords
 * @property string $meta_title
 * @property string $name
 * @property string $available_now
 * @property string $available_later
 */
class ProductLang extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return ProductLang the static model class
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
		return 'ps_product_lang';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_product, id_lang, link_rewrite, name', 'required'),
			array('id_product', 'length', 'max'=>64),
			array('id_lang', 'length', 'max'=>10),
			array('link_rewrite, meta_title, name', 'length', 'max'=>128),
			array('meta_description, meta_keywords, available_now, available_later', 'length', 'max'=>255),
			array('description, description_short', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_product, id_lang, description, description_short, link_rewrite, meta_description, meta_keywords, meta_title, name, available_now, available_later', 'safe', 'on'=>'search'),
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
			'id_product' => 'Id Product',
			'id_lang' => 'Id Lang',
			'description' => 'Description',
			'description_short' => 'Description Short',
			'link_rewrite' => 'Link Rewrite',
			'meta_description' => 'Meta Description',
			'meta_keywords' => 'Meta Keywords',
			'meta_title' => 'Meta Title',
			'name' => 'Name',
			'available_now' => 'Available Now',
			'available_later' => 'Available Later',
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

		$criteria->compare('id_product',$this->id_product,true);
		$criteria->compare('id_lang',$this->id_lang,true);
		$criteria->compare('description',$this->description,true);
		$criteria->compare('description_short',$this->description_short,true);
		$criteria->compare('link_rewrite',$this->link_rewrite,true);
		$criteria->compare('meta_description',$this->meta_description,true);
		$criteria->compare('meta_keywords',$this->meta_keywords,true);
		$criteria->compare('meta_title',$this->meta_title,true);
		$criteria->compare('name',$this->name,true);
		$criteria->compare('available_now',$this->available_now,true);
		$criteria->compare('available_later',$this->available_later,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
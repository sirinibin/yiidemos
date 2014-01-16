<?php

/**
 * This is the model class for table "ps_category".
 *
 * The followings are the available columns in table 'ps_category':
 * @property string $id_category
 * @property string $id_parent
 * @property integer $level_depth
 * @property string $nleft
 * @property string $nright
 * @property integer $active
 * @property string $date_add
 * @property string $date_upd
 * @property string $position
 */
class Category extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Category the static model class
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
		return 'ps_category';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_parent, date_add, date_upd', 'required'),
			array('level_depth, active', 'numerical', 'integerOnly'=>true),
			array('id_parent, nleft, nright, position', 'length', 'max'=>10),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_category, id_parent, level_depth, nleft, nright, active, date_add, date_upd, position', 'safe', 'on'=>'search'),
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
			'category_lang'=>array(self::HAS_ONE, 'CategoryLang','id_category'),
			'category_product'=>array(self::MANY_MANY, 'CategoryProduct','id_category'),
		);
	}

	/**
	 * @return array customized attribute labels (name=>label)
	 */
	public function attributeLabels()
	{
		return array(
			'id_category' => 'Id Category',
			'id_parent' => 'Id Parent',
			'level_depth' => 'Level Depth',
			'nleft' => 'Nleft',
			'nright' => 'Nright',
			'active' => 'Active',
			'date_add' => 'Date Add',
			'date_upd' => 'Date Upd',
			'position' => 'Position',
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

		$criteria->compare('id_category',$this->id_category,true);
		$criteria->compare('id_parent',$this->id_parent,true);
		$criteria->compare('level_depth',$this->level_depth);
		$criteria->compare('nleft',$this->nleft,true);
		$criteria->compare('nright',$this->nright,true);
		$criteria->compare('active',$this->active);
		$criteria->compare('date_add',$this->date_add,true);
		$criteria->compare('date_upd',$this->date_upd,true);
		$criteria->compare('position',$this->position,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}

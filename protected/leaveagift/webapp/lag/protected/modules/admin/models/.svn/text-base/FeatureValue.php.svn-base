<?php

/**
 * This is the model class for table "ps_feature_value".
 *
 * The followings are the available columns in table 'ps_feature_value':
 * @property string $id_feature_value
 * @property string $id_feature
 * @property integer $custom
 */
class FeatureValue extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return FeatureValue the static model class
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
		return 'ps_feature_value';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_feature', 'required'),
			array('custom', 'numerical', 'integerOnly'=>true),
			array('id_feature', 'length', 'max'=>10),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id_feature_value, id_feature, custom', 'safe', 'on'=>'search'),
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
			'id_feature_value' => 'Id Feature Value',
			'id_feature' => 'Id Feature',
			'custom' => 'Custom',
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

		$criteria->compare('id_feature_value',$this->id_feature_value,true);
		$criteria->compare('id_feature',$this->id_feature,true);
		$criteria->compare('custom',$this->custom);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
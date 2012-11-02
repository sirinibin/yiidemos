<?php

/**
 * This is the model class for table "lag_payment".
 *
 * The followings are the available columns in table 'lag_payment':
 * @property integer $id
 * @property string $id_transaction
 * @property string $pgTxnNo
 * @property string $TxRefNo
 * @property double $amount
 * @property string $TxMsg
 * @property string $authIdCode
 * @property string $issuerRefNo
 * @property string $signature
 * @property string $TxStatus
 * @property integer $id_order
 * @property integer $id_user
 * @property string $starttime
 * @property string $endtime
 */
class Payment extends CActiveRecord
{
	/**
	 * Returns the static model of the specified AR class.
	 * @param string $className active record class name.
	 * @return Payment the static model class
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
		return 'lag_payment';
	}

	/**
	 * @return array validation rules for model attributes.
	 */
	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
			array('id_transaction, pgTxnNo, TxRefNo, amount, TxMsg, authIdCode, issuerRefNo, signature, TxStatus, id_order, id_user, starttime', 'required'),
			array('id_order, id_user', 'numerical', 'integerOnly'=>true),
			array('amount', 'numerical'),
			array('id_transaction, TxStatus', 'length', 'max'=>128),
			array('endtime', 'safe'),
			// The following rule is used by search().
			// Please remove those attributes that should not be searched.
			array('id, id_transaction, pgTxnNo, TxRefNo, amount, TxMsg, authIdCode, issuerRefNo, signature, TxStatus, id_order, id_user, starttime, endtime', 'safe', 'on'=>'search'),
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
			'id_transaction' => 'Id Transaction',
			'pgTxnNo' => 'Pg Txn No',
			'TxRefNo' => 'Tx Ref No',
			'amount' => 'Amount',
			'TxMsg' => 'Tx Msg',
			'authIdCode' => 'Auth Id Code',
			'issuerRefNo' => 'Issuer Ref No',
			'signature' => 'Signature',
			'TxStatus' => 'Tx Status',
			'id_order' => 'Id Order',
			'id_user' => 'Id User',
			'starttime' => 'Starttime',
			'endtime' => 'Endtime',
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
		$criteria->compare('id_transaction',$this->id_transaction,true);
		$criteria->compare('pgTxnNo',$this->pgTxnNo,true);
		$criteria->compare('TxRefNo',$this->TxRefNo,true);
		$criteria->compare('amount',$this->amount);
		$criteria->compare('TxMsg',$this->TxMsg,true);
		$criteria->compare('authIdCode',$this->authIdCode,true);
		$criteria->compare('issuerRefNo',$this->issuerRefNo,true);
		$criteria->compare('signature',$this->signature,true);
		$criteria->compare('TxStatus',$this->TxStatus,true);
		$criteria->compare('id_order',$this->id_order);
		$criteria->compare('id_user',$this->id_user);
		$criteria->compare('starttime',$this->starttime,true);
		$criteria->compare('endtime',$this->endtime,true);

		return new CActiveDataProvider($this, array(
			'criteria'=>$criteria,
		));
	}
}
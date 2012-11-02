<?php

class MessageForm extends CFormModel
{

 	public $message;

	/**
	 * Declares the validation rules.
	 * title is required
	 */
	public function rules()
	{
		return array(
			array('message', 'required'),
		       );
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'message'=>'Message',
		);
	}
 
}

?>

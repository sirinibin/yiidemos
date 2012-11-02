<?php

class NameForm extends CFormModel
{

 	public $name;

	/**
	 * Declares the validation rules.
	 * title is required
	 */
	public function rules()
	{
		return array(
			array('name', 'required'),
		       );
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'name'=>'Name',
		);
	}
 
}

?>

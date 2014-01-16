<?php

class ExcelImportForm extends CFormModel
{
 public $excel;
  	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
                              array('excel', 'file', 
                                            'types'=>'xls,xlsx',
                                            'maxSize'=>1024 * 1024 * 10, // 10MB
                                            'tooLarge'=>'The file was larger than 10MB. Please upload a smaller file.',
                                            'allowEmpty' => true
                                  ),
                   
 
                            );
        }
 
        public function attributeLabels()
	{
		return array(
                          'excel'=>'Select Excel file'
                          );
        }
 
            
}
?>

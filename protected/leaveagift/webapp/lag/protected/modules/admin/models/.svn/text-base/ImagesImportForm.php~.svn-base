<?php

class ImagesImportForm extends CFormModel
{
 public $zip;
  	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
                              array('zip', 'file', 
                                            'types'=>'zip',
                                            'maxSize'=>1024 * 1024 * 10, // 10MB
                                            'tooLarge'=>'The file was larger than 10MB. Please upload a smaller file.',
                                            'allowEmpty' => true
                                  ),
                   
 
                            );
        }
 
        public function attributeLabels()
	{
		return array(
                          'zip'=>'Select a zip folder'
                          );
        }
 
            
}
?>

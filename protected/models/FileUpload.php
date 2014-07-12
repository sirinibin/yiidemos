<?php

/**
 * ContactForm class.
 * ContactForm is the data structure for keeping
 * contact form data. It is used by the 'contact' action of 'SiteController'.
 */
class FileUpload extends CFormModel
{
	public $file;
	

	/**
	 * Declares the validation rules.
	 */
	 public function rules()
        {
            // NOTE: you should only define rules for those attributes that
           // will receive user inputs.
          return array(  
             array('file', 'file', 
                                            'types'=>'xls,ppt,pptx',
                                          //  'maxSize'=>1024 * 1024 * 10, // 10MB
                                            //'tooLarge'=>'The file was larger than 10MB. Please upload a smaller file.',
                                            'allowEmpty' => true
                              ),
                   );
        }

	/**
	 * Declares customized attribute labels.
	 * If not declared here, an attribute would have a label that is
	 * the same as its name with the first letter in upper case.
	 */
	 public function attributeLabels()
        {
         return array(
              'file' => 'Select file',
          );
        }
}
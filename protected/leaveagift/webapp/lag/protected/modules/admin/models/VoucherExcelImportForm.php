<?php

class VoucherExcelImportForm extends CFormModel
{
 public $excel;
 public $id_supplier;

  	public function rules()
	{
		// NOTE: you should only define rules for those attributes that
		// will receive user inputs.
		return array(
                              array('id_supplier','required'),
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
     public function getSupplierOptions()
        {
         $suppliers=Supplier::model()->findAll();
         return CHtml::listData($suppliers,'id_supplier','name');
        }
 
            
}
?>

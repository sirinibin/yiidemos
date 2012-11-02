<?php

class GiftReturnForm extends CFormModel
{

 	public $message;
        public $gifts;

	/**
	 * Declares the validation rules.
	 *
	 */
	public function rules()
	{
		return array(
			 array('message,gifts','safe'),
		       );
	}

	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'message'=>'Would you like to write a thank you message?',
                        'gifts'=>'Add a free return e-voucher to your message',
		);
	}
 
        public function getGiftOptions()
        {
          $criteria=new CDbCriteria;
          $criteria->condition="is_published='1' and (is_return_gift='1' or is_return_gift='2')  ";
          $criteria->limit="4";
          $criteria->order="position asc";
          $products=Product::model()->findAll($criteria);
 
            $i=0;
            $options=array();
          foreach($products as $p)
          {
             //echo "<br/>".$p->id_product;
             
          
             $options[$p->id_product]='
                         <div class="returnGift-frameInside-RowRight"><img src="'.$p->getSupplierLogo(2).'"  alt="" /><br />
  <span class="WebRupee">Rs.</span> <span class="giftrup">'.CHtml::encode(number_format($p->getPriceValue(),0,".","")).'</span>
 </div>
   
   </div>
   
   <div class="returnGift-frameInside-Row">
   <div class="giftvalid">
   Validity: '.$p->template->user_validity.' days</div>
     <div class="giftMinSpend">
   Min. spend <span class="WebRupee">Rs.</span>'.CHtml::encode(number_format($p->min_purchase,0,".","")).'</div>
   
   
   </div>
    
     <div class="returnGift-frameInside-RowCheckbox">
     <input onclick="uncheckOthers(this.id);" class="giftcheckbox" id="GiftReturnForm_gifts_'.$i.'" value="'.$p->id_product.'" type="checkbox" name="GiftReturnForm[gifts][]" /> 
     <label for="GiftReturnForm_gifts_'.$i.'"></label>
     </div>
</div>                 ';
 
          $i++;

          }
        /*  print_r($options);
          exit;*/
       return($options);
     
         /* return CHtml::listData($products,'id_product',array('template'=>'
          <div class="returnGift-frameInside-RowRight"><img src="'.Yii::app()->request->baseUrl.'/images/brand-flipkart.jpg" width="100" height="34" alt="" /><br />
  <span class="WebRupee">Rs.</span> <span class="giftrup">200</span>
 </div>
   
   </div>
   
   <div class="returnGift-frameInside-Row">
   <div class="giftvalid">
   Validity: 30 days</div>
     <div class="giftMinSpend">
   Min. spend <span class="WebRupee">Rs.</span> 4000</div>
   
   </div>
 
          '));
            */
             

        /*
          $options[] array(
                    '1'=>'
                         <div class="returnGift-frameInside-RowRight"><img src="'.Yii::app()->request->baseUrl.'/images/brand-flipkart.jpg" width="100" height="34" alt="" /><br />
  <span class="WebRupee">Rs.</span> <span class="giftrup">200</span>
 </div>
   
   </div>
   
   <div class="returnGift-frameInside-Row">
   <div class="giftvalid">
   Validity: 30 days</div>
     <div class="giftMinSpend">
   Min. spend <span class="WebRupee">Rs.</span> 4000</div>
   
   
   </div>


                    ',
                    '2'=>'
                   <div class="returnGift-frameInside-RowRight"><img src="'.Yii::app()->request->baseUrl.'/images/brand-flipkart.jpg" width="100" height="34" alt="" /><br />
  <span class="WebRupee">Rs.</span> <span class="giftrup">450</span>
 </div>
   
   </div>
   
   <div class="returnGift-frameInside-Row">
   <div class="giftvalid">
   Validity: 30 days</div>
     <div class="giftMinSpend">
   Min. spend <span class="WebRupee">Rs.</span> 4000</div>
   
   
   </div>
',
                    '3'=>'
 <div class="returnGift-frameInside-RowRight"><img src="'.Yii::app()->request->baseUrl.'/images/brand-flipkart.jpg" width="100" height="34" alt="" /><br />
  <span class="WebRupee">Rs.</span> <span class="giftrup">560</span>
 </div>
   
   </div>
   
   <div class="returnGift-frameInside-Row">
   <div class="giftvalid">
   Validity: 30 days</div>
     <div class="giftMinSpend">
   Min. spend <span class="WebRupee">Rs.</span> 2000</div>
   
   
   </div>

',
                    '4'=>'
 <div class="returnGift-frameInside-RowRight"><img src="'.Yii::app()->request->baseUrl.'/images/brand-flipkart.jpg" width="100" height="34" alt="" /><br />
  <span class="WebRupee">Rs.</span> <span class="giftrup">260</span>
 </div>
   
   </div>
   
   <div class="returnGift-frameInside-Row">
   <div class="giftvalid">
   Validity: 30 days</div>
     <div class="giftMinSpend">
   Min. spend <span class="WebRupee">Rs.</span> 1000</div>
   
   
   </div>

',
                    '5'=>'
<div class="returnGift-frameInside-RowRight"><img src="'.Yii::app()->request->baseUrl.'/images/brand-flipkart.jpg" width="100" height="34" alt="" /><br />
  <span class="WebRupee">Rs.</span> <span class="giftrup">600</span>
 </div>
   
   </div>
   
   <div class="returnGift-frameInside-Row">
   <div class="giftvalid">
   Validity: 30 days</div>
     <div class="giftMinSpend">
   Min. spend <span class="WebRupee">Rs.</span> 6000</div>
   
   
   </div>

',
                    '6'=>'
<div class="returnGift-frameInside-RowRight"><img src="'.Yii::app()->request->baseUrl.'/images/brand-flipkart.jpg" width="100" height="34" alt="" /><br />
  <span class="WebRupee">Rs.</span> <span class="giftrup">700</span>
 </div>
   
   </div>
   
   <div class="returnGift-frameInside-Row">
   <div class="giftvalid">
   Validity: 30 days</div>
     <div class="giftMinSpend">
   Min. spend <span class="WebRupee">Rs.</span> 9000</div>
      
   </div>

',

                  );
          */
        }
  public function getPublishedReturnGiftCount()
  {
          $criteria=new CDbCriteria;
          $criteria->condition="is_published='1' and (is_return_gift='1' or is_return_gift='2')  ";
          return(Product::model()->count($criteria));
  
  }
  
          
}

?>

<?php
/* @var $this PayFormController */
/* @var $model PayForm */
/* @var $form CActiveForm */
/*

?>
</div>
<div id="form-gift">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'pay-form-payform-form',
	'enableAjaxValidation'=>false,
        'method'=>'POST',
        //'action'=>'https://localhost/citrus/test/testTransaction.php'
       // 'action'=>,
)); ?>

	<!--<p class="note">Fields with <span class="required">*</span> are required.</p> -->

	<?php echo $form->errorSummary($model); ?>
<h1> Payment is of Rs 72 only </h1>

	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'firstName'); ?></h2>
		<?php echo $form->textField($model,'firstName',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'firstName'); ?>
	</div>
	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'lastName'); ?></h2>
		<?php echo $form->textField($model,'lastName',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'lastName'); ?>
	</div>
	
	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'phoneNumber'); ?></h2>
		<?php echo $form->textField($model,'phoneNumber',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'phoneNumber'); ?>
	</div>
	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'email'); ?></h2>
		<?php echo $form->textField($model,'email',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'email'); ?>
	</div>

	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'addressStreet1'); ?></h2>
		<?php echo $form->textField($model,'addressStreet1',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'addressStreet1'); ?>
	</div>
	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'addressCity'); ?></h2>
		<?php echo $form->textField($model,'addressCity',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'addressCity'); ?>
	</div>
	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'addressState'); ?></h2>
		<?php echo $form->textField($model,'addressState',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'addressState'); ?>
	</div>
	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'addressCountry'); ?></h2>
		<?php echo $form->textField($model,'addressCountry',array('class'=>"textbox")); ?>
                <?php echo $form->HiddenField($model,'payment_mode',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'addressCountry'); ?>
	</div>

	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'addressZip'); ?></h2>
		<?php echo $form->textField($model,'addressZip',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'addressZip'); ?>
	</div>
	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'bankName'); ?></h2>
		<?php echo $form->dropDownList($model,'bankName',$model->getBankOptions()); ?>
		<?php echo $form->error($model,'bankName'); ?>
	</div>
	<div class="form-row">
		<h2><?php echo $form->labelEx($model,'paymentMode'); ?></h2>
		<?php echo $form->dropDownList($model,'paymentMode',$model->getModeOptions()); ?>
		<?php echo $form->error($model,'paymentMode'); ?>
	</div>



<!--
	<div class="form-row">	</div>
		<h2><?php echo $form->labelEx($model,'amount'); ?></h2>
		<?php echo $form->textField($model,'amount',array('class'=>"textbox")); ?>
		<?php echo $form->error($model,'amount'); ?>
	</div>
-->

	<div class="row buttons">
		<?php echo CHtml::submitButton('Submit'); ?>
	</div>


<?php $this->endWidget(); ?>

</div><!-- form -->

<!--

			'firstame'=>'First Name',
			'lastname'=>'Last Name',
			'phoneNumber'=>'Mobile Number',
			'email'=>'Email Address',
			'bankname'=>'Name Of The bank',
			'addressState'=>'State',
			'addressCity'=>'City',
			'addressstreet1'=>'Street',
			'addressCountry'=>'Country',
			'addressZip'=>'Zip Code',
			'paymentMode'=>'Payment Mode',
			'returnUrl'=>'Return Url',
			'amount'=>'Amount'

-->

*/

?>



<script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl; ?>/js/jquery.js"></script>
<script type="text/javascript">
	$(document).ready(function(){	

		if (!$.browser.opera) {
    
			// select element styling
			$('select.select').each(function(){
				var title = $(this).attr('title');
				if( $('option:selected', this).val() != ''  ) title = $('option:selected',this).text();
				$(this)
					.css({'z-index':10,'opacity':0,'-khtml-appearance':'none'})
					.after('<span class="select">' + title + '</span>')
					.change(function(){
						val = $('option:selected',this).text();
						$(this).next().text(val);
						})
			});

		};
		
	});
	
	$(document).ready(function(){	

		if (!$.browser.opera) {
    
			// select element styling
			$('select.select_small').each(function(){
				var title = $(this).attr('title');
				if( $('option:selected', this).val() != ''  ) title = $('option:selected',this).text();
				$(this)
					.css({'z-index':10,'opacity':0,'-khtml-appearance':'none'})
					.after('<span class="select_small">' + title + '</span>')
					.change(function(){
						val = $('option:selected',this).text();
						$(this).next().text(val);
						})
			});

		};
		
	});
	
	$(document).ready(function(){	

		if (!$.browser.opera) {
    
			// select element styling
			$('select.select_smaller').each(function(){
				var title = $(this).attr('title');
				if( $('option:selected', this).val() != ''  ) title = $('option:selected',this).text();
				$(this)
					.css({'z-index':10,'opacity':0,'-khtml-appearance':'none'})
					.after('<span class="select_smaller">' + title + '</span>')
					.change(function(){
						val = $('option:selected',this).text();
						$(this).next().text(val);
						})
			});

		};
		
	});
</script>

<link rel="stylesheet" type="text/css" href="http://cdn.webrupee.com/font">




  </div>
  <!-- content starts -->
  <div id="content">
  <div class="payment_wrapper">
<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'pay-form-payform-form',
	'enableAjaxValidation'=>false,
        'method'=>'POST',
        //'action'=>'https://localhost/citrus/test/testTransaction.php'
       // 'action'=>,
)); ?>

	<!--<p class="note">Fields with <span class="required">*</span> are required.</p> -->

	<?php echo $form->errorSummary($model); ?>

  
  <!-- payment content -->
  <div class="billing_container">
  <div class="white_patch"></div>
    <div class="billing_head">Billing Address
    <div class="oragne_bullet">1</div>
    </div>
    <div class="clear_form_top"></div>
    <div class="section_a">
    <div class="text_field_outer"><?php echo $form->labelEx($model,'firstName'); ?>
      <label for="firstName"></label>
<!--
      <input name="firstName" type="text" class="textbox_payment" id="firstName" value="" />
-->
<?php echo $form->textField($model,'firstName',array('class'=>"textbox_payment")); ?>
    </div>
    <div class="text_field_outer_right"><?php echo $form->labelEx($model,'lastName'); ?>
      <?php echo $form->textField($model,'lastName',array('class'=>"textbox_payment")); ?>
    </div>
    </div>
    <div class="clear_form_"></div><div class="section_a">
    <div class="text_field_outer">
      <?php echo $form->labelEx($model,'email'); ?>
      <?php echo $form->textField($model,'email',array('class'=>"textbox_payment")); ?>
    </div>
    <div class="text_field_outer_right">Mobile*
      <input type="text" name="phoneNumber" id="phoneNumber" class="textbox_payment" />
    </div>
    </div><div class="clear_form_"></div><div class="section_a">
    <div class="text_field_outer_center"> Address*
      <label for="addressStreet1"></label>
      <input name="addressStreet1" type="text" class="textbox_payment_large" id="addressStreet1" />
    </div>
    </div><div class="clear_form_"></div><div class="section_a">
    <div class="text_field_outer_center">
      <input name="textfield" type="text" class="textbox_payment_large" id="textfield" />
    </div>
    </div><div class="clear_form_"></div><div class="section_a">
    <div class="text_field_outer_center">Country*
      
      <select name="addressCountry" id="addressCountry" class="select">
        <option>Select country</option>
        <option>United State America</option>
        <option selected="selected">India</option>
        <option>United Kingdom</option>
    </select>
    </div>
    </div><div class="clear_form_"></div><div class="section_a">
    <div class="text_field_outer_center">City*
      <label for="textfield"></label>
      <input name="addressCity" type="text" class="textbox_payment_large" id="addressCity" />
    </div>
    </div><div class="clear_form_"></div><div class="section_a">
    <div class="text_field_outer">Pin Code*
      <label for="textfield"></label>
      <input name="addressZip" type="text" class="textbox_payment_pin" id="addressZip" />
    </div>
    <div class="text_field_outer_right">State
      <input type="text" name="addressState" id="addressState" class="textbox_payment" />
    </div>
    </div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </div> <div class="billing_container"><div class="clear_form_top"></div>
  <div class="white_patch"></div>
    <div class="payment_mode_head">Payment Mode
    <div class="oragne_bullet">2</div>
    </div><div class="clear_form_"></div>
    <div class="section_e">
    <ul id="example1" class="accordion">
            <li >
              <h3 >Pay by Credit Card</h3>
                  <div class="panel loading" >
                      <div class="section_a">
    
    <div class="text_field_outer_center_second">
    <div class="text_field_outer_center_second">
 <!-- 
        <select name="cardname" id="cardname" class="select_small">
        <option selected="selected" value="NULL">Select Card</option>
        <option value="VISA">Visa Card</option>
        <option value="">American Express</option>
        <option value="Master Card">Master Card</option>
        </select>
 -->

   <?php echo $form->dropDownList($model,'paymentMode',$model->getCreditOptions(),array('class'=>'select_small')); ?> 
      <label for="textfield"></label>
    </div>
    
    </div>
    <div class="clear_form_"></div>
    <div class="section_a">
    <div class="text_field_outer_center_second">
     
      
      
      
      
         
           
          <input autocomplete="off" name="search_text" id="search_text" value="Name on the card" onclick="if(this.value=='Name on the card'){this.value='';}" onblur="if(this.value==''){this.value='Name on the card';}" size="28" class="textbox_payment_medium" type="text">
        
      
      <label for="textfield"></label>
    </div>
    
    </div>
    <div class="clear_form_"></div>
    <div class="section_a">
    <div class="text_field_outer_center_second">
      <input autocomplete="off" name="search_text2" id="search_text2" value="Card number " onclick="if(this.value=='Card number '){this.value='';}" onblur="if(this.value==''){this.value='Card number ';}" size="28" class="textbox_payment_medium" type="text" />
      <label for="textfield"></label>
    </div>
    
    </div>
     <div class="clear_form_"></div>
     <div class="section_a">
    <div class="text_field_outer_center_second"><div class="smallest_drop_text">Expiry</div>
    
      <div class="smallest_drop"><select name="select_smaller" id="select_smaller" class="select_smaller">
        <option selected="selected" value="1">Jan</option>
        <option value="2">Feb</option>
        <option value="3">Mar</option>
        <option value="4">>Apr</option>
        <option value="5">May</option>
        <option value="6">Jun</option>
        <option value="7">Jul</option>
        <option value="8">Aug</option>
        <option value="9">Sept</option>
        <option value="10">Oct</option>
        <option value="11">Nov</option>
        <option value="12" >Dec</option>
      </select>
      </div>
      
       <div class="smallest_drop"><select name="select_smaller" id="select_smaller" class="select_smaller">
        <option selected="selected" value="12">2012</option>
        <option value="13">2013</option>
        <option value="14">2014</option>
        <option value="15">2015</option>
        <option value="16">2016</option>
        <option value="17">2017</option>
        <option value="18">2018</option>
        <option value="19">2019</option>
        <option value="20">2020</option>
      
      </select>
      </div>
    </div>
    
    </div><div class="clear_form_"></div>
    <div class="section_c">
    <div class="cvv_outer">CVV</div>
    <div class="security_code">Security Code</div>
    <div class="watsdis"><a href="#" id="toggle4">What is this?</a></div>
    <div class="four_digits">4 digits</div>
    
    <div class="text_field_outer_center_second">
      <div class="smallest_drop_text">Security</div>
    
      <div class="smallest_drop"><?php echo $form->textField($model,'securityNumber',array('class'=>"textbox_payment_cvv")); ?>
      </div>
	
	<div class="smallest_drop"><?php echo $form->textField($model,'cvvNumber',array('class'=>"textbox_payment_cvv")); ?>
      </div>
       <div class="smallest_drop"><input name="textfield" type="text" class="textbox_payment_cvv" id="textfield" size="4" maxlength="4" />
      </div>
    </div>
    
    </div>
    
<div class="toggle4"><img src="images/cvv-bg.png" width="179" height="83" alt="cvv" /></div>
    </div>
                  </div>
            </li>
                <li>
                    <h3>Pay by ATM/Debit Card</h3>
                    <div class="panel loading">
                        <div class="section_e">
    
    <div class="text_field_outer_center_second">
    <div class="text_field_outer_center_second">

<!--<select name="select_small" id="select_small" class="select_small">
        <option selected="selected" value="NULL">Select Card Type</option>
       
<option value="1">CITI Debit Card</option>
<option value="2">Maestro Cards</option>
<option value="3">Visa Debit Cards</option>
<option value="debitcard_SMAE_1">SBI Maestro Card</option>
    </select>
      <label for="textfield"></label>

-->
<?php echo $form->dropDownList($model,'paymentMode',$model->getDebitOptions(),array('class'=>'select_small')); ?>
    </div>
    
    </div>
    <div class="clear_form_"></div>
    <div class="section_a">
    <div class="text_field_outer_center_second">
     
      
      
      
      
         
           
          <input autocomplete="off" name="search_text" id="search_text" value="Name on the card" onclick="if(this.value=='Name on the card'){this.value='';}" onblur="if(this.value==''){this.value='Name on the card';}" size="28" class="textbox_payment_medium" type="text">
        
      
      <label for="textfield"></label>
    </div>
    
    </div>
    <div class="clear_form_"></div>
    <div class="section_a">
    <div class="text_field_outer_center_second">
      <input autocomplete="off" name="search_text2" id="search_text2" value="Card number " onclick="if(this.value=='Card number '){this.value='';}" onblur="if(this.value==''){this.value='Card number ';}" size="28" class="textbox_payment_medium" type="text" />
      <label for="textfield"></label>
    </div>
    
    </div>
     <div class="clear_form_"></div>
     <div class="section_a">
    <div class="text_field_outer_center_second"><div class="smallest_drop_text">Expiry</div>
    
      <div class="smallest_drop"><select name="select_smaller" id="select_smaller" class="select_smaller">
        <option selected="selected">Jan</option>
        <option>Feb</option>
        <option>Mar</option>
        <option>Apr</option>
        <option>May</option>
        <option>Jun</option>
        <option>Jul</option>
        <option>Aug</option>
        <option>Sept</option>
        <option>Oct</option>
        <option>Nov</option>
        <option>Dec</option>
      </select>
      </div>
      
       <div class="smallest_drop"><select name="select_smaller" id="select_smaller" class="select_smaller">
        <option selected="selected">2012</option>
        <option>2013</option>
        <option>2014</option>
        <option>2015</option>
        <option>2015</option>
        <option>2016</option>
        <option>2017</option>
        <option>2018</option>
        <option>2019</option>
        <option>2020</option>
      
      </select>
      </div>
    </div>
    
    </div><div class="clear_form_"></div>
    <div class="section_c">
    <div class="cvv_outer">CVV</div>
    <div class="security_code">Security Code</div>
   <div class="watsdis"><a href="#" id="toggle5">What is this?</a></div>
    <div class="four_digits">4 digits</div>
    
    <div class="text_field_outer_center_second">
      <div class="smallest_drop_text">Security</div>
    
      <div class="smallest_drop"><input name="textfield" type="text" class="textbox_payment_cvv" id="textfield" />
      </div>
      
       <div class="smallest_drop"><input name="textfield" type="text" class="textbox_payment_cvv" id="textfield" size="4" maxlength="4" />
      </div>
    </div>
    
    </div>
<div class="toggle5"><img srverysignc="images/cvv-bg.png" width="179" height="83" alt="cvv" /></div>

    </div>
                    </div>
                   
                    
                </li>
                <li>
                    <h3>Pay by Net Banking</h3>
                    <div class="panel loading">
                       <div class="section_e">
    
    <div class="text_field_outer_center_second">
    <div class="text_field_outer_center_second">
<!--<select name="select_small" id="select_small" class="select_small">
        <option selected="selected">Select Bank</option>
        
<option value="CRPB">Corporation Bank</option>
<option value="DSHB">Deutsche Bank</option>
<option value="AXIB">AXIS Bank</option>
<option value="YESB">Yes Bank</option>
<option value="UBIB">Union Bank of India</option>
<option value="CITNB">Citibank </option>
<option value="ICIB">ICICI Netbanking</option>
<option value="HDFB">HDFC Bank</option>
<option value="INIB">IndusInd Bank</option>
<option value="162B">Kotak Mahindra Bank</option>
    </select>

-->

<?php echo $form->dropDownList($model,'bankName',$model->getBankOptions(),array('class'=>'select_small')); ?>


    
    </div>
    <div class="clear_form_"></div>
    
    </div>
                    </div>
                </li>
                
          </ul>
    
    
    </div>
    <div class="clear_form_"></div>
  </div>
  <div class="billing_container"><div class="clear_form_top"></div>
  <div class="white_patch"></div>
    <div class="review_order_head">Review your order
    <div class="oragne_bullet">3</div>
    </div>
    <div class="section_a"><div class="tab_head_bg">
    <div class="text_field_outer_left"><strong>Products</strong></div>
    <div class="text_field_outer_left_right"><strong>Subtotal</strong></div>
    </div>
    </div>
    <div class="clear_form_"></div>
    <div class="section_a"><div class="tab_head_bg_without_bg">
    <div class="text_field_outer_left"> Gift card to Healthkart</div>
    <div class="text_field_outer_left_right">Rs. 2000</div>
    </div>
    </div>
    <div class="clear_form_"></div>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <div class="section_a"><div class="tab_head_bg_without_bg">
    <div class="text_field_outer_left">Subtotal</div>
    <div class="text_field_outer_left_right">Rs. 2000</div>
    </div>
  </div>
    <div class="clear_form_"></div>
    <div class="section_a"><div class="tab_head_bg_without_bg">
    <div class="text_field_outer_left">Tax</div>
    <div class="text_field_outer_left_right">Rs. 200    </div>
    </div>
    </div>
    <div class="clear_form_"></div>
    <div class="section_a"><div class="tab_head_bg_without_bg">
    <div class="text_field_outer_left"><strong>Grand Total</strong></div>
    <div class="text_field_outer_left_right"><strong>Rs. 2200</strong></div>
    </div>
    </div>
    <div class="clear_form_"></div><div class="section_a">
<!--
      <input type="image"src="<?php echo Yii::app()->request->baseUrl.'/'; ?>images/place_order_btn.jpg" alt="place_order" width="207" height="53" border="0" align="right" class="pon_btn" /></a>
-->
<?php echo CHtml::submitButton('',array('class'=>'placeorder_btn')); ?>
    </div>
<style type="text/css">
 .placeorder_btn {

 background:url('<?php echo Yii::app()->request->baseUrl."/images/place_order_btn.jpg"; ?>');
    width:207px;
  height:53px;
  position:right;
  border:0px;
  margin: 0 0 0 30px;

  }

</style>

		<div class="row buttons">
		
	</div>


<?php $this->endWidget(); ?>
    <div class="clear_form_"></div>
    
    
  </div>  
  <!-- gift card ends -->
  
  
  
  
  
<!--    <div id="apDiv1">
    
   			<a href="send-gift.html">
            <div class="gift-card-frame">
						<div class="free"><img src="images/gift-free.png" border="0" width="50" height="22" alt="" /></div>
                        <div class="picture"><img src="images/gift-01.png" alt="" width="199" height="138" border="0" /></div>
                        <div class="price"><span class="WebRupee">Rs.</span> 25.00</div>
                        <div class="description"><strong>online gift - E-Cash</strong>Barclay's Bin...Ready, Set, Sip. Wine delivery direct to your door.</div>
                        <div class="brand"><img src="images/brand-01.gif" alt="" width="100" height="22" border="0" /></div>
                        <div class="button">Send it now for free</div>
    
   				 </div>
                 </a>   
     
                 
  
  
    </div> -->
  <!-- ap div ends -->
</form>  
  
  </div>
    <div class="verysign"><img src="<?php echo Yii::app()->request->baseUrl.'/'; ?>images/verysign.jpg" alt="verysign" width="281" height="84" border="0" usemap="#Map" />
      <map name="Map" id="Map">
        <area shape="rect" coords="158,4,277,79" href="#" />
      </map>
    </div>

  </div>
  <!-- content ends --> 
  
  <script>
  function change_mode()
  {
   alert("ok");
  }
  </script>

 
 
 
  <script>
$('#toggle4').click(function() {
      alert("ok1 ");
	$('.toggle4').slideToggle('fast');
	return false;
});

$('#toggle5').click(function() {
        alert("ok2 ");
	$('.toggle5').slideToggle('fast');
	return false;
});

$('#toggle6').click(function() {
        alert("ok3 ");
	$('.toggle6').slideToggle('fast');
	return false;
});

</script>


  <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl.'/'; ?>js/jquery-1.4.2.min.js" charset="utf-8"></script>
        <script type="text/javascript" src="<?php echo Yii::app()->request->baseUrl.'/'; ?>js/jquery.accordion.2.0.js" charset="utf-8"></script>
        
		<script type="text/javascript">
            $('#example1, #example3').accordion();
            $('#example2').accordion({
                canToggle: true,
               
            });
            $('#example4').accordion({
                canToggle: true,
                canOpenMultiple: true, 
            });
            $(".loading").removeClass("loading");
        </script>


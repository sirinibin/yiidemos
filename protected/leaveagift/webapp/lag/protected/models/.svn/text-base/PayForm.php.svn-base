<?

class PayForm extends CFormModel
{
			//public $merchantAccessKey,
			//public $transactionID,
			public $bankName;
			//public $issuerCode,
			public $addressState;
			public $addressCity;
			public $addressStreet1;
			public $addressCountry;
			public $addressZip;
			public $firstName;
			public $lastName;
			public $phoneNumber;
			public $email;
			public $paymentMode;
			public $cardHolderName;
			public $cardNumber;
			public $expiryMonth;
			public $cardType;
			public $cvvNumber;
			public $expiryYear;
			public $returnUrl;
			public $amount;
			public $securityNumber;

	public function rules()
	{
		return array(
			array('paymentMode,bankName', 'safe'),

		       );
	}


	/**
	 * Declares attribute labels.
	 */
	public function attributeLabels()
	{
		return array(
			'firstName'=>'First Name',
			'lastName'=>'Last Name',
			'phoneNumber'=>'Mobile Number',
			'email'=>'Email Address',
			'bankName'=>'Name Of The bank',
			'addressState'=>'State',
			'addressCity'=>'City',
			'addressStreet1'=>'Street',
			'addressCountry'=>'Country',
			'addressZip'=>'Zip Code',
			'paymentMode'=>'Payment Mode',
			'cardHolderName'=>'Name Of Card Holder',
			'cardNumber'=>'Card Number',
			'expiryMonth'=>'Expiry Month',
			'expiryYear'=>'Expiry Year',
			'cvvNumber'=>'CVV Number',
			'returnUrl'=>'Return Url',
			'amount'=>'Amount',
			'securityNumber'=>'Security Number'
		);
	}

	public function getModeOptions()
	{
	$options= array('NET_BANKING'=>'Net Banking','CREDIT_CARD'=>'Credit Card','DEBIT_CARD'=>'Debit card');
	return $options;
	}
	public function getBankOptions()
	{
	$banks= array('Select banking'=>'Select Bank','ICICI Bank'=>'ICICI Bank','AXIS Bank'=>'AXIS Bank','YES Bank'=>'YES Bank','SBI Bank'=>'SBI Bank','DEUTSCHE Bank'=>'DEUTSCHE Bank','UNION Bank'=>'UNION Bank','Indian Bank'=>'Indian Bank','Federal Bank'=>'Federal Bank','HDFC Bank'=>'HDFC Bank','IDBI Bank'=>'IDBI Bank');
	return $banks;
	}
	public function getCreditOptions()
	{
	$credit=array('VisaCard'=>'VisaCard','MasterCard'=>'MasterCard','MaestroCard'=>'MaestroCard');
	return $credit;
	}
	public function getDebitOptions()
	{
	$debit=array('SBI Maestro Card');
	return $debit;
	}

}							
?>

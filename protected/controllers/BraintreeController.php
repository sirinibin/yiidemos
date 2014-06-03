<?php

class BraintreeController extends Controller
{
    public function filters()
	{
		return array(
			'accessControl', // perform access control for CRUD operations
		);
	}
	/**
	 * @return array rules for the "accessControl" filter.
	 */
	 
	public function accessRules()
	{
		return array(
		
		       array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array(
				                
				         
				       
				                ),
				'users'=>array('@'),
			),
			
			array('allow', // allow authenticated user to perform 'create' and 'update' actions
				'actions'=>array(
				            
				                 'sale',
				                 'CreateCustomer',
				                 'Charged',
				                 'CreateSubMerchant',
				                 'Transact',
				                 'Release',
				                 'AddCard',
				                 'CloneTransaction'
				            
				                ),
				'users'=>array('*'),
			),
			array('deny',  // deny all users
				'users'=>array('*'),
			),
		);
	}
 public function actionSale()
 {
   //12363681
   //3fqyjb
   /*
   $data=array(
                'amount' => '0.50',
                'merchantAccountId' => "SkyInnovationLabsInc_INR",
                'creditCard' => array(
			              'number' => '5105105105105100',
			              'expirationMonth' => '05',
			              'expirationYear' => '12'
		                     )
               );
               */
    $data=  array(
			'amount' => '34.00',
			'merchantAccountId' => "SkyInnovationLabsInc_INR",
			'customerId' => '12363681',
			'paymentMethodToken' => '3fqyjb'
		      );

   $r=Yii::app()->braintree->sale($data);
  
  echo "<pre>";
   print_r($r);
   echo "</pre>";
   
 
	    
   
   if(isset($r['validation_errors']))
     {
       foreach($r['validation_errors'] as $e)
       {
         echo "attribute name:".$e->attribute."<br/>";
         echo "error code:".$e->code."<br/>";
         echo "message:".$e->message."<br/>";
         echo "<hr/>";
       }
     }
   
 

}
public function actionCreateCustomer()
 {
  $data=array(
    "id"=>'124',
    "firstName" => "Sirin",
     "lastName" => "k",
     
       /*
	"creditCard" => array(
	    "number" => "4111111111111111",
	    "expirationMonth" => "05",
	    "expirationYear" => "12",
	    "cvv" => "722",
	    "billingAddress" => array(
		"postalCode" => "678761"
	    )
	)
	*/
    );
    
    //gh3d76  ,gh3d76 ,gh3d76 ,gh3d76

    //$r=Yii::app()->braintree->createCustomer($data);
    /*
     $r=Yii::app()->braintree->findCustomer('124');
  
      echo "<pre>";
      print_r($r);
      echo "</pre>";
     exit;
     */
     $data=array(
		
				      'cardholderName' => 'Sirin k',
				      'number' => '4111111111111111',
				      'expirationDate' => '05/2020',
				      'options' => array(
					  
					  'verifyCard' => true
							)
                                   
                );
   
      $r=Yii::app()->braintree->updateCard('gh3d76',$data);
       /*
    $r=Yii::app()->braintree->updateCustomer($r['customer_id'],$data);
    */
  
      echo "<pre>";
      print_r($r);
      echo "</pre>";
      exit;
      if($r['success']==1)
       {
         /*
         $customer=Yii::app()->braintree->getCustomerById($r['customer_id']);
         echo "<pre>";
         print_r($customer);
         echo "</pre>";
         */
         
         $token=Yii::app()->braintree->getPaymentMethodToken($r['customer_id']);
         
         echo "<pre>";
         print_r($token);
         echo "</pre>";
         if(isset($token['payment_method_token']))
         {
         $subscription=Yii::app()->braintree->createSubscription($token['payment_method_token']);
         
          echo "<pre>";
         print_r($subscription);
         echo "</pre>";
         }
         
       }
      if(isset($r['validation_errors']))
	{
	  foreach($r['validation_errors'] as $e)
	  {
	    echo "attribute name:".$e->attribute."<br/>";
	    echo "error code:".$e->code."<br/>";
	    echo "message:".$e->message."<br/>";
	    echo "<hr/>";
	  }
	}
      
    }
    public function actionCharged()
    {
         echo "<pre>";
         print_r($_REQUEST);
         echo "</pre>";
         exit;
    }
    public function actionCreateSubMerchant()
    {
     $data= array(
		    'individual' => array(
		      'firstName' => 'approve_me',
		      //'firstName' => 'Jane',
		      'lastName' => 'Doe',
		      'email' => 'jane@14ladders.com',
		      'phone' => '5553334444',
		      'dateOfBirth' => '1981-11-19',
		      'ssn' => '456-45-4567',
		      'address' => array(
			'streetAddress' => '111 Main St',
			'locality' => 'Chicago',
			'region' => 'IL',
			'postalCode' => '60622'
		        ),
		      ),
		      'business' => array(
					      'legalName' => 'Jane\'s Ladders',
					      'dbaName' => 'Jane\'s Ladders',
					      'taxId' => '98-7654321',
					      'address' => array(
								  'streetAddress' => '111 Main St',
								  'locality' => 'Chicago',
								  'region' => 'IL',
								  'postalCode' => '60622'
					                        )
					  ),
		      
		   
		    'funding' => array(
		      'destination' => "bank",
		      'email' => 'funding@blueladders.com',
		      'mobilePhone' => '5555555555',
		      'accountNumber' => '1123581321',
		      'routingNumber' => '071101307'
		    ),
		    'tosAccepted' => true,
		    'masterMerchantAccountId' => Yii::app()->braintree->getMasterAccountId(),
		    'id' => "blue_ladders_store123"
		  );
    
       /*
         response sample:(Approved)
         Array
	(
	    [success] => 1
	    [sub_merchant_id] => approve_me_doe_instant1
	    [status] => pending
	    [currency_code] => USD
	)
	Non approved:
	Array
	  (
	      [success] => 1
	      [sub_merchant_id] => jane_doe_instant6
	      [status] => pending
	      [currency_code] => USD
	  )

       */
       $s_m=Yii::app()->braintree->createSubMerchant($data);
       
         echo "<pre>";
         print_r($s_m);
         echo "</pre>";
    }
    public function actionTransact()
    {
      $data=array(
		  'amount' => "100",
		  'merchantAccountId' => "approve_me_doe_instant",
		  
		  'creditCard' => array(
		    'number' => "4111111111111111",
		    'expirationDate' => "12/12",
		  ),
		  'options' => array(
		    'submitForSettlement' => true,
		    'holdInEscrow' => true,
		  ),
		  'serviceFeeAmount' => "5.00"
                );
                
       $r=Yii::app()->braintree->transactToSubMerchant($data);  
       echo "<pre>";
       print_r($r);
       echo "</pre>";
       
       if(isset($r['transaction_id']))
        {
         
          
          $t=Yii::app()->braintree->getTransactionById($r['transaction_id']);
               echo "<pre>";
	      print_r($t);
	      echo "</pre>";
	      
	       
	    
	      
	   if(isset($t['transaction_id'])&&$t['escrow_status']=="hold_pending")
	    {
	      $r=Yii::app()->braintree->releaseFromEscrow($t['transaction_id']);
	       echo "<pre>";
	      print_r($r);
	      echo "</pre>";
	    }
	    
	    
      
        }
  
    }
    public function actionRelease()
    {  
    
        $r=Yii::app()->braintree->releaseFromEscrow("h5mr3b");
	       echo "<pre>";
	      print_r($r);
	      echo "</pre>";
	      
    }
    public function actionAddCard()
    {
      /*
       CardNumber=$bt3|android_1_0_0$null$tyQpq73l0OTUacosq74vSD4QT0C23hLyfViaLgW3pvVTPndQ2+uUl0APr76hiuq9;
exp_mm=$bt3|android_1_0_0$null$AcRuHfi1vIEKict5GOfZIKyjkS8F5aEp3C58gEbH5T8=;
exp_yy=$bt3|android_1_0_0$null$RVSHpZUfLGBS5BrQzEK6SOXswl/ucWYo4HV8zY/2dPw=;
cvv=$bt3|android_1_0_0$null$mT0bearNqqwoyRmoToMeZE+r9HmCleY2/hD95V6IKxE=; 
      */
      /*
      $data=array(
    'customerId' => '80683071',
    'number' => '5105105105105100',
    'expirationDate' => '05/12',
    'cardholderName' => 'The Cardholder'
     );
     */
     $data=array(
    'customerId' => '80683071',
    'number' => '$bt3|android_1_0_0$null$tyQpq73l0OTUacosq74vSD4QT0C23hLyfViaLgW3pvVTPndQ2+uUl0APr76hiuq9;',
    'expirationDate' => '$bt3|android_1_0_0$null$AcRuHfi1vIEKict5GOfZIKyjkS8F5aEp3C58gEbH5T8=;/$bt3|android_1_0_0$null$RVSHpZUfLGBS5BrQzEK6SOXswl/ucWYo4HV8zY/2dPw=;',
    'cardholderName' => 'Sirin k',
    'cvv'=>'$bt3|android_1_0_0$null$mT0bearNqqwoyRmoToMeZE+r9HmCleY2/hD95V6IKxE=;',
     'options' => array(
        'verifyCard' => true,
        //'verificationMerchantAccountId' => 'the_merchant_account_id'
            )
     );
     $r=Yii::app()->braintree->createCard($data);
     
      echo "<pre>";
      print_r($r);
      echo "</pre>";
    }
    public function actionCloneTransaction()
    {
      $r=Yii::app()->braintree->cloneTransaction("gk46k2","40.00");
     
      echo "<pre>";
      print_r($r);
      echo "</pre>";
    }
 }
 /*
 
 https://www.braintreepayments.com/docs/ruby/reference/sandbox#credit_card_numbers
 
 
 Sample Visa cards:
  
    4111 1111 1111 1111
    4005 5192 0000 0004
    4009 3488 8888 1881
    4012 0000 3333 0026
    4012 0000 7777 7777
    4012 8888 8888 1881
    4217 6511 1111 1119
    4500 6000 0000 0061
    
    4009348888881881
    4111111111111111
    
    4500 6000 0000 0061

  Sample master card:
  
    5555 5555 5555 4444

   Sample american express
   
   
    3782 822463 10005
    3714 496353 98431

   Sample Discover:
    
    6011 1111 1111 1117

   Sample JCB:
   
    3530 1113 3330 0000

 
 for Unsuccessfull verification:
 
    4000 1111 1111 1115 (Visa)
    5105 1051 0510 5100 (MasterCard)
    3787 344936 71000 (American Express)
    6011 0009 9013 9424 (Discover)
   
 Use the following credit card number to simulate a verification failure, status = failed (3000).

    3566 0020 2036 0505 (JCB)
    
    CVV Responses¶

The CVV response will be based on the CVV value.
CVV Value	CVV Response Code
200	N (does not match)
201	U (not verified)
301	S (issuer does not participate)
blank	I (not provided)
anything else	M (matches)


AVS Responses¶

AVS responses are based on the value provided for street address and postal code.
AVS Error Response Codes¶
Billing Postal Code	AVS Error Response Code
30000	E (AVS system error)
30001	S (issuing bank does not support AVS)
anything else	blank


AVS Postal Code Response Codes¶
Billing Postal Code	AVS Postal Code Response Code
20000	N (does not match)
20001	U (not verified)
blank	I (not provided)
anything else	M (matches)
AVS Street Address Response Codes¶
Billing Street Address	AVS Street Address Response Code
starts with 200	N (does not match)
starts with 201	U (not verified)
blank	I (not provided)
anything else	M (matches)


Fraud Information¶

The following card number can be used to trigger a fraud response in Sandbox.

    4000 1111 1111 1511 (transaction status: gateway_rejected and gateway rejection reason: fraud)

Card Type Information¶

The following card numbers can be used to simulate various types of cards.

    4500 6000 0000 0061 (prepaid)
    4009 0400 0000 0009 (commercial)
    4005 5192 0000 0004 (Durbin regulated)
    4012 0000 3333 0026 (healthcare)
    4012 0000 3333 0125 (debit)
    4012 0000 3333 0224 (payroll)
    4012 0000 3333 0323 (unknown)
    4012 0000 3333 0422 (all above values will be negative)

Valid Routing Numbers¶

Routing numbers must pass a checksum, much like credit card numbers. The following routing numbers are valid, and can be used in sandbox:

    071101307
    071000013



   
 */
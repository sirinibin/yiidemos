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
   $data=array(
                'amount' => '0.50',
                'creditCard' => array(
			              'number' => '5105105105105100',
			              'expirationMonth' => '05',
			              'expirationYear' => '12'
		                     )
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
    "firstName" => "Sirin",
     "lastName" => "k",
	"creditCard" => array(
	    "number" => "5105105105105100",
	    "expirationMonth" => "05",
	    "expirationYear" => "12",
	    "cvv" => "722",
	    "billingAddress" => array(
		"postalCode" => "678761"
	    )
	)
    );

    $r=Yii::app()->braintree->createCustomer($data);
  
      echo "<pre>";
      print_r($r);
      echo "</pre>";
      
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
		      /*
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
					  ),*/
		      
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
		    //'id' => "blue_ladders_store"
		  );
    
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
      $data=array(
    'customerId' => '80683071',
    'number' => '5105105105105100',
    'expirationDate' => '05/12',
    'cardholderName' => 'The Cardholder'
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
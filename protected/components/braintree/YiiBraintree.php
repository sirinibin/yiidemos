<?php
/**
 * YiiBraintree.php
 *
 * @author: sirin k <sirinibin2006@gmail.com>
 * Date: 21/mar/2014
 * Time: 3.42am(IST)
 */


class YiiBraintree extends CApplicationComponent
{
    public $ENV;// "sandbox" or "live"
    
    
    public $MERCHANT_ID;
    
    public $MERCHANT_ACCOUNT_ID;
    
    public $PUBLIC_KEY;
    
    public $PRIVATE_KEY;
    
    public $CSEK;/* Client side encription key */
    
   
    public function init(){
	
     require_once 'braintree-php-2.26.0/lib/Braintree.php';
      
      Braintree_Configuration::environment($this->ENV);
      Braintree_Configuration::merchantId($this->MERCHANT_ID);
      Braintree_Configuration::publicKey($this->PUBLIC_KEY);
      Braintree_Configuration::privateKey($this->PRIVATE_KEY);
       
    }
    public function __construct()
    {
    
    }
    
  
    
    public function sale($data)
    {
      $result = Braintree_Transaction::sale($data);
      
      echo "<pre>";
      print_r($result);
      echo "</pre>";
      
      
      if ($result->success) {
           
           return(array('success'=>1,
                        'transaction_id'=>$result->transaction->id
                 ));
         
	  
      } else if ($result->transaction) {
                //Error processing transaction
          return(array(
                      'success'=>0,
                      'message'=>$result->message,
                      'code'=>$result->transaction->processorResponseCode,
                      'text'=>$result->transaction->processorResponseText
                ));
        
	  
      } else {
                //Validation Errors
               
               
            return(array(
                      'success'=>0,
                      'message'=>$result->message,
                      'validation_errors'=>$result->errors->deepAll(),
                     
                ));
	 
      }
  
       
    }
    /*
    public function saleWithPaymentToken()
    {
        $result = Braintree_Transaction::sale(array(
			'amount' => $obj->amount,
			'merchantAccountId' => $merchant_account,
			'customerId' => $obj->customer_profile_id,
			'paymentMethodToken' => $obj->payment_profile_id
		      ));
		      
    }
    */
    public function createCustomer($data)
    {
       $result = Braintree_Customer::create($data);
       
       
      echo "<pre>";
      print_r($result);
      echo "</pre>";
      

	if ($result->success) {
	
	     return(array('success'=>1,
                        'customer_id'=>$result->customer->id
                 ));
     
	} else {
	
	     $errors=$result->errors->deepAll();
	     
	      if(count($errors)>0&&($errors[0]->code==91609||$errors[0]->message=='Customer ID has already been taken.'))
	       {
	         return(array(
                      'success'=>1,
                      'customer_id'=>$data['id'],
                     
                )); 
	       }
	      
	     return(array(
                      'success'=>0,
                      'validation_errors'=>$errors,
                     
                ));
	   
	}
    }
    public function findCustomer($id)
    {
       $result = Braintree_Customer::find($id);
       
       
      echo "<pre>";
      print_r($result);
      echo "</pre>";
      exit;

	if ($result->success) {
	
	     return(array('success'=>1,
                        'customer_id'=>$result->customer->id
                 ));
     
	} else {
	      
	     return(array(
                      'success'=>0,
                      'validation_errors'=>$errors,
                     
                ));
	   
	}
    }
    public function updateCard($token,$data)
    {
       $result = Braintree_CreditCard::update($token,$data);
        
        echo "<pre>";
        print_r($result);
        echo "</pre>";
       
        
      
	if ($result->success) {
	
	     return(array('success'=>1,
                        'payment_method_token'=>$result->creditCard->token,
                        'last4'=>$result->creditCard->last4
                 ));
     
	} else {
	     return(array(
                      'success'=>0,
                      'validation_errors'=>$result->errors->deepAll(),
                     
                ));
	   
	}
    }
    
    public function updateCustomer($id,$data)
    {
       $result = Braintree_Customer::update($id,$data);
       
       
        echo "<pre>";
      print_r($result);
      echo "</pre>";
     

	if ($result->success) {
	
	     return(array('success'=>1,
                          'customer_id'=>$result->customer->id
                 ));
     
	} else {
	
	    
	     return(array(
                      'success'=>0,
                      'validation_errors'=>$errors,
                     
                ));
	   
	}
    }
    public function getCustomerById($customer_id)
    {

      
       try{
          $customer = Braintree_Customer::find($customer_id);
          return($customer);
         }
         catch(Exception $e)
         {
            return(array(
                      'success'=>0,
                      'message'=>'Customer with '.$customer_id." is not found"
                    ));
         }
         
      
      /*
         eg:Array
	      (
		  [success] => 1
		  [customer_id] => 68012283
	      )
       */
      return($customer);
    }
    public function getPaymentMethodToken($customer_id)
    {
      try{
          $customer = Braintree_Customer::find($customer_id);
          
         }
         catch(Exception $e)
         {
            return(array(
                      'success'=>0,
                      'message'=>'Customer with '.$customer_id." is not found"
                    ));
         }
       
     
      
      if(isset($customer->creditCards[0]->token))
       {
          return(array(
        
                      'success'=>1,
                      'payment_method_token'=>$customer->creditCards[0]->token
                   ));
                   /*
                     Array
			  (
			      [success] => 1
			      [payment_method_token] => 7nv6bm
			  )
                   */
    
       }
       else
       {
        return(array(
                      'success'=>0,
                      'message'=>'no creditCards found for the customer:'.$customer_id
                    ));
       }
    }
    
    public function createSubscription($payment_method_token)
    {
      $result = Braintree_Subscription::create(array(
        'paymentMethodToken' => $payment_method_token,
        'planId' => 'fxtb'
      ));
    
    
      if ($result->success) {
      
         return(array(
                      'success'=>1,
                      'subscription_id'=>$result->subscription->id,
                      'subscription_status'=>$result->subscription->status
                 ));
                 /*
                  eg:Array
			  (
			      [success] => 1
			      [subscription_id] => 59btqg
			      [subscription_status] => Active
			  )
                 
                 */
    
       } else {
          return(array(
                      'success'=>0,
                      'validation_errors'=>$result->errors->deepAll(),
                     
                ));
       
        }
    
    }
    
    
    
    public function createSubMerchant($data)
    {
      $result = Braintree_MerchantAccount::create($data);
      
      if ($result->success) {
      
         return(array(
                      'success'=>1,
                      'sub_merchant_id'=>$result->merchantAccount->id,
                      'status'=>$result->merchantAccount->status,
                      'currency_code'=>$result->merchantAccount->currencyIsoCode
                 ));
                 /*
                   eg:Array
			    (
				[success] => 1
				[sub_merchant_id] => jane_doe_instant5
				[status] => pending
				[currency_code] => USD
			    )
			    /*  firstname=>approve_me
			    Array
			      (
				  [success] => 1
				  [sub_merchant_id] => approve_me_doe_instant
				  [status] => pending
				  [currency_code] => USD
			      )
                 */
    
       } else {
         return(array(
                      'success'=>0,
                      'errors'=>$result->errors->deepAll(),
                     
                ));
                /* eg:
                  Array
		      (
			  [success] => 0
			  [errors] => Array
			      (
				  [0] => Braintree_Error_Validation Object
				      (
					  [_attribute:Braintree_Error_Validation:private] => mobilePhone
					  [_code:Braintree_Error_Validation:private] => 82683
					  [_message:Braintree_Error_Validation:private] => Funding mobile phone is invalid.
				      )

			      )

		      )

                */
       
        }
    
    }
    public function transactToSubMerchant($data)
    {
      $result = Braintree_Transaction::sale($data);
      
      /*
      echo "<pre>";
      print_r($result);
      echo "</pre>";
      */
      if ($result->success) {
      
         return(array(
                      'success'=>1,
                      'transaction_id'=>$result->transaction->id,
                      'amount'=>$result->transaction->amount,
                      'status'=>$result->transaction->status,
                      'type'=>$result->transaction->type,
                      'service_fee'=>$result->transaction->serviceFeeAmount,
                      'currency_code'=>$result->transaction->currencyIsoCode,
                      'escrow_status'=>$result->transaction->escrowStatus,
                   
                 ));
                 /*
                  eg:Array
			(
			    [success] => 1
			    [transaction_id] => 4x7wdg
			    [amount] => 100.00
			    [status] => submitted_for_settlement
			    [currency_code] => USD
			)
                 
                 */
    
       } else {
          return(array(
                      'success'=>0,
                      'transaction_errors'=>$result->errors->deepAll(),
                     
                ));
       
        }
 
    }
    public function releaseFromEscrow($transaction_id)
    {
    
         $result = Braintree_Transaction::releaseFromEscrow($transaction_id);
        
         if ($result->success)
         {
          return($result);
         }
         else
         {
          return(array(
                      'success'=>0,
                      'errors'=>$result->errors->deepAll(),
                     
                ));
         }
    }
    public function getTransactionById($transaction_id)
    {

      
       try{
          $transaction = Braintree_Transaction::find($transaction_id);
           /*
           echo "<pre>";
	      print_r( $transaction);
	      echo "</pre>";
	      */
          return(array(
                        'transaction_id'=>$transaction->id,
                        'amount'=>$transaction->amount,
                        'currency_code'=>$transaction->currencyIsoCode,
                        'type'=>$transaction->type,
                        'escrow_status'=>$transaction->escrowStatus,
                        'service_fee'=>$transaction->serviceFeeAmount
                      ));
         }
         catch(Exception $e)
         {
            return(array(
                      'success'=>0,
                      'message'=>'Customer with '.$transaction_id." is not found"
                    ));
         }
         
      
      /*
         eg:Array
	      (
		  [success] => 1
		  [customer_id] => 68012283
	      )
       */
   
    }
    public function createCard($data)
    {
       $result = Braintree_CreditCard::create($data);

	if ($result->success) {
	
	     return(array('success'=>1,
                        'payment_method_token'=>$result->creditCard->token
                 ));
     
	} else {
	     return(array(
                      'success'=>0,
                      'validation_errors'=>$result->errors->deepAll(),
                     
                ));
	   
	}
    }
    public function cloneTransaction($transaction_id,$amount)
    {
      $result = Braintree_Transaction::cloneTransaction($transaction_id, array(
	  'amount' => $amount,
	  
	  'options' => array(
	    'submitForSettlement' => true,
	    
	  )
	));
	
	
	
      if ($result->success) {
	      
	  
	     return(array('success'=>1,
                           'transaction_id'=>$result->transaction->id,
                           'amount'=>$result->transaction->amount,
                           'currency_code'=>$result->transaction->currencyIsoCode,
                           'type'=>$result->transaction->type,
                           'escrow_status'=>$result->transaction->escrowStatus,
                           'service_fee'=>$result->transaction->serviceFeeAmount
                 ));
     
	} else {
	    
	
	    
	      if(count($result->errors->deepAll())>0)
	      {
		return(array(
			  'success'=>0,
			  'transaction_clone_errors'=>$result->errors->deepAll(),
			
		    ));
              } 
              else
              {
                return(array(
			  'success'=>0,
			  'transaction_clone_errors'=>$result->message,
			
		    ));
              }
	   
	}
    
    }
    public function getMasterAccountId()
    {
     return($this->MERCHANT_ACCOUNT_ID);
    }
    
    public function verifyWebHookNotification()
    {
      if(isset($_GET["bt_challenge"])) {
      
       echo(Braintree_WebhookNotification::verify($_GET["bt_challenge"]));
      
      }
      else
      {
        return(false);
      }
    }
    public function parseWebHookNotification()
    {
       if(
	    isset($_POST["bt_signature"]) &&
	    isset($_POST["bt_payload"])
	) {
	    $webhookNotification = Braintree_WebhookNotification::parse(
		$_POST["bt_signature"], $_POST["bt_payload"]
	    );

	    $message =
		"[Webhook Received " . $webhookNotification->timestamp->format('Y-m-d H:i:s') . "] "
		. "Kind: " . $webhookNotification->kind . " | "
		. "Subscription: " . $webhookNotification->subscription->id . "\n";

	    file_put_contents("/tmp/webhook.log", $message, FILE_APPEND);
	}
	    
    
    }
    
}    

  /*
                   eg:Array
(
    [success] => 0
    [message] => Amount must be greater than zero.
Credit card type is not accepted by this merchant account.
Credit card number is not an accepted test number.
    [validation_errors] => Array
        (
            [0] => Braintree_Error_Validation Object
                (
                    [_attribute:Braintree_Error_Validation:private] => amount
                    [_code:Braintree_Error_Validation:private] => 81531
                    [_message:Braintree_Error_Validation:private] => Amount must be greater than zero.
                )

            [1] => Braintree_Error_Validation Object
                (
                    [_attribute:Braintree_Error_Validation:private] => number
                    [_code:Braintree_Error_Validation:private] => 81703
                    [_message:Braintree_Error_Validation:private] => Credit card type is not accepted by this merchant account.
                )

            [2] => Braintree_Error_Validation Object
                (
                    [_attribute:Braintree_Error_Validation:private] => number
                    [_code:Braintree_Error_Validation:private] => 81717
                    [_message:Braintree_Error_Validation:private] => Credit card number is not an accepted test number.
                )

        )

)
                 */
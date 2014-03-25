<?php
/**
 * BraintreeApi Class file
 * @author Nate Denlinger <pitchin_nate@yahoo.com>
 * @link http://www.eboodesign.com/braintree-yii-extension/
 * @copyright Copyright &copy; 2013 Eboo Design
 * @license http://www.opensource.org/licenses/bsd-license.php New BSD License
 * @version 1.0.0
 */

class BraintreeApi {
    
    private $environment = 'sandbox'; //'sandbox' or 'production'
    private $merchant_id;
    private $public_key;
    private $private_key;
    
    public $clientside_key;
    
    public $options = array();
    
    /**
     * Pulls Braintree ID's and Keys from parameter array in config file
     * Includes Braintree's API files and sets up Braintree configuration
     */
    public function __construct() {
        $this->environment = Yii::app()->params['braintreeapi']['environment'];
        $this->merchant_id = Yii::app()->params['braintreeapi']['merchant_id'];
        $this->public_key = Yii::app()->params['braintreeapi']['public_key'];
        $this->private_key = Yii::app()->params['braintreeapi']['private_key'];
        $this->clientside_key = Yii::app()->params['braintreeapi']['clientside_key'];
        
        require('lib/Braintree.php');
        Braintree_Configuration::environment($this->environment);
        Braintree_Configuration::merchantId($this->merchant_id);
        Braintree_Configuration::publicKey($this->public_key);
        Braintree_Configuration::privateKey($this->private_key);
    }
    
    /**
     * Braintree sale function
     * @return array array(status=>boolean,result=>array(),message=>string)
     */
    public function singleCharge($submitForSettlement = true, $storeInVaultOnSuccess = true) {
        $this->options['options']['submitForSettlement'] = $submitForSettlement;
        $this->options['options']['storeInVaultOnSuccess'] = $storeInVaultOnSuccess;
        $result = Braintree_Transaction::sale($this->options);

        if ($result->success) {
            return array('status'=>true,'result' => $result);
        } else if ($result->transaction) {
            return array('status'=>false,'result' => $result);
        } else {
            return array('status'=>false,'result' => $result);
        }
    }
    
    public function saveCustomer() {
        $result = Braintree_Customer::create($this->options['customer']);
        
        if ($result->success) {
            return array('status'=>true,'result' => $result);
        } else {
            return array('status'=>false,'result' => $result);
        }
    }
    
    public function saveCreditCard() {
        $send_array = $this->options['creditCard'];
        if(isset($this->options['billing'])) {
            $send_array['billingAddress'] = $this->options['billing'];
        }
        if(isset($this->options['customerId'])) {
            $send_array['customerId'] = $this->options['customerId'];
        }
        $result = Braintree_CreditCard::create($send_array);
        
        if ($result->success) {
            return array('status'=>true,'result' => $result);
        } else {
            return array('status'=>false,'result' => $result);
        }
    }
    
    public function saveAddress() {
        $send_array = $this->options['billing'];
        if(isset($this->options['customerId'])) {
            $send_array['customerId'] = $this->options['customerId'];
        }
        $result = Braintree_Address::create($send_array);
        
        if ($result->success) {
            return array('status'=>true,'result' => $result);
        } else {
            return array('status'=>false,'result' => $result);
        }
    }
    
    /**
     * Set the amount to charge
     * @param decimal $amount No dollar sign needed
     */
    public function setAmount($amount) {
        $this->options['amount'] = round($amount,2);
    }
    
    /**
     * Constructs the Credit Card array for payment
     * @param integer $number Credit Card Number
     * @param integer $cvv (optional)Credit Card Security code
     * @param integer $expirationMonth format: MM (use expirationMonth and expirationYear or expirationDate not both)
     * @param integer $expirationYear format: YYYY (use expirationMonth and expirationYear or expirationDate not both)
     * @param string $expirationDate format: MM/YYYY (use expirationMonth and expirationYear or expirationDate not both)
     * @param string $cardholderName (optional)Name on Credit Card
     */
    public function setCreditCard($number,$cvv=null,$expirationMonth=null,$expirationYear=null,$expirationDate=null,$cardholderName=null) {
        $this->options['creditCard'] = array();
        $this->options['creditCard']['number'] = $number;
        if(isset($cvv)) $this->options['creditCard']['cvv'] = $cvv;
        if(isset($expirationMonth)) $this->options['creditCard']['expirationMonth'] = $expirationMonth;
        if(isset($expirationYear)) $this->options['creditCard']['expirationYear'] = $expirationYear;
        if(isset($expirationDate)) $this->options['creditCard']['expirationDate'] = $expirationDate;
    }
    
    public function getCreditCard($input_values) {
        $default = array(
            'cvv' => null,
            'month' => null,
            'year' => null,
            'date' => null,
            'name' => null,
        );
        $values = array_merge($default,$input_values);
        $this->setCreditCard($values['number'], $values['cvv'], $values['month'], $values['year'], $values['date'], $values['name']);
    }
    
    public function getOptions($values) {
        if(isset($values['amount'])) $this->setAmount($values['amount']);
        if(isset($values['orderId'])) $this->options['orderId'] = $values['orderId'];
        if(isset($values['creditCard'])) $this->getCreditCard($values['creditCard']);
        if(isset($values['customer'])) $this->options['customer'] = $values['customer'];
        if(isset($values['billing'])) $this->options['billing'] = $values['billing'];
        if(isset($values['shipping'])) $this->options['shipping'] = $values['shipping'];
        
        //For storing payment method in vault
        if(isset($values['customerId'])) $this->options['customerId'] = $values['customerId'];
    }
}

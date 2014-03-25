<?php
/**
 * BraintreeCCForm class.
 * BraintreeCCForm is the data structure for keeping data for CC payment form
 */
class BraintreeCCForm extends CFormModel {
    
    public $amount;
    public $orderId;
    
    public $creditCard_number;
    public $creditCard_cvv;
    public $creditCard_month;
    public $creditCard_year;
    public $creditCard_date;
    public $creditCard_name;
    
    public $customer_firstName;
    public $customer_lastName;
    public $customer_company;
    public $customer_phone;
    public $customer_fax;
    public $customer_website;
    public $customer_email;
    
    public $billing_firstName;
    public $billing_lastName;
    public $billing_company;
    public $billing_streetAddress;
    public $billing_extendedAddress;
    public $billing_locality;
    public $billing_region;
    public $billing_postalCode;
    public $billing_countryCodeAlpha2;
    
    public $shipping_firstName;
    public $shipping_lastName;
    public $shipping_company;
    public $shipping_streetAddress;
    public $shipping_extendedAddress;
    public $shipping_locality;
    public $shipping_region;
    public $shipping_postalCode;
    public $shipping_countryCodeAlpha2;
    
    /**
     * @var BraintreeApi 
     */
    public $BraintreeApi;
    
    public $customerId;
    
    public function __construct($scenario = '') {
        Yii::import('ext.BraintreeApi.BraintreeApi');
        $this->BraintreeApi = new BraintreeApi();
        parent::__construct($scenario);
    }
    
    public function rules() {
        return array(
            array('customerId','required','on'=>'creditcard'),
            array('customerId','required','on'=>'address'),
            array('customer_firstName, customer_lastName','required','on'=>'customer'),
            array('amount', 'required','on'=>'charge'),
            array('amount','numerical'),
            array('customer_email','email'),
            array('creditCard_number, creditCard_cvv, creditCard_month, creditCard_year, creditCard_date,
                    customer_firstName,
                    customer_lastName,
                    customer_company,
                    customer_phone,
                    customer_fax,
                    customer_website,
                    customer_email,
                    billing_firstName,
                    billing_lastName,
                    billing_company,
                    billing_streetAddress,
                    billing_extendedAddress,
                    billing_locality,
                    billing_region,
                    billing_postalCode,
                    billing_countryCodeAlpha2,
                    shipping_firstName,
                    shipping_lastName,
                    shipping_company,
                    shipping_streetAddress,
                    shipping_extendedAddress,
                    shipping_locality,
                    shipping_region,
                    shipping_postalCode,
                    shipping_countryCodeAlpha2','safe'),
        );
    }
    
    public function attributeLabels() {
        return array(
            'amount' => 'Amount($)',
            'orderId' => 'Order ID',
            'creditCard_number' => 'Credit Card Number',
            'creditCard_cvv' => 'Security Code',
            'creditCard_month' => 'Expiration Month (MM)',
            'creditCard_year' => 'Expiration Year (YYYY)',
            'creditCard_date' => 'Expiration Date (MM/YYYY)',
            'creditCard_name' => 'Name on Card',
            'customer_firstName' => 'First Name',
            'customer_lastName' => 'Last Name',
            'customer_company' => 'Company Name',
            'customer_phone' => 'Phone Number',
            'customer_fax' => 'Fax Number',
            'customer_website' => 'Website',
            'customer_email' => 'Email',
            'billing_firstName' => 'First Name',
            'billing_lastName' => 'Last Name',
            'billing_company' => 'Company Name',
            'billing_streetAddress' => 'Address',
            'billing_extendedAddress' => 'Address',
            'billing_locality' => 'City/Locality',
            'billing_region' => 'State/Region',
            'billing_postalCode' => 'Zip/Postal Code',
            'billing_countryCodeAlpha2' => 'Country',
            'shipping_firstName' => 'First Name',
            'shipping_lastName' => 'Last Name',
            'shipping_company' => 'Company Name',
            'shipping_streetAddress' => 'Address',
            'shipping_extendedAddress' => 'Address',
            'shipping_locality' => 'City/Locality',
            'shipping_region' => 'State/Region',
            'shipping_postalCode' => 'Zip/Postal Code',
            'shipping_countryCodeAlpha2' => 'Country',
        );
    }
    
    public function send() {
        $values = array();
        foreach($this->attributes as $key => $val) {
            if(!is_object($val) && !is_null($val) && strlen($val) > 0) {
                if(strpos($key, '_') === false) {
                    $values[$key] = $val;
                } else {
                    $pieces = explode('_', $key);
                    $values[$pieces[0]][$pieces[1]] = $val;
                }
            }
        }
        $this->BraintreeApi->getOptions($values);
        $scenario = $this->getScenario();
        return $this->$scenario();
        
    }
    
    public function charge() {
        $return = $this->BraintreeApi->singleCharge();
        if($return['status'] === false) {
            $this->addError('creditCard_number', $return['result']->_attributes['message']);
            return false;
        } else {
            return $return;
        }
    }
    
    public function customer() {
        $return = $this->BraintreeApi->saveCustomer();
        if($return['status'] === false) {
            foreach (($return['result']->errors->deepAll()) as $error) {
                $this->addError('customer_firstName', $error->message);
            }
            return false;
        } else {
            return $return;
        }
    }
    
    public function creditcard() {
        $return = $this->BraintreeApi->saveCreditCard();
        if($return['status'] === false) {
            $this->addError('creditCard_number', 'Error saving card');
            return false;
        } else {
            return $return;
        }
    }
    
    public function address() {
        $return = $this->BraintreeApi->saveAddress();
        if($return['status'] === false) {
            $this->addError('billing_firstName', 'Error saving card');
            return false;
        } else {
            return $return;
        }
    }
}

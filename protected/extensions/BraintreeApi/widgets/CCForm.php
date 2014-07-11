<?php

class CCForm extends CWidget {
    
    public $form_id;
    
    /**
     * @var BraintreeCCForm 
     */
    public $model;
    
    /**
     * @var CActiveForm
     */
    public $form;
    
    public $values;
    public $type;
    
    /**
     *
     * @var array $fields   array(
     *                          'amount'
     *                          'orderId',
     *                          'creditCard' => array('number','cvv','month','year','date','name'),
     *                          'customer' => array('firstName','lastName','company','phone','fax','website','email'),
     *                          'billing' => array('firstName','lastName','company','streetAddress','extendedAddress','locality','region','postalCode',countryCodeAlpha2'),
     *                          'shipping' => array('firstName','lastName','company','streetAddress','extendedAddress','locality','region','postalCode','countryCodeAlpha2'),
     *                      )
     */
    public $fields = null;
    private $fields_options = array(
        'creditCard' => array('number','cvv','month','year'),
    );
    
    public function init() {
        if(isset($this->fields)) $this->fields_options = $this->fields;
        if(!isset($this->values)) {
            $this->values = $this->model->attributes;
        }
        if(!isset($this->form_id)) {
            $this->form_id = $this->form->htmlOptions['id'];
        }
        
        $this->registerScripts();
        
        if(isset($this->type)) {
            if($this->type == 'customer') {
                $this->fields_options = array('customer' => array('firstName','lastName','company','phone','fax','website','email'));
            } elseif($this->type == 'creditcard') {
                $this->fields_options = array(
                    'creditCard' => array('number','month','year','name'),
                    'billing' => array('firstName','lastName','company','streetAddress','extendedAddress','locality','region','postalCode','countryCodeAlpha2'),
                );
            } elseif($this->type == 'charge_min') {
                $this->fields_options = array('creditCard' => array('number','cvv','month','year'));
            } elseif($this->type == 'address') {
                $this->fields_options = array('billing' => array('firstName','lastName','company','streetAddress','extendedAddress','locality','region','postalCode','countryCodeAlpha2'),);
            }
        }
    }
    
    public function run() {
        echo $this->form->errorSummary($this->model);
        $this->renderContent();
    }
    
    public function renderContent() {
        if(in_array('amount',$this->fields_options)) $this->renderAmount();
        if(in_array('orderId',$this->fields_options)) $this->renderOrderId();
        if(isset($this->fields_options['creditCard'])) $this->renderCC();
        if(isset($this->fields_options['customer'])) $this->renderCustomer();
        if(isset($this->fields_options['billing'])) $this->renderBilling();
        if(isset($this->fields_options['shipping'])) $this->renderShipping();
    }
    
    private function registerScripts() {
        Yii::app()->clientScript->registerScriptFile("https://js.braintreegateway.com/v1/braintree.js");
        Yii::app()->clientScript->registerScript('braintreeapi_ccform', "
            var braintree = Braintree.create('{$this->model->BraintreeApi->clientside_key}');
            braintree.onSubmitEncryptForm('{$this->form_id}');
        ");
    }
    
    public function renderAmount() {
        echo "<div class='well'><h3>Charge Amount</h3>";
            $value = isset($this->values['amount']) ? $this->values['amount'] : '';
            echo    "<div class='row control-group'>
                        <label class='control-label'>Amount($)</label>
                        <div class='controls'>
                        <input type='text' size='10' maxlength='10' autocomplete='off' name='BraintreeCCForm[amount]' value='{$value}' />
                        </div>
                    </div>";
        echo "</div>";
    }
    
    public function renderOrderId() {
        echo "<div class='well'><h3>Order Info</h3>";
            $value = isset($this->values['orderId']) ? $this->values['orderId'] : '';
            echo    "<div class='row control-group'>
                        <label class='control-label'>Order ID</label>
                        <div class='controls'>
                        <input type='text' size='20' maxlength='50' autocomplete='off' name='BraintreeCCForm[orderId]' value='{$value}' />
                        </div>
                    </div>";
        echo "</div>";
    }
    
    public function renderCC() {
         echo "<div class='well'><h3>Credit Card Info</h3>";
            if(in_array('name',$this->fields_options['creditCard'])) {
                $value = isset($this->values['creditCard_name']) ? $this->values['creditCard_name'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Name on Card</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[creditCard_name]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('number',$this->fields_options['creditCard'])) {
                //$value = isset($this->values['creditCard_number']) ? $this->values['creditCard_number'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Card Number</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='16' autocomplete='off' data-encrypted-name='BraintreeCCForm[creditCard_number]' />
                            </div>
                        </div>";
            }
            if(in_array('cvv',$this->fields_options['creditCard'])) {
                echo    "<div class='row control-group'>
                            <label class='control-label'>Security Code (CVV)</label>
                            <div class='controls'>
                            <input type='text' size='4' maxlength='4' autocomplete='off' data-encrypted-name='BraintreeCCForm[creditCard_cvv]' />
                            </div>
                        </div>";
            }
            if(in_array('date',$this->fields_options['creditCard'])) {
                //$value = isset($this->values['creditCard_date']) ? $this->values['creditCard_date'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Expiration Date (MM/YYYY)</label>
                            <div class='controls'>
                            <input type='text' size='7' maxlength='7' autocomplete='off' data-encrypted-name='BraintreeCCForm[creditCard_date]' />
                            </div>
                        </div>";
            }
            if(in_array('month',$this->fields_options['creditCard']) || in_array('year',$this->fields_options['creditCard'])) {
                //$value = isset($this->values['creditCard_month']) ? $this->values['creditCard_month'] : '';
                //$value2 = isset($this->values['creditCard_year']) ? $this->values['creditCard_year'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Expiration Date (MM/YYYY)</label>
                            <div class='controls'>
                            <input type='text' size='2' maxlength='2' autocomplete='off' data-encrypted-name='BraintreeCCForm[creditCard_month]' />
                            /
                            <input type='text' size='4' maxlength='4' autocomplete='off' data-encrypted-name='BraintreeCCForm[creditCard_year]' />
                            </div>
                        </div>";
            }
        echo "</div>";
    }
    
    public function renderCustomer() {
        echo "<div class='well'><h3>Customer Info</h3>";
            if(in_array('firstName',$this->fields_options['customer'])) {
                $value = isset($this->values['customer_firstName']) ? $this->values['customer_firstName'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>First Name</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[customer_firstName]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('lastName',$this->fields_options['customer'])) {
                $value = isset($this->values['customer_lastName']) ? $this->values['customer_lastName'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Last Name</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[customer_lastName]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('company',$this->fields_options['customer'])) {
                $value = isset($this->values['customer_company']) ? $this->values['customer_company'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Company Name</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[customer_company]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('phone',$this->fields_options['customer'])) {
                $value = isset($this->values['customer_phone']) ? $this->values['customer_phone'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Phone Number</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='20' name='BraintreeCCForm[customer_phone]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('fax',$this->fields_options['customer'])) {
                $value = isset($this->values['customer_fax']) ? $this->values['customer_fax'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Fax Number</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='20' name='BraintreeCCForm[customer_fax]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('website',$this->fields_options['customer'])) {
                $value = isset($this->values['customer_website']) ? $this->values['customer_website'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Website</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='100' name='BraintreeCCForm[customer_website]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('email',$this->fields_options['customer'])) {
                $value = isset($this->values['customer_email']) ? $this->values['customer_email'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Email Address</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='100' name='BraintreeCCForm[customer_email]' value='{$value}' />
                            </div>
                        </div>";
            }
        echo "</div>";
    }
    
    public function renderBilling() {
        echo "<div class='well'><h3>Billing Info</h3>";
            if(in_array('firstName',$this->fields_options['billing'])) {
                $value = isset($this->values['billing_firstName']) ? $this->values['billing_firstName'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>First Name</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[billing_firstName]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('lastName',$this->fields_options['billing'])) {
                $value = isset($this->values['billing_lastName']) ? $this->values['billing_lastName'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Last Name</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[billing_lastName]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('company',$this->fields_options['billing'])) {
                $value = isset($this->values['billing_company']) ? $this->values['billing_company'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Company Name</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[billing_company]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('streetAddress',$this->fields_options['billing'])) {
                $value = isset($this->values['billing_streetAddress']) ? $this->values['billing_streetAddress'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Address</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='100' name='BraintreeCCForm[billing_streetAddress]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('extendedAddress',$this->fields_options['billing'])) {
                $value = isset($this->values['billing_extendedAddress']) ? $this->values['billing_extendedAddress'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Address(continued)</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='100' name='BraintreeCCForm[billing_extendedAddress]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('locality',$this->fields_options['billing'])) {
                $value = isset($this->values['billing_locality']) ? $this->values['billing_locality'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>City/Locality</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[billing_locality]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('region',$this->fields_options['billing'])) {
                $value = isset($this->values['billing_region']) ? $this->values['billing_region'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>State/Region</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='20' name='BraintreeCCForm[billing_region]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('postalCode',$this->fields_options['billing'])) {
                $value = isset($this->values['billing_postalCode']) ? $this->values['billing_postalCode'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Zip/Postal Code</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='20' name='BraintreeCCForm[billing_postalCode]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('countryCodeAlpha2',$this->fields_options['billing'])) {
                $value = isset($this->values['billing_countryCodeAlpha2']) ? $this->values['billing_countryCodeAlpha2'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Country Code</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='100' name='BraintreeCCForm[billing_countryCodeAlpha2]' value='{$value}' />
                            </div>
                        </div>";
            }
        echo "</div>";
    }
    
    public function renderShipping() {
        echo "<div class='well'><h3>Shipping Info</h3>";
            if(in_array('firstName',$this->fields_options['shipping'])) {
                $value = isset($this->values['shipping_firstName']) ? $this->values['shipping_firstName'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>First Name</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[shipping_firstName]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('lastName',$this->fields_options['shipping'])) {
                $value = isset($this->values['shipping_lastName']) ? $this->values['shipping_lastName'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Last Name</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[shipping_lastName]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('company',$this->fields_options['shipping'])) {
                $value = isset($this->values['shipping_company']) ? $this->values['shipping_company'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Company Name</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[shipping_company]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('streetAddress',$this->fields_options['shipping'])) {
                $value = isset($this->values['shipping_streetAddress']) ? $this->values['shipping_streetAddress'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Address</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='100' name='BraintreeCCForm[shipping_streetAddress]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('extendedAddress',$this->fields_options['shipping'])) {
                $value = isset($this->values['shipping_extendedAddress']) ? $this->values['shipping_extendedAddress'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Address(continued)</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='100' name='BraintreeCCForm[shipping_extendedAddress]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('locality',$this->fields_options['shipping'])) {
                $value = isset($this->values['shipping_locality']) ? $this->values['shipping_locality'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>City/Locality</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='50' name='BraintreeCCForm[shipping_locality]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('region',$this->fields_options['shipping'])) {
                $value = isset($this->values['shipping_region']) ? $this->values['shipping_region'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>State/Region</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='20' name='BraintreeCCForm[shipping_region]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('postalCode',$this->fields_options['shipping'])) {
                $value = isset($this->values['shipping_postalCode']) ? $this->values['shipping_postalCode'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Zip/Postal Code</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='20' name='BraintreeCCForm[shipping_postalCode]' value='{$value}' />
                            </div>
                        </div>";
            }
            if(in_array('countryCodeAlpha2',$this->fields_options['shipping'])) {
                $value = isset($this->values['shipping_countryCodeAlpha2']) ? $this->values['shipping_countryCodeAlpha2'] : '';
                echo    "<div class='row control-group'>
                            <label class='control-label'>Country Code</label>
                            <div class='controls'>
                            <input type='text' size='20' maxlength='100' name='BraintreeCCForm[shipping_countryCodeAlpha2]' value='{$value}' />
                            </div>
                        </div>";
            }
        echo "</div>";
    }
}
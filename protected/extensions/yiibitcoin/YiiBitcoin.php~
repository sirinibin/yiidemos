<?php
/*
if(!function_exists('curl_init')) {
    throw new Exception('The Coinbase client library requires the CURL PHP extension.');
}

require(dirname(__FILE__) . '/Exception.php');
require(dirname(__FILE__) . '/ApiException.php');
require(dirname(__FILE__) . '/ConnectionException.php');
//require(dirname(__FILE__) . '/Coinbase/Coinbase.php');
require(dirname(__FILE__) . '/Requestor.php');
require(dirname(__FILE__) . '/Rpc.php');
require(dirname(__FILE__) . '/OAuth.php');
require(dirname(__FILE__) . '/TokensExpiredException.php');
*/
/*
  'Paypal' => array(
    'class'=>'application.components.Paypal',
    'apiUsername' => 'YOUR_API_USERNAME',
    'apiPassword' => 'YOUR_API_PASSWORD',
    'apiSignature' => 'YOUR_API_SIGNATURE',
    'apiLive' => false,
 
    'returnUrl' => 'paypal/confirm/', //regardless of url management component
    'cancelUrl' => 'paypal/cancel/', //regardless of url management component
 
    // Default currency to use, if not set USD is the default
    'currency' => 'USD',
 
    // Default description to use, defaults to an empty string
    //'defaultDescription' => '',
 
    // Default Quantity to use, defaults to 1
    //'defaultQuantity' => '1',
 
    //The version of the paypal api to use, defaults to '3.0' (review PayPal documentation to include a valid API version)
    //'version' => '3.0',
),

*/

class YiiBitcoin extends CApplicationComponent
{
    public $API_KEY;
    public $CLIENT_SECRET;
    public $CLIENT_ID;
    
    public $CALLBACK_URL;
    public $CANCEL_URL;
    public $SUCCESS_URL;
    
    public $access_token;
    
    
    
    const API_BASE = 'https://coinbase.com/api/v1/';
   
      public function init(){
	
	
        //set return and cancel urls
        $this->CALLBACK_URL = Yii::app()->createAbsoluteUrl($this->CALLBACK_URL);
        $this->CANCEL_URL = Yii::app()->createAbsoluteUrl($this->CANCEL_URL);
        $this->SUCCESS_URL = Yii::app()->createAbsoluteUrl($this->SUCCESS_URL);
    }
    
    public function askPermission($popup=false)
    { 
      //$url = $this->API_BASE;
      $url="https://coinbase.com/oauth/authorize";
      
       $params = array(
						'response_type' => urlencode("code"),
						'client_id' => urlencode($this->CLIENT_ID),
						'redirect_uri' => urlencode($this->CALLBACK_URL),
						
				);

       // $this->sendRequest($url,"GET",$params);
        $fields_string=$this->getStringParams($params);  
        
        //echo $url."?".$fields_string; 
        
      
        if($popup)
        {
                                         echo "
                                            <script type='text/javascript'>
                                            
                                            newwindow=window.open('".$url."?".$fields_string."','Bitcoin permission','height=500,width=500');
	                                     if (window.focus) {newwindow.focus()}
	
                                            </script>
                                           ";
        }
        else
        {
         header("location:".$url."?".$fields_string);
        } 
       
    }
    
    public function getAccessToken($code)
    {
      //https://coinbase.com/oauth/token?grant_type=authorization_code&code=CODE&redirect_uri=YOUR_CALLBACK_URL&client_id=CLIENT_ID&client_secret=CLIENT_SECRET
      
         $url="https://coinbase.com/oauth/token";
        
         $params = array(
						'grant_type' => urlencode("authorization_code"),
						'code' => urlencode($code),
						'redirect_uri' => urlencode($this->CALLBACK_URL),
						'client_id'=>urlencode($this->CLIENT_ID),
						'client_secret'=.urlencode($this->CLIENT_SECRET),
						
				);
				
         $response=$this->sendRequest($url,"POST",$params);
         $response=json_decode($response);
         
         $this->access_token=$response['access_token'];
         
         return($response);
    }
    public function getBalance($access_token)
    {
      $url="https://coinbase.com/api/v1/account/balance?access_token=";
      
        $params = array(
				
			 'access_token'=.urlencode($access_token)
						
		       );
       $response=$this->sendRequest($url,"GET",$params);
       $response=json_decode($response);
       
       return($response);
    }
    
    public function sendRequest($url,$type,$params)
    {

	$fields_string=$this->getStringParams($params);   
	
	
       
       $ch = curl_init();

       
         
       if($type=="POST")
       {  
         curl_setopt($ch,CURLOPT_POST, count($params));
         curl_setopt($ch,CURLOPT_POSTFIELDS, $fields_string);
         curl_setopt($ch,CURLOPT_URL, $url);
        
       }
       else
       {
         curl_setopt($ch,CURLOPT_URL, $url."?".$fields_string);
       }

      $response = curl_exec($ch);
      
        if($response === false) {
            $error = curl_errno($curl);
            $message = curl_error($curl);
            curl_close($curl);
            throw new CHttpException(404,"Network error " . $message . " (" . $error . ")");
            
        }
        
        // Check status code
        $statusCode = curl_getinfo($curl, CURLINFO_HTTP_CODE);
        curl_close($curl);
        if($statusCode != 200) {
            throw new CHttpException($statusCode,$response);
        }
      
      return($response);
    
    }
    public function getStringParams($params)
    {
       $fields_string="";
       
      if(is_array($params)&&count($params)>0)
	{
	    foreach($params as $key=>$value) {
	    
	    $fields_string .= $key.'='.$value.'&'; 
	    
	    }
	   
	} 
       return(substr($fields_string,0,-1));	
    }

}

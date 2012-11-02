<?php
include 'class.phpmailer.php';
include 'class.smtp.php';
Class Mail 
{	
	public $mailobj;  //phpmailer object
	public $mailSMTPDebug = false;
	public $mailIsSMTP = true; // telling the program to use SMTP (either true or false)	
	public $mailSMTPAuth = true; //enable SMTP authentication (either true or false)
	public $mailSMTPSecure = "tls"; // sets the prefix to the servier
	public $mailHost = "email-smtp.us-east-1.amazonaws.com"; // sets SMTP server
	public $mailPort = "25"; // set the SMTP port
	public $mailUsername = "AKIAIXP7W6PN6V4B4PRA"; // mail user name
	public $mailPassword = "AsSM4a7bvJ2eUJhOqFe4/XFUvH1CmSzZ0hOy9yTqASbw"; //mail user password
	
	/*Mail sender and receiver details*/
	public $mailFrom = "jaideep@jaideep.org"; //mail sender email
    public $mailFromName = "jaideep@jaideep.org"; //mail sender name
	//public $mailToName = "Recipient"; //mail receiver name
	public $mailSubject = "";
	public $mailSuccessMsg = "Request sent successfully.";
	public $mailfailureMsg = "Request error.";
	public $invalidCaptcha = "Invalid Captcha Value";
	
	public function __construct($from='',$fromName='')
	{	
		$mail = new PHPMailer();
		if($this->mailIsSMTP)
		{
			$mail->IsSMTP();
		} 
		if($this->mailSMTPDebug)
		{
			$mail->SMTPDebug = $this->mailSMTPDebug;
		}
		$mail->SMTPAuth = $this->mailSMTPAuth;	
		$mail->SMTPSecure = $this->mailSMTPSecure;
		$mail->Host = $this->mailHost;
		$mail->Port = $this->mailPort;
		$mail->Username = $this->mailUsername;
		$mail->Password = $this->mailPassword;
                if($from=='' && $fromName=='')
                    $mail->SetFrom($this->mailFrom, $this->mailFromName);
		else
                    $mail->SetFrom($from,$fromName);
                $this->mailobj = $mail;		
	}
	public function getMailObj()
	{
		return $this->mailobj;
	}
	public function addAddress($mailTo,$mailToName='')
	{  
		$this->mailobj->AddAddress($mailTo,$mailToName);
	}
        public function addCCAddress($mailTo)
	{  
		$this->mailobj->AddCC($mailTo);
	}
        public function addBCCAddress($mailTo)
	{  
		$this->mailobj->AddBCC($mailTo);
	}
	public function setBodyContent($bodyArray,$subject)
	{
        //        global $mailSubject;    
		$this->mailobj->Subject = $subject;		
		$this->mailobj->MsgHTML($bodyArray);
	}	
	
	public function setFromName($mailFrom='',$mailFromName='')
	{  
		$this->mailobj->SetFrom($mailFrom,$mailFromName);
	}
	
	public function sendMail()
	{
		$responseData = $this->mailSuccessMsg;
		if($fail = !$this->mailobj->Send())
		{
			$responseData = $this->mailfailureMsg;
		}
		return array($responseData,$fail);
	}	
};
?>

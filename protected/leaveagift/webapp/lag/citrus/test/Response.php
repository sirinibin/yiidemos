<?php

set_include_path('../lib'.PATH_SEPARATOR.get_include_path());
require_once 'Zend/Crypt/Hmac.php';

function generateHmacKey($data, $apiKey=null){
	$hmackey = Zend_Crypt_Hmac::compute($apiKey, "sha1", $data);
	return $hmackey;
}

$txnid = "";
$txnrefno = "";
$txnstatus = "";
$txnmsg = "";
$firstName = "";
$lastName = "";
$email = "";
$street1 = "";
$city = "";
$state = "";
$country = "";
$pincode = "";
$mobileNo = "";
$signature = "";
$reqsignature = "";
$data = "";
$flag = "dataValid";

if(isset($_POST['TxId']))
{
	$txnid = $_POST['TxId'];
	$data .= $txnid;
}
if(isset($_POST['TxStatus']))
{
	$txnstatus = $_POST['TxStatus'];
	$data .= $txnstatus;
}
if(isset($_POST['amount']))
{
	$amount = $_POST['amount'];
	$data .= $amount;
}
if(isset($_POST['pgTxnNo']))
{
	$pgtxnno = $_POST['pgTxnNo'];
	$data .= $pgtxnno;
}
if(isset($_POST['issuerRefNo']))
{
	$issuerrefno = $_POST['issuerRefNo'];
	$data .= $issuerrefno;
}
if(isset($_POST['authIdCode']))
{
	$authidcode = $_POST['authIdCode'];
	$data .= $authidcode;
}
if(isset($_POST['firstName']))
{
	$firstName = $_POST['firstName'];
	$data .= $firstName;
}
if(isset($_POST['lastName']))
{
	$lastName = $_POST['lastName'];
	$data .= $lastName;
}
if(isset($_POST['pgRespCode']))
{
	$pgrespcode = $_POST['pgRespCode'];
	$data .= $pgrespcode;
}
if(isset($_POST['addressZip']))
{
	$pincode = $_POST['addressZip'];
	$data .= $pincode;
}
if(isset($_POST['signature']))
{
	$signature = $_POST['signature'];
}
/*signature data end*/

if(isset($_POST['TxRefNo']))
{
	$txnrefno = $_POST['TxRefNo'];
}
if(isset($_POST['TxMsg']))
{
	$txnmsg = $_POST['TxMsg'];
}
if(isset($_POST['email']))
{
	$email = $_POST['email'];
}
if(isset($_POST['addressStreet1']))
{
	$street1 = $_POST['addressStreet1'];
}
if(isset($_POST['addressStreet2']))
{
	$street2 = $_POST['addressStreet2'];
}
if(isset($_POST['addressCity']))
{
	$city = $_POST['addressCity'];
}
if(isset($_POST['addressState']))
{
	$state = $_POST['addressState'];
}
if(isset($_POST['addressCountry']))
{
	$country = $_POST['addressCountry'];
}

if(isset($_POST['mandatoryErrorMsg']))
{
	$mandatoryerrmsg = $_POST['mandatoryErrorMsg'];
}
if(isset($_POST['successTxn']))
{
	$successtxn = $_POST['successTxn'];
}
if(isset($_POST['mobileNo']))
{
	$mobileNo = $_POST['mobileNo'];
}

$respSignature = generateHmacKey($data,"5a45567fecb08a3361398947c7d3d825bc2fa426");

if($signature != "" && strcmp($signature, $respSignature) != 0)
{
	$flag = "dataTampered";
}

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Payment Response</title>
<link href="css/default.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="page-header">
		<div class="page-wrap">
			<div class="logo-wrapper">
				<a href="/citruspay-admin-site/"> <img height="32" width="81"
					src="images/logo_citrus.png" alt="Citrus" />
				</a>
			</div>
		</div>
	</div>

	<div id="page-client-logo">&#160;</div>
	<div id="page-wrapper">
		<div class="box-white">
			<div class="page-content">
				<div>
					<?php 
					if($flag == "dataValid")
					{	
					?>
					<h3>Transaction Response</h3>
					<ul id="MerchantKitResponse" class="tbl-wrapper clearfix">
						<li class="tbl-header">
							<div class="tbl-col col-1">Txn Id</div>
							<div class="tbl-col col-2">Txn Ref No</div>
							<div class="tbl-col col-1">Txn Status</div>
							<div class="tbl-col col-1">Txn Message</div>
						</li>
						<li>
							<div class="tbl-col col-1">
								<?php echo $txnid;?>
							</div>
							<div class="tbl-col col-2" style="height: auto;">
								<?php echo $txnrefno;?>
							</div>
							<div class="tbl-col col-1">
								<?php echo $txnstatus;?>
							</div>
							<div class="tbl-col col-1">
								<?php echo $txnmsg;?>
							</div>
						</li>
					</ul>
					<h3>Consumer Details:</h3>
					<ul class="form-wrapper add-merchant clearfix">
						<li class="clearfix"><label>First Name: </label> <?php echo $firstName;?>
						</li>
						<li class="clearfix"><label>Last Name: </label> <?php echo $lastName;?>
						</li>
						<li class="clearfix"><label>Email: </label> <?php echo $email;?></li>
						<li class="clearfix"><label>Address: </label> <?php echo $street1;?>
						</li>
						<li class="clearfix"><label>City: </label> <?php echo $city;?></li>
						<li class="clearfix"><label>State: </label> <?php echo $state;?></li>
						<li class="clearfix"><label>Country: </label> <?php echo $country;?>
						</li>
						<li class="clearfix"><label>Zip Code: </label> <?php echo $pincode;?>
						</li>
						<li class="clearfix"><label>Mobile Number: </label> <?php echo $mobileNo;?>
						</li>
					</ul>
					<?php 
					}
					else
					{
					?>
						<h3>Signature mismatch!!!</h3>
					<?php 	
					}
					?>
				</div>
			</div>
			<div style="padding-left: 700px; padding-bottom: 20px; padding-top: 20px;">
				<div>Copyrights © 2012 Citrus.</div>
			</div>
		</div>
	</div>

</body>
</html>

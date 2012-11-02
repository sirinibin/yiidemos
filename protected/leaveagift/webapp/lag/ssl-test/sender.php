

<?php
 echo "<html><head> <title>  Check connection </title></head>";

if (isset($_SERVER['HTTPS']) )
{
    echo "SECURE: This page is being accessed through a secure connection.<br><br></br>";
}
else
{
    echo "UNSECURE: This page is being accessed through an unsecure connection.<br><br></br>";
	exit();
}

// Create the keypair
//$res=openssl_pkey_new();

// Get private key
//openssl_pkey_export($res, $privatekey);

// Get public key
//$publickey=openssl_pkey_get_details($res);
//$publickey=$publickey["key"];

$file = 'public.pem';
// Open the file to get existing content
$current = file_get_contents($file);
// Append a new person to the file
//$current = $publickey;
// Write the contents back to the file
//file_put_contents($file, $current);

$file = 'private.pem';
// Open the file to get existing content
$current2 = file_get_contents($file);
// Append a new person to the file
//$current = $privatekey;
// Write the contents back to the file
//file_put_contents($file, $current);

echo "</br>Private Key:<BR>$current<br><br>Public Key:<BR>$current2<BR><BR></br>";

$cleartext = '1234 5678 9012 3456';

echo "</br>Original voucher Code:<br>$cleartext<BR><BR>";

openssl_public_encrypt($cleartext, $crypttext, $current);

echo "</br>Encrypted text:<br>$crypttext<BR><BR>";

$file = 'crypt.txt';
// Open the file to get existing content
file_put_contents($file, $crypttext);

openssl_private_decrypt($crypttext, $decrypted, $current2);

echo "</br>Decrypted text:<BR>$decrypted<br><br></br>";

$newurl=urlencode($crypttext);



//openssl_private_decrypt(urldecode($newurl), $newdecrypted, $privatekey);

//echo "</br></br>".$newdecrypted;



?>

<html>
<a href="rec_now.php?token=<? echo $newurl; ?>">click here to redeem the gift</a>
</br>
</br>
</br>
</br>
</html>

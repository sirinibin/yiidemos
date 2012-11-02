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
$res=openssl_pkey_new();

// Get private key
openssl_pkey_export($res, $privatekey);

// Get public key
$publickey=openssl_pkey_get_details($res);
$publickey=$publickey["key"];

$file = 'public.txt';
// Open the file to get existing content
$current = file_get_contents($file);
// Append a new person to the file
$current .= $publickey;
// Write the contents back to the file
file_put_contents($file, $current);

$file = 'private.txt';
// Open the file to get existing content
$current = file_get_contents($file);
// Append a new person to the file
$current .= $privatekey;
// Write the contents back to the file
file_put_contents($file, $current);

echo "</br>Private Key:<BR>$privatekey<br><br>Public Key:<BR>$publickey<BR><BR></br>";

$cleartext = '1234 5678 9012 3456';

echo "</br>Original text:<br>$cleartext<BR><BR>";

openssl_public_encrypt($cleartext, $crypttext, $publickey);

echo "</br>Encrypted text:<br>$crypttext<BR><BR>";

openssl_private_decrypt($crypttext, $decrypted, $privatekey);

echo "</br>Decrypted text:<BR>$decrypted<br><br></br></br></br>";

$newurl=urlencode($crypttext);

echo $newurl."</br></br></br></br>";

echo urldecode($newurl)."</br></br>";

openssl_private_decrypt(urldecode($newurl), $newdecrypted, $privatekey);

echo "</br></br>".$newdecrypted;

/*
// User variables:
$dir = '/temp/'; // Directory where apache has access to (chmod 777).
$RootCA = '/etc/apache2/ssl/apache.pem'; // Points to the Root CA in PEM format.
$OCSPUrl = 'https://www.onlinesbi.com'; //Points to the OCSP URL
// Script:
$a = rand(1000,99999); // Needed if you expect more page clicks in one second!
file_put_contents($dir.$a.'cert_i.pem', $_SERVER['SSL_CLIENT_CERT_CHAIN_0']); // Issuer certificate.
file_put_contents($dir.$a.'cert_c.pem', $_SERVER['SSL_CLIENT_CERT']); // Client (authentication) certificate.
$output = shell_exec('openssl ocsp -CAfile '.$RootCA.' -issuer '.$dir.$a.'cert_i.pem -cert '.$dir.$a.'cert_c.pem -url '.$OCSPUrl);
$output2 = preg_split('/[\r\n]/', $output);
$output3 = preg_split('/: /', $output2[0]);
$ocsp = $output3[1];
echo "OCSP status: ".$ocsp; // will be "good", "revoked", or "unknown"
unlink($dir.$a.'cert_i.pem');
unlink($dir.$a.'cert_c.pem');
*/
?>

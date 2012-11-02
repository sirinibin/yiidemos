<html>
Getting values from Last URL is:
</html>

<?
echo $_REQUEST['token']."</br>";
/*
//$token="gjcjdchdcjcfnc89172871jdn";
$url="https://localhost/crypt.txt";

$ch = curl_init();
$timeout = 5;
curl_setopt($ch,CURLOPT_URL,$url);
curl_setopt($ch,CURLOPT_RETURNTRANSFER,1);
curl_setopt($ch,CURLOPT_CONNECTTIMEOUT,$timeout);
$data = curl_exec($ch);
curl_close($ch);


echo "data is".$data;
$file = 'private.pem';
// Open the file to get existing content
$current2 = file_get_contents($file);
openssl_private_decrypt($data, $decrypted, $current2);

echo "</br>Decrypted text:<BR>$decrypted<br><br></br>";

*/

$newurl2= urldecode($_REQUEST['token']);
$file = 'private.pem';
// Open the file to get existing content
$current2 = file_get_contents($file);
openssl_private_decrypt($newurl2, $decrypted, $current2);

echo "</br>Decrypted text:<BR>$decrypted<br><br></br>";

?>

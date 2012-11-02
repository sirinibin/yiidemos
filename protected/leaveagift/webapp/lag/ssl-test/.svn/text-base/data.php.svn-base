<?php
// Create the keypair
$res=openssl_pkey_new();

// Get private key
openssl_pkey_export($res, $privkey, "PassPhrase number 1" );

// Get public key
$pubkey=openssl_pkey_get_details($res);
$pubkey=$pubkey["key"];
//var_dump($privkey);
//var_dump($pubkey);

// Create the keypair
$res2=openssl_pkey_new();

// Get private key
openssl_pkey_export($res2, $privkey2, "This is a passPhrase *µà" );

// Get public key
$pubkey2=openssl_pkey_get_details($res2);
$pubkey2=$pubkey2["key"];
var_dump($privkey2);
echo "</br>";
var_dump($pubkey2);
echo "</br>";
$data = "Only I know the purple fox. Trala la !";

openssl_seal($data, $sealed, $ekeys, array($pubkey, $pubkey2));

var_dump("sealed");
var_dump(base64_encode($sealed));
var_dump(base64_encode($ekeys[0]));
var_dump(base64_encode($ekeys[1]));
echo "</br>";
// decrypt the data and store it in $open
if (openssl_open($sealed, $open, $ekeys[1], openssl_pkey_get_private  ($privkey2  ,"This is a passPhrase *µà" ) ) ) {
    echo "here is the opened data: ", $open;
} else {
    echo "failed to open data";
}

?>

<?php
include ('releasemanagement/Classes/mail.class.php');
$obj=new Mail();
$subject = "test subject";
$body = "test body";
$obj->setBodyContent($body,$subject);
//$to=$_SESSION['e_mail'];
$to="aakash@metadesignsolutions.in";
$obj->addAddress($to);
$cc="aakashtest@metadesignsolutions.in";
$obj->addCCAddress($cc);
$obj->sendMail();
?>

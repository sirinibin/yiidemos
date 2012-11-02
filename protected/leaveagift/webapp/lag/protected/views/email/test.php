<html>
<head>
<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->params['hostname']; ?>css/gift-style.css" />
</head>
<body>
<img src="https://graph.facebook.com/<?php echo $fb_id;  ?>/picture" alt="http://www.escapingthe9to5.com/wp-content/uploads/2011/01/N0.png" height="100" width="100"> Dear <?php echo $name; ?>,
<br>
Welcome to leaveagift.com.
<br>
Enjoy,
<br>
LeaveaGift Team

<a href="<?php echo Yii::app()->params['hostname'].'receiver/seeGift/gid/'.$id_user_gift; ?>">Click here to see the gift</a>
<?php
//$this->widget('ReceiverGiftCard',array('id_user_gift'=>2,'email_view'=>true));
?>
</body>
</html>

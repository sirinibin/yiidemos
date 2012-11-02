<?

class PayreturnController extends CController{

public $layout="main";

//echo CController::createUrl('auth/logout',array('token'=>Yii::app()->getRequest()->getCsrfToken()))

public function actionReturn()
{
	echo "<pre>";
  	print_r($_REQUEST);
 	//$txnid= $_REQUEST['merchantTxnId'];
 	//echo $txnid;	
 	echo "</pre>";
	//$id_order=1;
	
    $command = Yii::app()->db->createCommand();
    $command->update('lag_payment', array('pgTxnNo'=>$_REQUEST['pgTxnNo'],'TxRefNo'=>$_REQUEST['TxRefNo'],'TxMsg'=>$_REQUEST['TxMsg'],'TxStatus'=>$_REQUEST['TxStatus'],'amount'=>$_REQUEST['amount']),'id_order=:id_order', array(':id_order'=>$id_order));


}
}


?>

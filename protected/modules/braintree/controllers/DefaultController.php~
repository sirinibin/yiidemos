<?php

class DefaultController extends Controller
{
	public function actionIndex()
	{
		$this->render('index');
	}
	public function actionSale()
	{
	  $data=array(
			'amount' => '0.50',
			'creditCard' => array(
					      'number' => '5105105105105100',
					      'expirationMonth' => '05',
					      'expirationYear' => '12'
					    )
		      );

	  $r=Yii::app()->braintree->sale($data);
	  
	  echo "<pre>";
	  print_r($r);
	  echo "</pre>";
	  
	
		    
	  
	  if(isset($r['validation_errors']))
	    {
	      foreach($r['validation_errors'] as $e)
	      {
		echo "attribute name:".$e->attribute."<br/>";
		echo "error code:".$e->code."<br/>";
		echo "message:".$e->message."<br/>";
		echo "<hr/>";
	      }
	    }
	  
	

	}
}
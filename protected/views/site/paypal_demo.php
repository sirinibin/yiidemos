<h2>Paypal Demo</h2>
<div>
  <table>
  <tr><td><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/images.jpeg"></yd>
    <tr><td>Milk Shake with Ice Cream</td>
   <tr><td>20.00 USD</td>
  <tr><td>
  <a href="<?php echo Yii::app()->createUrl("site/RequestPayment"); ?>">
  <img src="https://www.paypal.com/en_US/i/btn/btn_xpressCheckout.gif" align="left" style="margin-right:7px;">
  </a>
  </td>
    
  </table>
   <pre>
     Please Create a paypal sandbox account here :https://developer.paypal.com to test this.
   </pre>
  
</div>
<!-- content starts -->
  <div id="content">
  <div class="payment_wrapper">
 
  
  <p>
    <div class="order_confirmation_outer">
      <table width="200" align="center" cellpadding="7" cellspacing="5">
        <tr>
          <td align="center"><img src="<?php echo Yii::app()->baseUrl; ?>/images/oops.png" width="166" height="61" alt="oops" /></td>
        </tr>
        <tr>
          <td align="center" style="color:#3fa203; font-size:20px;">
             <?php 
                  $code=isset($error['code'])?$error['code']:"";
                  $error_message=isset($error['message'])?$error['message']:"";
                  
                  if(!empty($code)) 
                  echo $code.":".$error_message;
                  
                  echo "<br/>".$message;
              ?>
         </td>
          </tr>
      </table>
    </div>
    <p>
      <!-- payment content -->
      </p>
      
      <!-- gift card ends -->
      
      
      
      
      
  <!--    <div id="apDiv1">
    
   			<a href="send-gift.html">
            <div class="gift-card-frame">
						<div class="free"><img src="images/gift-free.png" border="0" width="50" height="22" alt="" /></div>
                        <div class="picture"><img src="images/gift-01.png" alt="" width="199" height="138" border="0" /></div>
                        <div class="price"><span class="WebRupee">Rs.</span> 25.00</div>
                        <div class="description"><strong>online gift - E-Cash</strong>Barclay's Bin...Ready, Set, Sip. Wine delivery direct to your door.</div>
                        <div class="brand"><img src="images/brand-01.gif" alt="" width="100" height="22" border="0" /></div>
                        <div class="button">Send it now for free</div>
    
   				 </div>
                 </a>   
     
                 
  
  
    </div> -->
      <!-- ap div ends -->
      
    </p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </div>
  </div>
  <!-- content ends --> 
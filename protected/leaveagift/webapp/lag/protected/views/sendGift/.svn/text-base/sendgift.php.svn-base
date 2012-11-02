 <!-- header starts -->
    <div id="secondary-header">
                                      
      <div class="fb-friend-pic"><img src='https://graph.facebook.com/<?php echo Yii::app()->session['selected-userid']; ?>/picture?width=75&height=70&return_ssl_results=1' width="75" height="70" alt="FB Friend" /></div>
      <div class="title">
        <h1><?php echo Yii::app()->session['selected-username']?>'s gift</h1>
      </div>
        
                                        <div class="gift-steps">
                                          <table width="100%" border="0" cellspacing="4" cellpadding="0">
                                            <tr>
                                              <td align="right" valign="top"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/1-dot-ora.gif" width="12" height="21" alt="" /></td>
                                              <td align="left" valign="top" >1. Pick a friend</td>
                                              <td align="right" valign="top"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/2-dot-ora.gif" width="24" height="21" alt="" /></td>
                                              <td align="left" valign="top">2. Choose a gift</td>
                                              <td align="right" valign="top"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/3-dot-pur.gif" width="24" height="21" alt="" /></td>
                                              <td align="left" valign="top"  class="gift-step-selected" >3. Spread Joy</td>
                                              <td align="left" valign="top"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/smile-pur.gif" width="32" height="21" alt="" /></td>
                                            </tr>
                                          </table>
                                        </div>
    </div>





  </div>
  <!-- secondary header ends --> 
                               
  
  <!-- content starts -->
  <div id="content">
  
  
  <!-- left panel starts-->
  <div id="left-panel-sendGift">
                         <?php $this->widget("ShowProduct",array("model"=>$order->product,'show_info'=>true,'delivery'=>$model->delivery)); ?>

  </div>  <!-- left panel ends--> 
  
  
  <!--  form starts -->

 <?php
   $this->renderpartial("_form",array('model'=>$model,'date_message'=>$date_message));
 
 ?>
  
  </div>
  <!-- content ends --> 
  

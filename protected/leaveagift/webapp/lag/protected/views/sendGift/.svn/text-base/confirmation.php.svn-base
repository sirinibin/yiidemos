
 <!-- header starts -->
    <div id="secondary-header">
                                      
      <div class="fb-friend-pic"><img src='https://graph.facebook.com/<?php echo Yii::app()->session['selected-userid']; ?>/picture?width=75&height=70&return_ssl_results=1' width="75" height="70" alt="FB Friend" /></div>
      <div class="title">
       <h1>You're done!</h1>
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
  <div id="content3">
          <div class="gift_diliver_text">Congratulations!Your gift will be left on <?php echo date('M-d-Y',strtotime($userorder->delivery_date)); ?>
            <h1>via Facebook.Your Order Number is <? echo $userorder->id_user_gift ; ?></h1>
          </div>
          <div class="send-gift-outer_container">
           <div class="view_sent_gfit" ><a href="<?php echo Yii::app()->createUrl('gift/mygifts'); ?>"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/view-sent-gift-btn.jpg" alt="view-gifts" width="282" height="53" border="0" /></a></div>
           <div class="start-new-gift" ><a href="<?php echo Yii::app()->createUrl('auth/index'); ?>"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/btn-send-new-gift-now.jpg" alt="view-gifts" width="315" height="53" border="0" /></a></div>
           <div class="send_gift_center_pane">
          <div class="sender_container">
                <div class="fb-friend-frame">
                  <div class="fb-friend-photo"><img src='https://graph.facebook.com/<?php echo Yii::app()->session["me"]['id']; ?>/picture?width=75&height=70&return_ssl_results=1' alt="" width="140" height="140" border="0" /></div>
                  <div class="fb-friend-name"><?php echo Yii::app()->session["me"]['first_name']; ?></div>
                </div>
              </div>
              <div class="reciever_container">
                <div class="fb-friend-frame">
                  <div class="fb-friend-photo"><img src='https://graph.facebook.com/<?php echo Yii::app()->session["selected-userid"]; ?>/picture?width=75&height=70&return_ssl_results=1' alt="" width="140" height="140" border="0" /></div>
                  <div class="fb-friend-name"><?php echo $userorder->receiver_fbfirstname; ?></div>
                </div>
              </div>
              <?php $this->widget("ShowProduct",array('pid'=>$userorder->id_product)); ?>
               <!--   
              <div id="apDiv1"> 
                <div class="gift-card-frame">
                  <div class="picture"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/gift-01.png" alt="" width="199" height="138" border="0" /></div>
                  <div class="price"><span class="WebRupee">Rs.</span> 25</div>
                  <div class="description"><strong>online gift - E-Cash</strong>Barclay's Bin...Ready, Set, Sip. Wine delivery direct to your door.</div>
                  <div class="brand"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/brand-01.gif" alt="" width="100" height="22" border="0" /></div>
                </div>
                 -->
                <br />
                <br />
              </div>
            </div>
          </div>
          <p>&nbsp;</p>
         
          <div class=""></div>
          <!-- left panel starts-->
          <!-- left panel ends-->
          <!--  form starts -->
        </div>
  <!-- content ends --> 

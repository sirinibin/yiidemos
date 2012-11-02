<div id="apDiv1">
     
          <a href="#">         
   			
            <div class="gift-card-frame">
                     
                        <div class="picture"><img src="<?php echo  $model->getImage(0); ?>" alt="" width="199" height="138" border="0" /></div>
                        <div class="price"><span class="WebRupee">Rs.</span><?php echo CHtml::encode(number_format($model->getPriceValue(),0,".","")); ?></div>
                        <div class="description"><strong><?php if(isset($model->tags[0]->name)) { echo  CHtml::encode($model->tags[0]->name); } ?></strong><?php   if(isset($model->product_lang->description)){ echo CHtml::encode($model->product_lang->description); } ?></div>
                        <div class="brand"><img src="<?php echo $model->getSupplierLogo(0); ?>" alt=""  border="0" /></div>
                            
       		    </div>
            </a>

    
                <?php if($this->show_info) { ?>   
 
   			     <br />
                 <br />
                    <?php
                  
                    // echo $this->order->delivery;
                  /*   $date=substr($this->order->delivery,0,2);
                     $month=substr($this->order->delivery,3,2);
                     $year=substr($this->order->delivery,6,4);
                     $delivery=$year."-".$month."-".$date;*/
                    ?>
                   
                 <div class="gift-info">
                     
                        <?php
                        
                        if(strtolower($model->tags[0]->name)!="gift to charity"){ ?>
                        <strong>Valid for: </strong><?php
                                          echo $model->user_validity." days";
                                        //echo $model->getUserValidity($this->delivery,"frontend"); ?>,after receipt<br /> <?php } ?>
				   <strong>Gift type: </strong><?php if($model->tags[0]->name) {echo CHtml::encode($model->tags[0]->name); }?><br />
				   <strong>Gift Features: </strong><br />
				   <?php if(isset($model->features)){ 
                                         echo $model->features;
                                         }
                                       ?>
<br />


<a href="#" onclick="MM_showHideLayers('apDiv2','','show')" >See full terms & conditions</a>

<br />

<div id="apDiv2">
  <table width="100%" border="0" cellspacing="2" cellpadding="13">
      <tr>
        <td align="right"><a href="javascript:return;"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/close.gif" alt="" width="12" height="12" border="0" onclick="MM_showHideLayers('apDiv2','','hide')" /></a></td>
      </tr>
	  <tr>
        <td><strong>Full terms and conditions:</strong></td>
      </tr>
       <tr>
        <td><?php 
            if(isset($model->terms))
            {
                echo $model->terms;
            }
            ?>
         </td>
      </tr>
     
      </table>
</div>

<br />
<br />
<br />
<br />

                </div>
              <?php } ?>                           
 
     
                
    </div>

  <div id="apDiv1">
    
   
   			
            <div class="gift-card-frame-re">

						
                        <div class="picture"><img src="<?php echo $model->getImage(1); ?>" width="280" height="199" alt="" /></div>
                       <div class="price"><span class="WebRupee">Rs.</span><?php 
			 echo CHtml::encode(number_format($model->getPriceValue(),0,".",""));
			 //echo $model->getPriceValue();
			?></div>
                        <div class="description">
                          
                           <strong><?php 
                            
                            if(isset($model->tags[0]->name)) { echo CHtml::encode($model->tags[0]->name); }?></strong><?php   if(isset($model->product_lang->description)){ echo CHtml::encode($model->product_lang->description); } ?></div>
                        <div class="brand"><img src="<?php echo $model->getSupplierLogo(1); ?>"  alt="" /></div>
                            
		    </div>
                 
     
                 
  
  
    </div>

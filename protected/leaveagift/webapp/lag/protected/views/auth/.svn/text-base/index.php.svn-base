<?php

$this->pageTitle=Yii::app()->name;

?>


  <!-- header starts -->
	<div id="secondary-header">
                                      
                                        <div class="fb-friend-pic"  ><img id="fb-friend-pic" src="<?php echo Yii::app()->request->baseUrl; ?>/images/fb-friend-pic.gif" width="75" height="75" alt="FB Friend"></div>
      <div class="title"><h1>Pick a friend to LeaveA<span class="gift-purple">Gift</span> for</h1></div>
                                
                                        <div class="gift-steps">
                                          <table width="100%" border="0" cellspacing="4" cellpadding="0">
                                            <tr>
                                              <td align="right" valign="top"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/1-dot-pur.gif" width="12" height="21" alt="" /></td>
                                              <td align="left" valign="top" class="gift-step-selected" >1. Pick a friend</td>
                                              <td align="right" valign="top"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/2-dot-ora.gif" width="24" height="21" alt="" /></td>
                                              <td align="left" valign="top" >2. Choose a gift</td>
                                              <td align="right" valign="top"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/2-dot-ora-A.gif" width="24" height="21" alt="" /></td>
                                              <td align="left" valign="top" >3. Spread Joy</td>
                                              <td align="left" valign="top"><img src="<?php echo Yii::app()->request->baseUrl; ?>/images/smile-ora.gif" width="32" height="21" alt="" /></td>
                                            </tr>
                                          </table>
                                        </div>

    </div>



  </div>

  <!-- header ends --> 

 


  
  
  <!-- content starts -->
  <div id="content">	
  						<div id="fb-butons">
                                  <div class="fb-events">
								  <ul class="tabbedPanels">
									<li id="birthday_this_month_tab" class="tab1 selected">Birthday this month</li>
									<li id="birthday_next_month_tab" class="tab2">Birthday next month</li>
									<!--<li class="tab3" style="display:none">All</li>-->
								  </ul>
								 </div>
                                  <div class="fb-search">
                                  
                                   
                                  <?php
                                  $model=new FriendSearch;
                                  $this->renderPartial("friend_search",array('model'=>$model)); 
                                  ?>
                                  
                                   <!--
                                  
                                    <form id="form1" name="form1" method="GET" action="<?php //echo Yii::app()->request->baseUrl; ?>/index.php/auth/search/">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td align="right"><input name="value" type="text" class="textbox-Search" id="search" default-value="Search friends" value="Search friends" size="20" /></td>

                                          <td><input type="image" width="100" value="submit" src="<?php //echo Yii::app()->request->baseUrl; ?>/images/search_btn.png" alt="submit Button" width="10" height="30" border="0" ></td>
                                          </tr>
                                      </table>
                                    </form>
                                   --> 
                                
                                  </div>
                             </div>   
                             
                             
                  
<!--        <div class="tabbedPanelContents" id="tab1_content" style="display:block;">        
                  
				    </div>-->
    <div id="parent_div" style="display:block;">

        <div class="tabbedPanelContents" id="tab1_content" style="display:block;">        
                      
		</div>
        
        <!--<div id="horizontal_line"style="clear:both;display:none;"><hr></div>-->

        <div id="birthday_next_month" class="tabbedPanelContents" style="display:block;">        
         
        </div>             
    </div>
    <div class="tabbedPanelContents" id="tab2_content" onclick="myFunction()"">
                   
                          
    </div>     
	
	<div class="tabbedPanelContents" id="tab3_content">
                   
                          
    </div>              
                   
                             
                             
                               
  </div>
  <!-- content ends --> 
  
<script>
function myFunction(){
Loading.show();
}
</script>


<?


?>


<?php
/* @var $this SiteController */
/* @var $model ContactForm */
/* @var $form CActiveForm */

$this->pageTitle=Yii::app()->name . ' - Contact Us';
?>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>LeaveAGift - Unleash Happiness</title>
<link rel="stylesheet" type="text/css" href="css/gift-style.css"/>
<body>
  <div id="fb-root"></div>
<script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
alert(done);

// listen for and handle auth.statusChange events
        FB.Event.subscribe('auth.statusChange', function(response) {
          if (response.authResponse) {
            // user has auth'd your app and is logged into Facebook
            FB.api('/me?fields=id,name,picture', function(me){
              if (me) {
			    document.getElementById('auth-displayname').innerHTML = me.name;
				document.getElementById('img-user').src = me.picture.data.url;
              }
            })
			FB.api('/me/friends?fields=id,name,picture', function (response) {
			   //alert(dump(response));
			   alert(JSON.stringify(response));
			   for(var obj in response.data)
			   {
			        //alert("now");
					//alert(dump(response.data[obj]));
					var newDiv = document.createElement("DIV");
					newDiv.innerHTML = "<img src='"+response.data[obj].picture.data.url+"'></img><br/>";
					document.getElementById('friendslist').appendChild(newDiv);
			   }
			   //alert(dump(response.data[0]));
               //friendslist.innerHTML = response;
			})

            document.getElementById('auth-loggedout').style.display = 'none';
            document.getElementById('auth-loggedin').style.display = 'block';
          } else {
            // user has not auth'd your app, or is not logged into Facebook
            document.getElementById('auth-loggedout').style.display = 'block';
            document.getElementById('auth-loggedin').style.display = 'none';
          }
        });

			
</script>
</head>


<!-- page wrapper starts -->
<div id="wrapper"> 
  
  <!-- header starts -->
  <div id="header">
                  <div id="primary-header">
                              
                                <div class="logo">LeaveA<span class="gift-purple">Gift</span>
                                        <span class="tagline">Unleash Happiness</span></div>
                                
                                <div class="navigation">
                                            <div class="nav-button"><a href="#">Start A New Gift</a></div>
                                            <div class="nav-button"><a href="#">My Gifts</a></div>
                                            <div class="nav-button"><a href="#">My Freebies</a></div>
                                </div>
                                
                                
<div class="userlogin">
                                                            <div class="user">Rakesh Sharma<br />
                                                            <a href="#">Log Out</a></div>
                                                            <div class="user-fb-pic"><img src="images/fb-user-pic.gif" width="50" height="50" alt="FB Pic" /></div>
                                                
                                                </div>
                                                
                                
                                
                  </div>


	<div id="secondary-header">
                                      
                                        <div class="fb-friend-pic"><img src="images/fb-friend-pic.gif" width="75" height="70" alt="FB Friend" /></div>
      <div class="title"><h1>Pick a friend to LeaveA<span class="gift-purple">Gift</span> for</h1></div>
                                        <div class="gift-steps">
                                          <table width="100%" border="0" cellspacing="4" cellpadding="0">
                                            <tr>
                                              <td align="left" valign="top"><img src="images/1-dot-pur.gif" width="12" height="21" alt="" /></td>
                                              <td align="left" valign="top" class="gift-step-selected">1. Pick a friend</td>
                                              <td align="left" valign="top"><img src="images/2-dot-ora.gif" width="24" height="21" alt="" /></td>
                                              <td align="left" valign="top">2. Choose a gift</td>
                                              <td align="left" valign="top"><img src="images/3-dot-ora.gif" width="24" height="21" alt="" /></td>
                                              <td align="left" valign="top">3. Spread Joy</td>
                                              <td align="left" valign="top"><img src="images/smile-ora.gif" width="32" height="21" alt="" /></td>
                                            </tr>
                                          </table>
                                        </div>
    </div>





  </div>
  <!-- header ends --> 
  
  <!-- content starts -->
  <div id="content">	
  						<div id="fb-butons">
                                  <div class="fb-events">Birthdays this month&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">Birthdays next month</a></div>
                                  <div class="fb-search">
                                    <form id="form1" name="form1" method="post" action="">
                                      <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                          <td align="right"><input name="textfield" type="text" class="textbox" id="textfield" value="Search friends" size="30" /></td>
                                          <td><a href="#"><img src="images/search-friends.gif" alt="" width="40" height="28" border="0" /></a></td>
                                        </tr>
                                      </table>
                                    </form>
                                  </div>
                             </div>   
                             
                             
                             
                             
                   <div class="fb-friends-list">
                   
                   <div class="fb-friend-frame">
   					<div class="calendar">17</div>
                    <div class="cake"></div>
                     <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-01.jpg" alt="" width="104" height="140" border="0" /></a></div>
                   <div class="fb-friend-name"> Neha</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">30</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-05.jpg" alt="" width="117" height="159" border="0" /></a></div>
                   <div class="fb-friend-name"> Rahul Kumar</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">13</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-02.jpg" alt="" width="122" height="159" border="0" /></a></div>
                   <div class="fb-friend-name">Puja</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">06</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-04.jpg" alt="" width="147" height="148" border="0" /></a></div>
                   <div class="fb-friend-name"> Himanshu</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">29</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-03.jpg" alt="" width="150" height="150" border="0" /></a></div>
                   <div class="fb-friend-name"> Sharuti</div>
                   </div>
                   </div> 
                   
                   <div class="fb-friends-list">
                   
                   <div class="fb-friend-frame">
                   <div class="calendar">13</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-06.jpg" alt="" width="102" height="146" border="0" /></a></div>
                   <div class="fb-friend-name"> Neeraj Narang</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">17</div>
                   <div class="cake"></div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-07.jpg" alt="" width="135" height="160" border="0" /></a></div>
                   <div class="fb-friend-name"> Rohan Kumar</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">30</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-10.jpg" alt="" width="111" height="152" border="0" /></a></div>
                   <div class="fb-friend-name"> Robin</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">09</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-08.jpg" alt="" width="108" height="157" border="0" /></a></div>
                   <div class="fb-friend-name">Nikhil</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">02</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-09.jpg" alt="" width="156" height="160" border="0" /></a></div>
                   <div class="fb-friend-name"> Shailendra</div>
                   </div>
                   </div> 
                   
                           <div class="fb-friends-list">
                   
                   <div class="fb-friend-frame">
                   <div class="calendar">06</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-01.jpg" alt="" width="104" height="140" border="0" /></a></div>
                   <div class="fb-friend-name"> Neha</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">11</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-05.jpg" alt="" width="117" height="159" border="0" /></a></div>
                   <div class="fb-friend-name"> Rahul Kumar</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">14</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-02.jpg" alt="" width="122" height="159" border="0" /></a></div>
                   <div class="fb-friend-name">Puja</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">18</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-04.jpg" alt="" width="147" height="148" border="0" /></a></div>
                   <div class="fb-friend-name"> Himanshu</div>
                   </div>
                   <div class="fb-friend-frame">
                   <div class="calendar">07</div>
                   <div class="fb-friend-photo"><a href="#"><img src="images/fb-friend-03.jpg" alt="" width="150" height="150" border="0" /></a></div>
                   <div class="fb-friend-name"> Sharuti</div>
                   </div>
                   </div> 
                           
                             
                             
                               
  </div>
  <!-- content ends --> 
  
  
  
</div>
<!-- page wrapper ends -->




  <!-- footer starts -->
  <div id="footer"><a href="#">Home</a> | <a href="#">FAQ</a> | <a href="#">Retailers</a> | <a href="#">Press</a> | <a href="#">About Us</a><br />
    <br />
Copyright 2012 LeaveAGift | <a href="#">Contact</a> | <a href="#">Terms of Service</a> | <a href="#">Privacy</a> </div>
  <!-- footer ends --> 
</body>
</html>

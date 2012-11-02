<?php /* @var $this Controller */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="language" content="en" />

	<!-- blueprint CSS framework -->
	<link rel="stylesheet" type="text/css" href="<?php echo Yii::app()->request->baseUrl; ?>/css/gift-style.css" />
	<link rel="shortcut icon" type="image/x-icon" href="<?php echo Yii::app()->request->baseUrl; ?>/images/favicon.ico">
	
	<link rel="stylesheet" type="text/css" href="http://cdn.webrupee.com/font">
	<!--load from google for faster loading, maybe later we can use yii inbuilt stuff-->
  	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.0/jquery.min.js"></script>
	<title>Spread Happiness</title> <!--</<?php echo CHtml::encode($this->pageTitle); ?></title>-->
 <script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
function MM_showHideLayers() { //v9.0
  var i,p,v,obj,args=MM_showHideLayers.arguments;
  for (i=0; i<(args.length-2); i+=3) 
  with (document) if (getElementById && ((obj=getElementById(args[i]))!=null)) { v=args[i+2];
    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
    obj.visibility=v; }
}
</script>

</head>

<body>

 <!-- page wrapper starts -->
<div id="wrapper"> 

<!-- header starts -->

  <div id="header-receiverGift">
         
 <a href="<?php echo Yii::app()->createAbsoluteUrl('auth/index'); ?>">

                  <div id="primary-header">
                    <div style="logoframeinside">

<div class="logoHome">LeaveA<span class="gift-purple">Gift</span>
    </div>

                                <div class="navigation">
                                            <!--
                                            <div class="nav-button"><a href="#">Start A New Gift</a></div>
                                            <div class="nav-button"><a href="<?php echo Yii::app()->createUrl('gift/mygifts');  ?>">My Gifts</a></div>
                                            <div class="nav-button"><a href="#"><span>My Freebies</span></a></div>
                                        -->
                                </div>

<div class="userlogin">
                                                              <div class="user" id='logout'>
                                                                 <!-- 
                                                                  <span id="logged-user-name"></span> <br />
                                                                  <a href="javascript:return;" class="logout">Log Out</a>
                                                                  -->
                                                              </div>
                                                           <!--
                                                            <div class="user-fb-pic" >
                                                                <img id ="logged-user-pic" src="<?php echo Yii::app()->request->baseUrl; ?>/images/fb-user-pic.gif" width="50" height="50" alt="FB Pic" />
                                                            
                                                            </div>
                                                            -->
                                                
                    </div>

                  </div>
                              
                                
 <div class="tagline-Home">
 Spread Happiness
 </div>
</a>          
</div>     
</div>
<!--Main header ends here-->

	<?php echo $content; ?>

</div>
<!-- page wrapper ends -->

	

	<!-- footer starts -->
  <div id="footer"><?php echo CHtml::link('Home',array('/auth/index')); ?>|<?php echo CHtml::link('FAQS',array('/auth/page/view/faqs')); ?>| <a href="#">Retailers</a> | <a href="#">Press</a> | <a href="#">About Us</a><br />
    <br />
    <br />
Copyright 2012 LeaveAGift | <a href="#">Contact</a> | <a href="<?php echo Yii::app()->createUrl('gift/terms'); ?>">Terms of Service</a> | <a href="<?php echo Yii::app()->createUrl('gift/privacy'); ?>">Privacy</a> </div>
  <!-- footer ends --> 





 <div id="fb-root"></div>
 <script>
        // Load the SDK Asynchronously
        (function(d){
           var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
           if (d.getElementById(id)) {return;}
           js = d.createElement('script'); js.id = id; js.async = true;
           js.src = "//connect.facebook.net/en_US/all.js";
           ref.parentNode.insertBefore(js, ref);
         }(document));
         
          window.fbAsyncInit = function() {
          FB.init({
            appId      : "<?php echo Yii::app()->params['facebook_appId']; ?>", // App ID
            //TODO add channel url with proper caching
            //channelUrl : 
            status     : true, // check login status
            cookie     : false, // we use signed_request https://developers.facebook.com/docs/authentication/signed_request/
            xfbml      : true,  // parse XFBML
            oauth      : true
          }); 

          function login()
           {

			FB.login(function(response) {
   			//TODO:check proper permissions
   			if (response.authResponse) {
   				//redirect to auth/login
   				redirect(response.authResponse.signedRequest);

   			} 
   			else if (response.status != 'unknown') { 
                    
            	//TODO:error handling
                 } 
 		}, {scope:'<?php echo Yii::app()->params["facebook_scope"]; ?>'});	
           }
           $(".login").click(function(e){
			login();
            });
      
       function redirect(signedRequest)
       {
               var url = '<?php echo Yii::app()->createAbsoluteUrl("campaign/PapaCJCongrats"); ?>';
      		//var url = window.location;
      		if (signedRequest) {
                url += "?signed_request=" + signedRequest;
            }
            window.location = url;

       }


      
      	  FB.getLoginStatus(function(response) {
  			if (response.status === 'connected')                    {																																																																																																																																																																																																																																																																																																																																																																																											                       setUserInfo();
                  
  			 	//getFriendsWithBirthdays();
		  } else if (response.status === 'not_authorized') {
		    // the user is logged in to Facebook, 
		    // but has not authenticated your app
		    //TODO: this condition
                   //login();
                    //  window.location='<?php echo Yii::app()->createUrl("auth/logout",array("token"=>Yii::app()->getRequest()->getCsrfToken())); ?>';

		  } else {
 
                     //login();
		    // the user isn't logged in to Facebook.
		    //TODO: rare case
                   // window.location='<?php echo Yii::app()->createUrl("auth/logout",array("token"=>Yii::app()->getRequest()->getCsrfToken())); ?>';
		  }
		 });
          }
          
                
		  function setUserInfo()
		  {
			  FB.api('/me?fields=id,name,picture', function(me){
                         if (me) {
			    document.getElementById('logged-user-name').innerHTML = me.name;
				document.getElementById('logged-user-pic').src = me.picture.data.url;
              }
            })

		  }
                 
		  
		  function intToString(str)
		  {
			 if(str.length==1)
				str="0"+str ;
			 return str;
	      }
		  function getFriendsWithBirthdays()
		  {
			var current_date=intToString(new Date().getDate().toString());
			//var current_date=new Date(2012,10,21).getDate();//yyyy,mm,dd
      		var current_month=new Date().getMonth()+1;
			var current_month=intToString(current_month.toString());
            
			var next_month = new Date().getMonth()+2;
			var today = current_month+"/"+current_date;
			
			if(next_month>=13)
			{
				next_month=1;
			}
			var next_next_month = 0;
			if(current_date>20)
			{
				 next_next_month = next_month+1;
			}
			if(next_next_month>=13)
			{
				next_next_month=1;
			}
			
			next_month = intToString(next_month.toString()); 
			next_next_month = intToString(next_next_month.toString()); 
			
			FB.api({
                        method: 'fql.query',
                        query: "SELECT uid ,name, birthday_date FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1 = me()) AND strlen(birthday_date) != 0 AND ((substr(birthday_date, 0, 2) =\"" + current_month+"\" AND substr(birthday_date, 3, 5) >=\""+ current_date+"\") OR (substr(birthday_date, 0, 2) =\""+ next_month+"\") OR (substr(birthday_date, 0, 2) =\""+ next_next_month+"\")) ORDER BY birthday_date"
                   },
            function(response) {
                //alert(JSON.stringify(response));
                for(var obj in response)
			    {
			        //TODO use jquery
					response[obj].id = response[obj].uid;	
			        var frameDiv = document.createElement("div");
					frameDiv.setAttribute("class",'fb-friend-frame');
					
					//if birthday today
					if(response[obj].birthday_date.substr( 0, 5) == today) 
					{
						var cakeDiv = document.createElement("div");
						cakeDiv.setAttribute("class",'cake');
						frameDiv.appendChild(cakeDiv);
					}
					
					var calendarDiv = document.createElement("div");
					calendarDiv.setAttribute("class",'calendar');
					calendarDiv.innerHTML = response[obj].birthday_date.substr( 3, 2);
					
					var newDiv = document.createElement("div");
					newDiv.setAttribute("class",'fb-friend-photo');
					newDiv.setAttribute("id",response[obj].uid);
					newDiv.setAttribute("onmouseover",'renderphoto("'+response[obj].id+'")');
					newDiv.innerHTML = "<img width='104' height='140' border=\"0\" src=\"<?php echo Yii::app()->request->baseUrl.'/images/fb-friend-04.jpg';?>\"></img>";
					
					var nameDiv = document.createElement("div");
					nameDiv.setAttribute("class",'fb-friend-name');
					nameDiv.innerHTML = response[obj].name;
					
					frameDiv.appendChild(calendarDiv);
					frameDiv.appendChild(newDiv);
					frameDiv.appendChild(nameDiv);
					
					var birthday_month=response[obj].birthday_date.substr( 0, 2);
					
					/*
					if(birthday_month == current_month || (current_date > 20 && birthday_month==next_month))
					{
						document.getElementById('tab1_content').appendChild(frameDiv);
					}*/
                    if(birthday_month == current_month)
					{
						document.getElementById('tab1_content').appendChild(frameDiv);
					}
                    else if (current_date > 20 && birthday_month==next_month)
                    {
                       /* $("#horizontal_line").show();*/
                        document.getElementById('birthday_next_month').appendChild(frameDiv);
					}
					else
					{
						document.getElementById('tab2_content').appendChild(frameDiv);
					}
				}
			    fetchphotos(response);   
			
				});
		  }
         
				  
		function searchFriends(str)
		{
            if(str=="Search friends")
                str="";
            if(str.length>0)
            {
                var searchQuery="SELECT uid,name,pic FROM user WHERE uid IN (SELECT uid2 FROM friend WHERE uid1=me() ) AND strpos(lower(name),lower(\""+str+"\")) >=0 ORDER BY name";
            }
            else
            {
                $(".tabbedPanelContents").show();
                $(".tabbedPanels li").removeClass("selected")
                $("#birthday_this_month_tab").addClass("selected");
                $("#tab1_content").show();
                $("#birthday_next_month").show();
                $("#tab2_content").hide();
                $("#tab3_content").hide();
                return false;
            }
			FB.api({
                        method: 'fql.query',
                        query: searchQuery
                   },
            function(response) {
                        //alert(JSON.stringify(response));
					
						$(".tabbedPanelContents").hide()
                        $(".tabbedPanels li").removeClass("selected")
						$("#tab3_content").show();
						document.getElementById('tab3_content').innerHTML = "";

						for(var obj in response)
                     {

			        //TODO use jquery
			        var frameDiv = document.createElement("div");
					frameDiv.setAttribute("class",'fb-friend-frame');
					
					response[obj].id = response[obj].uid;					
					var newDiv = document.createElement("div");
					newDiv.setAttribute("class",'fb-friend-photo');
					newDiv.setAttribute("id",response[obj].uid);
                    newDiv.innerHTML = "<img width='104' height='140' border=\"0\" src=\"<?php echo Yii::app()->request->baseUrl.'/images/fb-friend-pic.gif';?>\"></img>";
					//newDiv.setAttribute("onclick",'renderphoto("'+response.data[obj].id+'")');
					
					var nameDiv = document.createElement("div");
					nameDiv.setAttribute("class",'fb-friend-name');
					nameDiv.innerHTML = response[obj].name;
					
					
					frameDiv.appendChild(newDiv);
					frameDiv.appendChild(nameDiv);
					document.getElementById('tab3_content').appendChild(frameDiv);
			        
					
				}   
				 //alert(JSON.stringify(response));
			     fetchphotos(response);
				});
		}
		
		function fetchphotos(results)
		{
			for(var obj in results)
			{
				var id = results[obj].id;
				fetchphoto(id);
			}
		}
		
		function fetchphoto(id)
		{
				var elem = document.getElementById(id);
                var img_src="https://graph.facebook.com/"+id+"/picture?width=104&height=140";
				elem.innerHTML = "<a href='"+ "<?php echo Yii::app()->createUrl('product/index',array('id'=>'')); ?>/" +id+"'><img  width='104' height='140' id=\""+id+ "\" border=\"0\" src='"+img_src+"'></img>";
		}
		
		function renderphoto(id)
		{
  			var imgDiv=document.getElementById(id);
			document.getElementById('fb-friend-pic').src = imgDiv.childNodes[0].childNodes[0].src;
		}
		function intToString(str)
		{
			if(str.length==1)
				str="0"+str ;
			return str;
		}
		$(document).ready(function(){
            
            $(".logo").click(function(e){
                window.location.replace("<?php echo Yii::app()->request->baseUrl; ?>");
            });
            
			$("#search").keyup(function(event) {
				//alert("Handler for .click() called." + $('#search').val());
				searchFriends($('#search').val());
			});

            $('#search').bind('keypress', function(e) {
                    if(e.keyCode==13)
                    {
                        e.preventDefault();
                        searchFriends($('#search').val());
                    }
            });
			$("#search").each(function(){
				$(this).focus(function(){
					var curValue     = $.trim($(this).val());
					var defValue    = $.trim($(this).attr('default-value'));
					if(curValue == defValue){
					$(this).val("");
					}
				})
				$(this).blur(function(){
					var curValue     = $.trim($(this).val());
					var defValue    = $.trim($(this).attr('default-value'));
					if(curValue == ""){
						$(this).val(defValue);
					}
				})
			
			});
			$(".tabbedPanels li").click(function(){
				var contentID = $(this).attr("class")+"_content";
                var alreadySelected=contentID.indexOf("selected"); 
                if(alreadySelected>0)
                {    return false;  }
				$(".tabbedPanels li").removeClass("selected")
				$(this).addClass("selected");
				$(".tabbedPanelContents").hide();
                if(contentID=='tab1_content')
                {
                    $("#parent_div").show()
                    $("#birthday_next_month").show();
                }
                else if(contentID=='tab2_content')
                {
                    $("#parent_div").hide();
                }
				$("#"+contentID).show();
			});
			$(".logout").click(function(e){
			
			FB.logout(function(response) {
					// user is now logged out
					location = "<?php echo CController::createUrl('auth/logout',array('token'=>Yii::app()->getRequest()->getCsrfToken()))?>";
					});
					
			});
		});
</script>
   


</body>
</html>

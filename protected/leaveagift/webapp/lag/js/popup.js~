// JavaScript Document/***************************/
//@Author: Adrian "yEnS" Mato Gondelle
//@website: www.yensdesign.com
//@email: yensamg@gmail.com
//@license: Feel free to use it, but keep this credits please!					
/***************************/

//SETTING UP OUR POPUP
//0 means disabled; 1 means enabled;
var popupStatus = 0;

//loading popup with jQuery magic!
function loadPopup(message='Error message here'){
	//loads popup only if it is disabled
	if(popupStatus==0){
	   
	    //alert("ok");
	    $("#errormessage").html(message);
	    
	    document.getElementById("popupContact").style="display:block;";
	   /*var popupcontactdiv = document.createElement("div");
	   popupcontactdiv.setAttribute("id",'popupContact');
	   
	   var popupcloselink = document.createElement("a"); 
	   popupcloselink.setAttribute("id",'popupContactClose');
	   
	    var popupcloseimage = document.createElement("img"); 
	   popupcloseimage.setAttribute("src",'<?php echo Yii::app()->baseUrl; ?>/images/xross.png');
	   
	   popupcloselink.appendChild(popupcloseimage);

	   var h1 = document.createElement("h1");
	    h1.innerHTML="Sorry!";
	    
	   var contactArea = document.createElement("p");
	   contactArea.setAttribute("id",'contactArea');

	   var errormessage = document.createElement("div");
	   errormessage.setAttribute("id",'errormessage');
	   errormessage.innerHTML=message;
	   
	   contactArea.appendChild(errormessage); 
	   
	   
	 
	   popupcontactdiv.appendChild(popupcloselink); 
	   popupcontactdiv.appendChild(h1); 
	   popupcontactdiv.appendChild(contactArea);
	  
	    alert("ok");
	   document.getElementById("errorpopup").appendChild=popupcontactdiv;
	   alert("ok2");*/
	   //  document.write(popupcontactdiv+'<div id="backgroundPopup"></div>');
	    
	  /*  document.write('<div id="popupContact">
		<a id="popupContactClose"><img src="<?php echo Yii::app()->baseUrl; ?>/images/xross.png" alt="close" /></a>
                   <h1>Sorry!</h1>
		<p id="contactArea">
			<div id="errormessage">You can't upload free product more than 1 time.</div>
			
     	</p>
	</div>
<div id="backgroundPopup"></div>');
              */
	    
	    

		$("#backgroundPopup").css({
			"opacity": "0.7"
		});
		$("#backgroundPopup").fadeIn("slow");
		$("#popupContact").fadeIn("slow");
		popupStatus = 1;
	}
}

//disabling popup with jQuery magic!
function disablePopup(){
	//disables popup only if it is enabled
	if(popupStatus==1){
		$("#backgroundPopup").fadeOut("slow");
		$("#popupContact").fadeOut("slow");
		popupStatus = 0;
	}
}

//centering popup
function centerPopup(){
	//request data for centering
	var windowWidth = document.documentElement.clientWidth;
	var windowHeight = document.documentElement.clientHeight;
	var popupHeight = $("#popupContact").height();
	var popupWidth = $("#popupContact").width();
	//centering
	$("#popupContact").css({
		"position": "absolute",
		"top": windowHeight/2-popupHeight/2,
		"left": windowWidth/2-popupWidth/2
	});
	//only need force for IE6
	
	$("#backgroundPopup").css({
		"height": windowHeight
	});
	
	
}


//CONTROLLING EVENTS IN jQuery
$(document).ready(function(){
	
	//LOADING POPUP
	//Click the button event!
	$("#button").click(function(){
		//centering with css
		centerPopup();
		//load popup
		loadPopup();
	});
				
	//CLOSING POPUP
	//Click the x event!
	$("#popupContactClose").click(function(){
		disablePopup();
	});
	//Click out event!
	$("#backgroundPopup").click(function(){
		disablePopup();
	});
	//Press Escape event!
	$(document).keypress(function(e){
		if(e.keyCode==27 && popupStatus==1){
			disablePopup();
		}
	});

});
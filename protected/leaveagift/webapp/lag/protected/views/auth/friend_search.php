<?php
/* @var $this FriendSearchController */
/* @var $model FriendSearch */
/* @var $form CActiveForm */
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
                                    

<div class="form">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'friend-search-friend_search-form',
	'enableAjaxValidation'=>false,
	'htmlOptions'=>array(
                               'onsubmit'=>"return false;",/* Disable normal form submit */
                               'onkeypress'=>" if(event.keyCode == 13){ search(); } " /* Do ajax call when user presses enter key */
                             ),
)); ?>

	<!--<p class="note">Fields with <span class="required">*</span> are required.</p> -->

	<?php //echo $form->errorSummary($model); ?>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>

	     <td align="right">
	 	
	        	<?php echo $form->textField($model,'search_term',array('class'=>'textbox-Search','size'=>'20','placeholder'=>'Search Friends','onfocus'=>"this.placeholder = ''",'onblur'=>"this.placeholder = 'Search Friends'")); ?>
	
	     </td>

             <td>
	
		       <?php echo CHtml::Button('',array('class'=>'friendsearch_btn','onclick'=>'search();')); ?>
	     </td>
	     
	   </tr>
	</table>   

<?php $this->endWidget(); ?>

</div><!-- form -->

<script type="text/javascript">
 
function search()
 {
 
   
   Loading.show();			
 
 //  alert("ok");
   //return;
   var data=$("#friend-search-friend_search-form").serialize();
 
 
  $.ajax({
   type: 'POST',
    url: '<?php echo Yii::app()->createAbsoluteUrl("auth/search"); ?>',
   data:data,
success:function(data){

          // alert(data);
            //return;
             /*
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
			*/
			
			$(".tabbedPanelContents").hide()
                        $(".tabbedPanels li").removeClass("selected")
						$("#tab3_content").show();
						document.getElementById('tab3_content').innerHTML = "";
			


                var response = eval('(' +data+ ')');
                
                                  
                                       
                


                  //return;
                Loading.hide();	
                  
                 if(response.length==0)
                 {
                  centerPopup();
                  loadPopup("We couldnt able to find your friends.");
                 } 
                
                for(var obj in response)
			    {//alert(response[obj].name);
			      //TODO use jquery
			        var frameDiv = document.createElement("div");
					frameDiv.setAttribute("class",'fb-friend-frame');
					
					response[obj].id = response[obj].uid;	
                                             // alert(response[obj].birth_date);
                                       //printObject(response[obj]);
                                        
					var id=response[obj].uid;	  
                                       
				      if(response[obj].birthday_date!=null)
				        {
				          var birth_date=response[obj].birthday_date.replace(/\//g,"-"); 
				        }
				       else
				        {
				          var date = new Date(); 
                                         var curr_date = date.getDate();
					  var curr_month = date.getMonth();
					  var curr_year = date.getFullYear();
					  var birth_date=curr_date+"-"+curr_month+"-"+curr_year;
				        
				        }
					var name=response[obj].first_name;
				
					var newDiv = document.createElement("div");
					newDiv.setAttribute("class",'fb-friend-photo');
					newDiv.setAttribute("id",response[obj].uid);
                    /*newDiv.innerHTML = "<img width='140' height='140' border=\"0\" src=\"/images/fb-friend-pic.gif\"></img>";*/
                               //newDiv.innerHTML = "<a href='javascript:return;' onclick='sendtosession("+id+");' ><img width='140' height='140' border=\"0\" src='https://graph.facebook.com/"+response[obj].uid+"/picture?width=140&height=140' ></img></a>";
                                  newDiv.innerHTML = "<a href='"+ "<?php echo Yii::app()->createUrl('product/setdetails',array('id'=>'')); ?>/" +id+"_"+birth_date+"_"+name+"' ><img width='140' height='140' border=\"0\" src='https://graph.facebook.com/"+response[obj].uid+"/picture?width=140&height=140' ></img></a>";
                                      
                                       newDiv.setAttribute("onmouseover",'renderphoto("'+response[obj].uid+'")');
				
					
					var nameDiv = document.createElement("div");
					nameDiv.setAttribute("class",'fb-friend-name');
					nameDiv.innerHTML = response[obj].name;
					
					
					frameDiv.appendChild(newDiv);
					frameDiv.appendChild(nameDiv);
					document.getElementById('tab3_content').appendChild(frameDiv);
			    
                          }//end for
                
              },
   error: function(data) { // if error occured
         alert("Error occured.please try again");
         alert(data);
    },
 
  dataType:'html'
  });
 
}

function sendtosession(id)
{
	// var data=id;
	Loading.show();
	$.ajax({
	type: 'POST',
	  url: '<?php echo Yii::app()->createAbsoluteUrl("auth/setsession"); ?>',
	data:'id='+id,
	success:function(data){
			      window.location="<?php echo Yii::app()->createAbsoluteUrl("product/index"); ?>";
			      //alert(data);
				},
	error: function(data) { // if error occured
	      alert("Error occured.please try again");
	      alert(data);
	  },
	  dataType:'html',
	      });
}
 
</script>


<style type="text/css">
 .friendsearch_btn {
  background:url('<?php echo Yii::app()->request->baseUrl."/images/search_btn.png"; ?>');
    width:75px;
  height:28px;
  /*cursor:pointer;
  border:0px;
  border-radius: 10px;
  */
  }
  
  

</style>



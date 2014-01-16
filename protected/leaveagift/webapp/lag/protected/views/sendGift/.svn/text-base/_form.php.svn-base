<?php
/* @var $this SendGiftFormController */
/* @var $model SendGiftForm */
/* @var $form CActiveForm */

  $session=new CHttpSession;
   $session->open();
?>
<div id="form-gift">

<?php $form=$this->beginWidget('CActiveForm', array(
	'id'=>'send-gift-form-_form-form',
	'enableAjaxValidation'=>false,

)); ?>

	<p class="note">Fields with <span class="required">*</span> are required.</p>

	<?php echo $form->errorSummary($model); ?>
        <div class="form-row"><h1>1. When do you want to leave your gift?</h1></div>

        <div class="form-row">
           <h2>
		<?php echo $form->labelEx($model,'delivery'); ?>
                <?php
               
                  $this->widget('zii.widgets.jui.CJuiDatePicker', array(
                  'model'=>$model,
                  'name'=>'delivery',
                  'attribute'=>'delivery', 
                 // 'themeUrl'=>Yii::app()->basePath."/assets/jqueryuithemes/jquery-ui-1.9.0.custom/development-bundle/themes/base",
                 // 'themeUrl'=>"css/jqueryui",
                  'theme'=>'south-street',
                   
                   
                 // additional javascript options for the date picker plugin
                  'options'=>array(
                                // 'direction'=> 'horizontal',
                                   
                                  
                                // 'autoSize'=>true, 
                                    'minDate'=>0,
                                 // 'minDate'=>($days+1),
                                     'maxDate'=>90,
                                    'showAnim'=>'fold',
                                  'dateFormat'=>'M/dd/yy',  
                                   /*'change'=>'js:function(){
                                       alert("ok");
                                        }',*/  
                                   
                                  ),
                  'htmlOptions'=>array(
                      
                    
                  'class'=>'textbox',
                     // 'style'=>'font-size:10px;',

                 
                    ),
                   ));
                   echo " *<span id='date_msg'> ".$date_message."</span>";
                
                 ?>
               <?php echo $form->error($model,'start_date'); ?>
          </h2>
	</div>  
	 <script>

	   $(document).ready(function(){
	   
	    $('#delivery').bind('change',function(){

               //alert("ok");
                var date=$('#delivery').val();
                
                 if(date=="")
                 { 
                   centerPopup();
                   loadPopup("deliver date cannot be blank.");
                 
                 }
                
                if(!validateDate(date))
                {
           
                  centerPopup();
                  loadPopup("Invalid date format.Please Input in (M/dd/yyyy) format!");
                }
                
               var currentDate=new Date();
               var delivery_date=date.substr(4,2);
               var delivery_month=date.substr(0,3);
               
              // alert(date);
               
             //  alert("current date:"+currentDate.getDate()+"\n Current month:"+currentDate.getMonth());
               
               //alert("deliver date:"+delivery_date+"\n Deliver month:"+delivery_month);
               
     
		var month=new Array();
		month[0]="Jan";
		month[1]="Feb";
		month[2]="Mar";
		month[3]="Apr";
		month[4]="May";
		month[5]="Jun";
		month[6]="Jul";
		month[7]="Aug";
		month[8]="Sep";
		month[9]="Oct";
		month[10]="Nov";
		month[11]="Dec";
var m = month[currentDate.getMonth()]; 

                  // alert("d:"+currentDate.getDate()+"\n d:"+delivery_date+"\nm:"+delivery_month+"\nm"+m)  
                  var birthdate="<?php echo substr($session['selected-userbirthday'],0,2); ?>";
                   var birthmonth="<?php echo substr($session['selected-userbirthday'],3,2); ?>";
                  
                 //  var mi=birthmonth
                 // alert("d:"+birthdate+"\nm:"+birthmonth+"\nm2:"+delivery_month+"\nm2:"+month[birthmonth-1]);
                  
                  if(delivery_date==13&&delivery_month=="Nov")
                  {
                    $("#date_msg").html("diwali");
                  
                  }
                  else if(birthdate==delivery_date&&month[birthmonth-1]==delivery_month)
                  {
                   
                   $("#date_msg").html("birthday");
                  }
                  else if((currentDate.getDate()==delivery_date)&&(delivery_month==m))
                   {
                     //alert("coooooool");
                      $("#date_msg").html("today");
                   }
                   
                 
               /*
                if(currentDate.getDate()==)
                 {
                  $("#date_msg").val("today");
                 }
                */
                //alert(date);
                
               
              

             });
	   
	   
	    });
	    
	    function validateDate(date) 
	    {
	       /*
	         var delivery_date=date.substr(4,2);
                 var delivery_month=date.substr(0,3);
                 var delivery_year=date.substr(7,4);
                 */
                 var delivery=date.split("/"); 
                 
                 // alert("m:"+delivery[0]+"\nd:"+delivery[1]+"\ny:"+delivery[2]);
                  var delivery_month=delivery[0];
                  var delivery_date=delivery[1];
                  var delivery_year=delivery[2];
                 
                 // alert("ok");
                if(delivery_date===""||delivery_month===""||delivery_year==="")
                 {
                  // alert("ok");
                   return(false);
                 }
                 //alert("fine");
                 if(delivery_date.length!=2||delivery_month.length!=3||delivery_year.length!=4)
                {
                 return(false);
                }
                
                var month=new Array();
		month[0]="Jan";
		month[1]="Feb";
		month[2]="Mar";
		month[3]="Apr";
		month[4]="May";
		month[5]="Jun";
		month[6]="Jul";
		month[7]="Aug";
		month[8]="Sep";
		month[9]="Oct";
		month[10]="Nov";
		month[11]="Dec";
		
      
                
                if(delivery_date>31||month.indexOf(delivery_month)==-1)
                {
                  return(false);
                }
                
                //alert("cooool");
                
                return(true);
                 
               
	     /* var pattern = /^\d{1,2}\/\d{1,2}\/\d{4}$/;   //defining pattern for date
	      if (pattern.test(date))
	       {
		 // alert("Entered date : "+date);
		  return true;
	       } 
		  //alert("Invalid date format.Please Input in (dd/mm/yyyy) format!");
		  return false;*/

            }
            
           


	 </script>

        <div class="form-row">
         <h1>2. Your gift will be posted on your friend's wall.</h1>
        </div> 
        

	<div class="form-row">
	    <h2><?php echo $form->labelEx($model,'wall_post_message'); ?><br/>
		<?php echo $form->textArea($model,'wall_post_message',array('cols'=>'50','rows'=>'6','size'=>45,'maxlength'=>'100','class'=>"textbox")); ?></h2>
		<?php //echo $form->error($model,'wall_post_message'); ?>
	</div>
        <div class="form-row">
            <h2><?php echo $form->labelEx($model,'friends_email'); ?></h2>
	    <h2><?php echo $form->textField($model,'friends_email',array('class'=>'textbox','size'=>'45','maxlength'=>'100','onchange'=>'validateForm(this.value)')); ?></h2>
		<?php //echo $form->error($model,'friends_email'); ?>
	</div>
        <div class="form-row">
        <h1>3. How should we notify you of delivery?</h1>
        </div>
        <div class="form-row">
		<?php echo $form->hiddenField($model,'pid'); ?>
	</div> 
        <div class="form-row">    
		<h2><?php echo $form->textField($model,'notification_email',array('class'=>'textbox','size'=>'45','maxlength'=>'100','onchange'=>'validateForm(this.value)')); ?></h2>
		<?php echo $form->error($model,'notification_email'); ?>
	
	     <h2><?php echo CHtml::submitButton('',array('class'=>'sendgift_btn')); ?></h2>
	</div>

<?php $this->endWidget(); ?>

</div><!-- form -->
 <style type="text/css">
 .sendgift_btn {
  background:url('<?php echo Yii::app()->request->baseUrl."/images/btn-deliver-gift.jpg"; ?>');
    width:240px;
  height:56px;
  cursor:pointer;
  border-radius: 15px;
  }

</style>
<script>
function validateForm(x)
{

var atpos=x.indexOf("@");
var dotpos=x.lastIndexOf(".");
if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length)
  {
   //alert("Not a valid e-mail address");
   centerPopup();
   loadPopup("The email address you entered is not a valid e-mail address.");
  return false;
  }
}
</script>
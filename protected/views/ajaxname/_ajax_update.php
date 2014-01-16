<div id="ajaxname-update-modal-container" >

</div>

<script type="text/javascript">
function update()
 {
  
   var data=$("#ajaxname-update-form").serialize();

  $.ajax({
   type: 'POST',
    url: '<?php echo Yii::app()->createAbsoluteUrl("ajaxname/update"); ?>',
   data:data,
success:function(data){
                if(data!="false")
                 {
                  $('#ajaxname-update-modal').modal('hide');
                  renderView(data);
                  $.fn.yiiGridView.update('ajaxname-grid', {
                     
                         });
                 }
                 
              },
   error: function(data) { // if error occured
          alert(JSON.stringify(data)); 

    },

  dataType:'html'
  });

}

function renderUpdateForm(id)
{
 
   $('#ajaxname-view-modal').modal('hide');
 var data="id="+id;

  $.ajax({
   type: 'POST',
    url: '<?php echo Yii::app()->createAbsoluteUrl("ajaxname/update"); ?>',
   data:data,
success:function(data){
                 // alert("succes:"+data); 
                 $('#ajaxname-update-modal-container').html(data); 
                 $('#ajaxname-update-modal').modal('show');
              },
   error: function(data) { // if error occured
           alert(JSON.stringify(data)); 
         alert("Error occured.please try again");
    },

  dataType:'html'
  });

}
</script>

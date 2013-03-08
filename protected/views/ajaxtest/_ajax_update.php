<div id="ajaxtest-update-modal-container" >

</div>

<script type="text/javascript">
function update()
 {
  
   var data=$("#ajaxtest-update-form").serialize();

  $.ajax({
   type: 'POST',
    url: '<?php echo Yii::app()->createAbsoluteUrl("ajaxtest/update"); ?>',
   data:data,
success:function(data){
                if(data!="false")
                 {
                  $('#ajaxtest-update-modal').modal('hide');
                  renderView(data);
                  $.fn.yiiGridView.update('ajaxtest-grid', {
                     
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
 
   $('#ajaxtest-view-modal').modal('hide');
 var data="id="+id;

  $.ajax({
   type: 'POST',
    url: '<?php echo Yii::app()->createAbsoluteUrl("ajaxtest/update"); ?>',
   data:data,
success:function(data){
                 // alert("succes:"+data); 
                 $('#ajaxtest-update-modal-container').html(data); 
                 $('#ajaxtest-update-modal').modal('show');
              },
   error: function(data) { // if error occured
           alert(JSON.stringify(data)); 
         alert("Error occured.please try again");
    },

  dataType:'html'
  });

}
</script>

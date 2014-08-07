<div id="article-update-modal-container" >

</div>

<script type="text/javascript">
function update()
 {
  
   var data=$("#article-update-form").serialize();

  jQuery.ajax({
   type: 'POST',
    url: '<?php echo Yii::app()->createAbsoluteUrl("article/update"); ?>',
   data:data,
success:function(data){
                if(data!="false")
                 {
                  $('#article-update-modal').modal('hide');
                  renderView(data);
                  $.fn.yiiGridView.update('article-grid', {
                     
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
 
   $('#article-view-modal').modal('hide');
 var data="id="+id;

  jQuery.ajax({
   type: 'POST',
    url: '<?php echo Yii::app()->createAbsoluteUrl("article/update"); ?>',
   data:data,
success:function(data){
                 // alert("succes:"+data); 
                 $('#article-update-modal-container').html(data); 
                 $('#article-update-modal').modal('show');
              },
   error: function(data) { // if error occured
           alert(JSON.stringify(data)); 
         alert("Error occured.please try again");
    },

  dataType:'html'
  });

}
</script>

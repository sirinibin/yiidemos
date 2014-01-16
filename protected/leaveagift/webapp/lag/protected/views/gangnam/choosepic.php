<?php
 $session=new CHttpSession;
   $session->open();
?>
<div id="content">
<h2>Choose <?php echo $session['me']['first_name']; ?>'s pic</h2>

<?php

$i=1;
echo "<table cellpadding='10' border='2'  >";
 echo "<tr>";
foreach($albums as $key=>$pic)
  {

  
     echo '<td>
      <div style="width:80px;height:120px;overflow:hidden;">
      <img src="'.$pic["src_big"].'" width="80"  onclick="changeimage(this.src);" style="cursor:pointer;"  >
      </div>
       
      ';
  
  
    if($i==4)
     {
      $i=0;
      echo "<tr>";
     }
     
     $i++;
  
  }

    echo "</table>";
?>

<div id="selected_pic" style="position:absolute;left:540px;top:220px;">
<?php echo "<img src='".$albums[0]["src_big"]."' width='300'>"; ?>
</div>
</div>
<script>
function changeimage(url)
{
 $("#selected_pic").html("<img src='"+url+"' width='300'>");
 //alert(url);
}
</script>
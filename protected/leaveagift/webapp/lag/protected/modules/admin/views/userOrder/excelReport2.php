<?php if ($orders !== null):?>
<table border="1">

	<tr>
	       <th width="80px">
		      date		</th>
		<th width="80px">
		      id_user_gift		</th>
 		
 		<th width="80px">
		      product		</th>
 		<th width="80px">
		      Sender		</th>
 		
 		<th width="80px">
		      Receiver		</th>
 		<th width="80px">
		      receiver_fbemail		</th>
 		<th width="80px">
		      notify_email		</th>
 	
 	
 		<th width="80px">
		      title		</th>
 		<th width="80px">
		      delivery_date		</th>
 		
 		<th width="80px">
		      is return gift?		</th>
 	
 		<th width="80px">
		      date_upd		</th>
 	</tr>
	<?php foreach($orders as $row): ?>
	<tr>
	         <td>
			<?php if(isset($row->date_add)){ echo $row->date_add;} else echo "";  ?>
		</td>
        	<td>
			<?php if(isset($row->id_user_gift)){ echo $row->id_user_gift;} else echo ""; ?>
		</td>
  
       		<td>
			<?php if(isset($row->product->tags[0]->name)) echo $row->product->tags[0]->name; else echo "----"; ?>
		</td>
       		<td>
			<?php if(isset($row->sender->name)){ echo $row->sender->name;} else echo ""; ?>
		</td>
       		<td>
			<?php if(isset($row->receiver_fbfirstname)){ echo $row->receiver_fbfirstname;} else echo ""; ?>
		</td>
       		<td>
			<?php if(isset($row->receiver_fbemail)){ echo $row->receiver_fbemail; } else echo ""; ?>
		</td>
       		<td>
			<?php if(isset($row->notify_email)){ echo $row->notify_email; } else echo ""; ?>
		</td>
       		<td>
			<?php if(isset($row->title)){ echo $row->title; } else echo ""; ?>
		</td>
       		<td>
			<?php  echo $row->getDeliveryDate(); ?>
		</td>
       		
       		<td>
			<?php if(isset($row->thankyouid)) echo "YES"; else echo "NO"; ?>
		</td>
       	
       		<td>
			<?php if(isset($row->date_upd)){ echo $row->date_upd; } else echo ""; ?>
		</td>
       	</tr>
     <?php endforeach; ?>
</table>
<?php endif; ?>

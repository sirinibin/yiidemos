<?php if ($model !== null):?>
<table border="1">

	<tr>
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
		      message_card		</th>
 		<th width="80px">
		      message_post		</th>
 		<th width="80px">
		      title		</th>
 		<th width="80px">
		      delivery_date		</th>
 		
 		<th width="80px">
		      is return gift?		</th>
 		<th width="80px">
		      date_add		</th>
 		<th width="80px">
		      date_upd		</th>
 	</tr>
	<?php foreach($model as $row): ?>
	<tr>
        		<td>
			<?php echo $row->id_user_gift; ?>
		</td>
  
       		<td>
			<?php if(isset($row->product->tags[0]->name)) echo $row->product->tags[0]->name; else echo "----"; ?>
		</td>
       		<td>
			<?php echo $row->sender->name; ?>
		</td>
       		<td>
			<?php echo $row->receiver_fbfirstname; ?>
		</td>
       		<td>
			<?php echo $row->receiver_fbemail; ?>
		</td>
       		<td>
			<?php echo $row->notify_email; ?>
		</td>
       		
       		<td>
			<?php echo $row->message_card; ?>
		</td>
       		<td>
			<?php echo $row->message_post; ?>
		</td>
       		<td>
			<?php echo $row->title; ?>
		</td>
       		<td>
			<?php echo $row->delivery_date; ?>
		</td>
       		
       		<td>
			<?php if(isset($row->thankyouid)) echo "YES"; else echo "NO"; ?>
		</td>
       		<td>
			<?php echo $row->date_add; ?>
		</td>
       		<td>
			<?php echo $row->date_upd; ?>
		</td>
       	</tr>
     <?php endforeach; ?>
</table>
<?php endif; ?>

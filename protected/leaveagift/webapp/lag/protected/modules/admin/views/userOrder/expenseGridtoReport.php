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
		      receiver_fbfirstname		</th>
 		<th width="80px">
		      receiver_fbemail		</th>
 		<th width="80px">
		      notify_email		</th>
 		<th width="80px">
		      img_url		</th>
 		<th width="80px">
		      message_card		</th>
 		<th width="80px">
		      message_post		</th>
 		<th width="80px">
		      title		</th>
 		<th width="80px">
		      delivery_date		</th>
 		<th width="80px">
		      greeting		</th>
 		<th width="80px">
		      gift_opened		</th>
 		<th width="80px">
		      gift_rating		</th>
 		<th width="80px">
		      facebook_postid		</th>
 		<th width="80px">
		      post_email_status		</th>
 		<th width="80px">
		      thankyouid		</th>
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
			<?php echo $row->id_cart; ?>
		</td>
       		<td>
			<?php echo $row->id_product; ?>
		</td>
       		<td>
			<?php echo $row->id_user; ?>
		</td>
       		<td>
			<?php echo $row->receiver_fbid; ?>
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
			<?php echo $row->img_url; ?>
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
			<?php echo $row->greeting; ?>
		</td>
       		<td>
			<?php echo $row->gift_opened; ?>
		</td>
       		<td>
			<?php echo $row->gift_rating; ?>
		</td>
       		<td>
			<?php echo $row->facebook_postid; ?>
		</td>
       		<td>
			<?php echo $row->post_email_status; ?>
		</td>
       		<td>
			<?php echo $row->thankyouid; ?>
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

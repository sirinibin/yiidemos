<?php if ($model !== null):?>
<table border="1">

	<tr>
		<th width="80px">
		      id		</th>
 		<th width="80px">
		      voucher_code		</th>
 		<th width="80px">
		      id_product		</th>
 		<th width="80px">
		      value		</th>
 		<th width="80px">
		      validity		</th>
 		<th width="80px">
		      status		</th>
 		<th width="80px">
		      timestamp		</th>
 	</tr>
	<?php foreach($model as $row): ?>
	<tr>
        		<td>
			<?php echo $row->id; ?>
		</td>
       		<td>
			<?php echo $row->voucher_code; ?>
		</td>
       		<td>
			<?php echo $row->id_product; ?>
		</td>
       		<td>
			<?php echo $row->value; ?>
		</td>
       		<td>
			<?php echo $row->validity; ?>
		</td>
       		<td>
			<?php echo $row->status; ?>
		</td>
       		<td>
			<?php echo $row->timestamp; ?>
		</td>
       	</tr>
     <?php endforeach; ?>
</table>
<?php endif; ?>

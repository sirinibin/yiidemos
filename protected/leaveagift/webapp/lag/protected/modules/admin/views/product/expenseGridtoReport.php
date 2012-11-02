<?php if ($model !== null):?>
<table border="1">

	<tr>
		<th width="80px">
		      id_product		</th>
 		<th width="80px">
		      supplier		</th>
 		<th width="80px">
		      quantity		</th>
 		
 		<th width="80px">
		      price		</th>
 		
 		<th width="80px">
		      date_add		</th>
 		<th width="80px">
		      date_upd		</th>
 	</tr>
	<?php foreach($model as $row): ?>
	<tr>
        		<td>
			<?php echo $row->id_product; ?>
		</td>
       		<td>
			<?php echo $row->supplier->name; ?>
		</td>
       		<td>
			<?php echo $row->quantity; ?>
		</td>
       		
       		<td>
			<?php echo $row->price; ?>
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

<?php if ($model !== null):?>
<table border="1">

	<tr>
		<th width="80px">
		      id_template		</th>
 		<th width="80px">
		      id_tag		</th>
 		<th width="80px">
		      id_supplier		</th>
 		<th width="80px">
		      id_brand		</th>
 		<th width="80px">
		      id_category		</th>
 		<th width="80px">
		      logo_choice		</th>
 		<th width="80px">
		      is_return_gift		</th>
 		<th width="80px">
		      description		</th>
 		<th width="80px">
		      features		</th>
 		<th width="80px">
		      event		</th>
 		<th width="80px">
		      date_add		</th>
 		<th width="80px">
		      date_upd		</th>
 	</tr>
	<?php foreach($model as $row): ?>
	<tr>
        		<td>
			<?php echo $row->id_template; ?>
		</td>
       		<td>
			<?php echo $row->id_tag; ?>
		</td>
       		<td>
			<?php echo $row->id_supplier; ?>
		</td>
       		<td>
			<?php echo $row->id_brand; ?>
		</td>
       		<td>
			<?php echo $row->id_category; ?>
		</td>
       		<td>
			<?php echo $row->logo_choice; ?>
		</td>
       		<td>
			<?php echo $row->is_return_gift; ?>
		</td>
       		<td>
			<?php echo $row->description; ?>
		</td>
       		<td>
			<?php echo $row->features; ?>
		</td>
       		<td>
			<?php echo $row->event; ?>
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

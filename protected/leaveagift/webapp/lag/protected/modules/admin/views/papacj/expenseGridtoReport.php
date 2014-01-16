<?php if ($model !== null):?>
<table border="1">

	<tr>
		<th width="80px">
		      id_papacj		</th>
 		<th width="80px">
		      id_user		</th>
 		<th width="80px">
		      date_add		</th>
 		<th width="80px">
		      date_upd		</th>
 	</tr>
	<?php foreach($model as $row): ?>
	<tr>
        		<td>
			<?php echo $row->id_papacj; ?>
		</td>
       		<td>
			<?php echo $row->id_user; ?>
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

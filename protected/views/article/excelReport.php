<?php if ($model !== null):?>
<table border="1">

	<tr>
		<th width="80px">
		      id		</th>
 		<th width="80px">
		      title		</th>
 		<th width="80px">
		      content		</th>
 		<th width="80px">
		      image		</th>
 		<th width="80px">
		      caption		</th>
 		<th width="80px">
		      author_name		</th>
 		<th width="80px">
		      author_email		</th>
 		<th width="80px">
		      author_twitter		</th>
 		<th width="80px">
		      link		</th>
 		<th width="80px">
		      createdAt		</th>
 	</tr>
	<?php foreach($model as $row): ?>
	<tr>
        		<td>
			<?php echo $row->id; ?>
		</td>
       		<td>
			<?php echo $row->title; ?>
		</td>
       		<td>
			<?php echo $row->content; ?>
		</td>
       		<td>
			<?php echo $row->image; ?>
		</td>
       		<td>
			<?php echo $row->caption; ?>
		</td>
       		<td>
			<?php echo $row->author_name; ?>
		</td>
       		<td>
			<?php echo $row->author_email; ?>
		</td>
       		<td>
			<?php echo $row->author_twitter; ?>
		</td>
       		<td>
			<?php echo $row->link; ?>
		</td>
       		<td>
			<?php echo $row->createdAt; ?>
		</td>
       	</tr>
     <?php endforeach; ?>
</table>
<?php endif; ?>

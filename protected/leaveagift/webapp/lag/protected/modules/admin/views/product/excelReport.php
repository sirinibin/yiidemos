<?php if ($model !== null):?>
<table border="1">

	<tr>
		<th width="80px">
		      type		</th>
 		<th width="80px">
		      supplier		</th>
               <th width="80px">
		      brand		</th>
 		<th width="80px">
		      quantity		</th>
                <th width="80px">
		      category		</th>
                 <th width="80px">
		      is_return_gift     </th>
 		<th width="80px">
		      price		</th>
               <th width="80px">
		      product value		</th>
               <th width="80px">
		      redeem_valid_days	</th>

               <th width="80px">
		      Minimum purchase amount	</th>
                
                <th width="80px">
		      features	        </th>
                 <th width="80px">
		      Description       </th> 
 		
 	</tr>
	<?php foreach($model as $row): ?>
	<tr>
        		<td>
			<?php if(isset($row->tags[0]->id_tag)){ echo $row->tags[0]->id_tag; } ?>
		</td>
       		<td>
			<?php echo $row->id_supplier; ?>
		</td>
                <td>
			<?php echo $row->id_brand; ?>
		</td>
       		<td>
			<?php echo $row->quantity; ?>
		</td>
                <td>
			<?php if(isset($row->categories[0]->id_category)){ echo $row->categories[0]->id_category; }; ?>
		</td>
               <td>
			<?php echo $row->is_return_gift; ?>
		</td>
       		<td>
			<?php echo $row->price; ?>
		</td>
                <td>
			<?php echo $row->product_value; ?>
		</td>
                 <td>
			<?php echo $row->redeem_valid_days; ?>
		</td>
                <td>
			<?php echo $row->min_purchase; ?>
		</td>
               
                <td>
			<?php echo $row->features; ?>
		</td>
                <td>
			<?php if(isset($row->product_lang->description)) { echo $row->product_lang->description; } ?>
		</td> 
       		
       	</tr>
     <?php endforeach; ?>
</table>
<?php endif; ?>

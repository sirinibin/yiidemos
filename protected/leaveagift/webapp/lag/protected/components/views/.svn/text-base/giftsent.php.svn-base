<?php

 $this->widget('zii.widgets.CListView', array(
	'dataProvider'=>$this->gifts,
	'itemView'=>'_giftsentView',
        'summaryText'=>'',
       // 'summaryText'=>'{start}-{end} of {count} Gifts',
        'emptyText'=>'Currently, you have no sent gifts,', 
        'template' => '{summary}{pager} {items}  {pager}',
        /* 'pager'=>array(
                           'header'=>'',
                               // 'header'=>'<h3>Profile List</h3>',//text before it
                                //'firstPageLabel'=>'First',//overwrite firstPage lable
                                //'lastPageLabel'=>'Last',//overwrite lastPage lable
                                //'nextPageLabel'=>'Next',//overwrite nextPage lable
                                //'prevPageLabel'=>null,//overwrite prePage lable
                         ),*/
           'pager'        => array(
                                'header'=>'',
                                'class'          => 'CLinkPager',
                                'firstPageLabel' => '<<',
                                //'prevPageLabel'  => '<',
                                //'nextPageLabel'  => '>',
                                'lastPageLabel'  => '>>',
                              ),
            


));

?>

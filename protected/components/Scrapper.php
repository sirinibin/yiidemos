<?php

class Scrapper extends CApplicationComponent
{

 public function storeLinks($links,$category,$store_name)
 { 
   $brand_name=$links['brand_name'];
   $parent_link=$links['parent_link'];
   
   $c=0;
   foreach($links as $k=>$l)
   {
      if($k=="parent_link"||$k=="brand_name")
       continue;
       
        
       

        $model=new Productlinks;
        $model->link=$l;
        
        if($store_name=="flipkart")
        {
          $url=parse_url($l);
          parse_str($url['query'],$url);
          $model->product_code=$url['pid'];
        }
        else if($store_name=="snapdeal")
        {
           $url=explode('/',$l);
           $pid=$url[5];
           $model->snap_deal_product_code=$pid;
          
        }
        
        $model->store_name=$store_name;
        $model->category_name=$category;
        $model->brand_name=$brand_name;
        $model->parent_link=$parent_link;
        $model->create_time=time();
        $model->update_time=time(); 
        
        if($model->save())
         {
          $c++;
         }
  
        
   
   }
   return($c);
      
 }
 

  public function addShopLinks($list_views,$category=null,$brand=null,$store_name=null)
  {
     foreach($list_views as $v)
      {
       $data=array(
                   'link'=>$v,
                   'brand'=>$brand,
                   'category'=>$category, 
                  );
	  $model=new Shoplinks;
	  $model->link=$data['link'];
	  $model->brand=$data['brand'];
	  $model->category=$data['category'];
	  $model->store_name=$store_name;
	  $model->store_id=1;
	  $model->create_time=time();
	  $model->update_time=time();
	  if($model->save())
	   {
	     echo "<br/><b>Saved</b>";
	   }
	   else
	   {
	     $e=$model->getErrors();
	     echo "<pre>";
	     print_r($e);
	     echo "</pre>";
	     
	   }
      }
      
     
  }
}
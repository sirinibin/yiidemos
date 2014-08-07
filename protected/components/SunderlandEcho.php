<?php

class SunderlandEcho extends CApplicationComponent
{
 
 public function storeProduct($data,$category)
 {

   if($category=="laptop")
    {
	  $product_info=array(
	  'title'=>isset($data['title'])?$data['title']:"",
	  'price'=>isset($data['price'])?$data['price']:"",
	  'cash_on_delivery'=>"yes",
	  'in_the_box_details'=>isset($data['sales_package'])?$data['sales_package']:"",
	  'model_name'=>isset($data['model_name'])?$data['model_name']:"",
	  'series_name'=>isset($data['series'])?$data['series']:"",
	  'color'=>isset($data['color'])?$data['color']:"",
	  'part_number'=>isset($data['part_number'])?$data['part_number']:"",
	  'model_id'=>isset($data['model_id'])?$data['model_id']:"",
	  'warranty'=>isset($data['warranty_summary'])?$data['warranty_summary']:"",
	  'brand_name'=>isset($data['brand'])?$data['brand']:"",
	  'category_name'=>$category,
	  'country_name'=>"India",
	  'product_code'=>isset($data['product_code'])?$data['product_code']:"",
	  'video_url'=>isset($data['video_url'])?$data['video_url']:"",
	  'star_rate'=>isset($data['star_rate'])?$data['star_rate']:"",
	  'lifestyle_name'=>isset($data['lifestyle'])?$data['lifestyle']:"",
	  'hardware_interface'=>isset($data['hardware_interface'])?$data['hardware_interface']:"",
	  'other_ports'=>isset($data['other_ports'])?$data['other_ports']:"",
	  'chipset'=>isset($data['chipset'])?$data['chipset']:"",
	  'system_architecture'=>isset($data['system_architecture'])?$data['system_architecture']:"",
	  
	  );
	  
    }
    else if($category=="mobile")
    {
       $product_info=array(
	  'title'=>isset($data['title'])?$data['title']:"",
	  'price'=>isset($data['price'])?$data['price']:"",
	  'cash_on_delivery'=>"yes",
	  'in_the_box_details'=>isset($data['sales_package'])?$data['sales_package']:"",
	 // 'model_name'=>isset($data['model_name'])?$data['model_name']:"",
	  'series_name'=>isset($data['series'])?$data['series']:"",
	  'color'=>isset($data['handset_color'])?$data['handset_color']:"",
	  'part_number'=>isset($data['part_number'])?$data['part_number']:"",
	  'model_id'=>isset($data['model_id'])?$data['model_id']:"",
	  'warranty'=>isset($data['warranty_summary'])?$data['warranty_summary']:"",
	  'brand_name'=>isset($data['brand'])?$data['brand']:"",
	  'category_name'=>$category,
	  'country_name'=>"India",
	  'product_code'=>isset($data['product_code'])?$data['product_code']:"",
	  'video_url'=>isset($data['video_url'])?$data['video_url']:"",
	  'star_rate'=>isset($data['star_rate'])?$data['star_rate']:"",
	  'lifestyle_name'=>isset($data['lifestyle'])?$data['lifestyle']:"",
	  'java'=>isset($data['java'])?$data['java']:"",
	  'sar_value'=>isset($data['sar_value'])?$data['sar_value']:"",
	  'hot_swap_support'=>isset($data['hot_swap_support'])?$data['hot_swap_support']:""
	  
	  );
      
    }
    $model=new Product;
    $model->attributes=$product_info;
    
    $filename=str_replace('/','_',$data['title'])."200x200_medium_0.jpeg";
    $filename=str_replace(' ',"_",$filename);
    
    $model->image=$filename;
    
    if($model->save())
     {
      /*
       echo "<pre>";
       print_r($data);
       echo "</pre>";
       echo "<pre>";
       print_r($model->attributes);
       echo "</pre>";
       */
        echo "<li>".$data['title']."-<b>Saved</b></li>";
              
	    if($category=="laptop")
	    {
	      if($model->saveLaptopFeatures($data))
	      {
	        $model->associateWithStore($data,"flipkart");
	        $model->saveImages($data);
	        $model->ready_to_export=1;
	        $model->save(false);
	      }
	      else
	      {
	       echo "Err-saving Laptop features.";
	       
	      }
	    }
	    else if($category=="mobile")
	    {
	      if($model->saveMobileFeatures($data))
	      { 
	         $model->associateWithStore($data,"flipkart");
	         $model->saveImages($data);
	         $model->ready_to_export=1;
	         $model->save(false);
	      
	      }
	      else
	      {
	        echo "Err-saving Mobile features.";
	      }
	    }
	    
	  /*
	  echo "<pre>";
       print_r($model->attributes);
       echo "</pre>";
       */
	    /*
	    if(!$model->saveImages($data))
	    {
	      return(false);
	    }
	    */
	     
	   
     }
     else
     { 
       Yii::app()->db->createCommand("update product set price='".$data['price']."' where product_code='".$data['product_code']."' ")->execute();
       echo "ERR-SAVING product";
       $e=$model->getErrors();
      
       echo "<pre>";
       print_r($e);
       echo "</pre>";
       return(false);
     
     }
     
     flush();
     
     return(true);
    
 } 
 public function getProductInfo($l)
 {       
      /*
       Image Url's:
	      list view:http://img6a.flixcart.com/image/computer/m/h/8/lenovo-ideapad-notebook-125x125-imadd4f7jrzuchmg.jpeg
	      thumbnail:http://img6a.flixcart.com/image/computer/m/h/8/lenovo-ideapad-notebook-400x400-imadd4f7jrzuchmg.jpeg
	small thumbnail:http://img6a.flixcart.com/image/computer/m/h/8/lenovo-ideapad-notebook-100x100-imadd4f7jrzuchmg.jpeg
	 Available dimensions: 
	  100X100
	  125X125
	  200X200
	  400X400
      */

      echo "<h5>Link:".$l->link."</h5>";
      
      
      $ch = curl_init($l->link);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
      $content=curl_exec($ch);
      
      if($content === false)
      {
          echo "Waittt:::".$content;
	  echo 'Curl error: ' . curl_error($ch);
	  flush();
	  return(false);
	  
      }
      
    $dom = new DOMDocument;
    @$dom->loadHTML($content);
    

     $data=array();
	  

      $data['product_code']=$l->product_code;
      
      $title=$dom->getElementById("specifications");
     
     if(is_object($title))
      {
	foreach($title->childNodes as $c1)
	  {
	    if(isset($c1->tagName)&&$c1->tagName=="h3"&&$c1->getAttribute("class")=="item_desc_title fk-uppercase")
	    {
	      $data['title']=$c1->nodeValue;
	       
	      if(substr_count($data['title'],"Specifications of")>0)
	       {
	        $data['title']=str_replace("Specifications of","",$data['title']);
	       }
	      
	      break;
	    }
	  }
       }	  
     else
     {
      
         $title=$dom->getElementsByTagName("title");
    
       foreach($title as $c1)
	  {
	    if(isset($c1->tagName)&&$c1->tagName=="title")
	    {
	      $data['title']=$c1->nodeValue;
	      break;
	    }
	  }
     }
     
     $data['title']=trim($data['title']);
      
    $price=$dom->getElementsBytagName("meta");
    
    foreach($price as $p)
      {
        if(isset($p->tagName)&&$p->tagName=="meta"&&$p->getAttribute("itemprop")=="price")
        {
          $data['price']=trim($p->getAttribute("content"));
          break;
        } 
      }
    
    foreach($price as $p)
      {
        if(isset($p->tagName)&&$p->tagName=="meta"&&$p->getAttribute("itemprop")=="ratingValue")
        {
          $data['star_rate']=trim($p->getAttribute("content"));
          break;
        } 
      }
      
      $data['link']=$l->link;
      $data['parent_link']=$l->parent_link;
   
     $specifications=$dom->getElementsBytagName("td");
     $c=0;
     foreach($specifications as $s)
     {
       //specs-key
       //specs-value fk-data
        if($s->nodeValue==null)
        continue;
        if($s->getAttribute("class")=="specs-key")
        {
         
            
          $key=$s->nodeValue;
          
           if(isset($data['brand'])&&strtolower($s->nodeValue)=="brand")
            $key="processor_brand";
         // echo $s->nodeValue;
         
          $c++;
        }
        else if($s->getAttribute("class")=="specs-value fk-data")
        {
          $value=$s->nodeValue;
          //echo ":".$s->nodeValue;
          $c++;
        }
        if($c==2)
         {
           $data[strtolower(str_replace(' ','_',trim($key)))]=trim($value);
          $c=0;
          //echo "<hr/>";
         }
     }
    
    $description=$dom->getElementsByTagName("ul");
    
    if($description)
     {
       foreach($description as $d)
       { 
          $class=$d->getAttribute("class");
          if(isset($d->tagName)&&$d->tagName=="ul"&&($class=="fk-key-features"||$class=="feature_bullet"))
           {
              $data['description']=trim($this->getInnerHTML($d));
         

              break;
           }
           
           if(!isset($data['description']))
           {
              $description=$dom->getElementById("description");
    
	      if($description)
		{
		  foreach($description->childNodes as $c)
		  {
		    if(isset($c->tagName)&&$c->tagName=="div"&&$c->getAttribute("class")=="item_desc_text line")
		    {
		      $data['description']=trim($this->getInnerHTML($c));
		      $data['description']=str_replace('<div style="float:right">
                
 
            </div>','',$data['description']);
		      
		    }
		  }
		
		}
           }
       }
      // $data['description']=DOMinnerHTML($description);
     
      
     }
      $video=$dom->getElementsByTagName("param");
    
       foreach($video as $c1)
	  {
	    if(isset($c1->tagName)&&$c1->tagName=="param"&&$c1->getAttribute("name")=="movie")
	    {
	      $data['video_url']=$c1->getAttribute("value");
	      break;
	    }
	  }
	  
    $images=$dom->getElementsBytagName("span");
    
    foreach($images as $img)
      {
        /*
        if($l->category_name=="mobile")
        {
         $class="mi-thumb thumbs thumbs-small";
        }
        else if($l->category_name=="laptop")
        {
           $class="thumbs thumbs-small";
        }
        */
        
        
        if(isset($img->tagName)&&$img->tagName=="span"&&$img->getAttribute("class")=="mi-thumb thumbs thumbs-small")
        {
          foreach($img->childNodes as $c1)
          {
             if(isset($c1->tagName)&&$c1->tagName=="img")
              {
                $img_url=$c1->getAttribute("src");
                
                $very_small=$img_url;
                $small=str_replace('100x100','125x125',$img_url);
                $medium=str_replace('100x100','200x200',$img_url);
                $large=str_replace('100x100','400x400',$img_url);
                
                
                $data['images']['large'][]=$large;
                $data['images']['medium'][]=$medium;
                $data['images']['small'][]=$small;
                $data['images']['very_small'][]=$very_small;
                break;
              }
            
          }
         
        }
        else
         continue;
      }	  
    if(!isset($data['images']))
    {
	 
	      $images=$dom->getElementsBytagName("meta");
	      
	      foreach($images as $img)
		{
		  if(isset($img->tagName)&&$img->tagName=="meta"&&$img->getAttribute("name")=="og_image")
		  {
		 
			  $img_url=$img->getAttribute("content");
			  
			  $medium=$img_url;
			  $very_small=str_replace('200x200','100x100',$img_url);
			  $small=str_replace('200x200','125x125',$img_url);
			  $large=str_replace('200x200','400x400',$img_url);
			  
			  
			  $data['images']['large'][]=$large;
			  $data['images']['medium'][]=$medium;
			  $data['images']['small'][]=$small;
			  $data['images']['very_small'][]=$very_small;
			  break;
			
		  }
		  else
		  continue;
		}		 
	 
    }
     
     return($data);
    
 }
 public function getInnerHTML($node)
{
      $innerHTML= '';
    $children = $node->childNodes;
    foreach ($children as $child) {
        $innerHTML .= trim($child->ownerDocument->saveXML( $child ));
    }

    return $innerHTML; 
}
 public function getMobiles()
 {
   return(null);
 }

 public function getFootballArticles()
 {
  $criteria=new CDbCriteria;
  $criteria->limit="10";
  $criteria->addCondition("is_crawled=0");
  
  $links=ArticleLinks::model()->findAll($criteria);
   foreach($links as $l)
   {
          $ch = curl_init($l->link);
	  curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
	  curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
	  $content=curl_exec($ch);
	  
	  if($content === false)
	  {
	      echo 'Curl error: ' . curl_error($ch);
	      exit;
	  }
	 // echo $content;
	  
	   $dom = new DOMDocument;
    @$dom->loadHTML($content);
    
    $i=0;
   
     $header=$dom->getElementsByTagName("h1");
     
     $data=array();
     
     $data['link']=$l->link;
       
       foreach($header as $c1)
       {
         if(isset($c1->tagName)&&$c1->getAttribute("id")=="content")
           {
           //  echo "title:".trim($c1->nodeValue);	   
             $data['title']=trim($c1->nodeValue);
             break;
           }
       }    
       
       $caption=$dom->getElementsByTagName("figcaption");
       
       foreach($caption as $c1)
       {
         if(isset($c1->tagName))
           {
            // echo "<br/>Caption:".trim($c1->nodeValue);	   
             $data['caption']=trim($c1->nodeValue);
             break;
           }
       }    
        $uls=$dom->getElementsByTagName("ul");
       
       foreach($uls as $c1)
       {
         if($c1->getAttribute("class")=="m15-t")
           {
             foreach($c1->childNodes as $c2)
		  {
		    if(isset($c2->tagName)&&$c2->getAttribute("class")=="by")
		      {
			//echo "<br/>By:".trim($c2->nodeValue);	   
			$data['author_name']=trim(str_replace('by','',trim($c2->nodeValue)));
			//break;
		      }
		      else if(isset($c2->tagName))
		      {
		       $contact=explode("Twitter",trim($c2->nodeValue));
		       if(isset($contact[0]))
		       $data['author_email']=trim($contact[0]);
		       if(isset($contact[1]))
		       $data['author_twitter']=trim($contact[1]);
		      }
		      if(isset($data['author_email'])&&isset($data['author']))
		       break;
		  }    
             
             break;
           }
       }    
        $imgs=$dom->getElementsByTagName("img");
       
       foreach($imgs as $c1)
       {
         if($c1->getAttribute("width")=="628")
           {
             $data['image']="http://www.sunderlandecho.com".$c1->getAttribute("src");
             break;
           }
       }    
       
        $divs=$dom->getElementsByTagName("div");
       
       foreach($divs as $c1)
       {
         if($c1->getAttribute("class")=="article-content m20-b KonaBody")
           {
            // $data['content']=trim($c1->nodeValue);
             $data['content']=$this->getInnerHTML($c1);
             break;
           }
       }    
       
       
      $article=new Article;
      $article->attributes=$data;
      if($article->save())
       {
       
         $l->is_crawled=1;
         $l->save(false);
           echo "<pre>";
        print_r($data);
         echo "</pre>";
      
       }
       else
       {
         // print_r($article->errors);
       }
      
    
      flush();
   }
 }
 public function getFootballLinks()
 {
     ignore_user_abort(1); // Set whether a client disconnect should abort script execution
     set_time_limit(0); 
     
      
      $link="http://www.sunderlandecho.com/sport/football";
      
      $ch = curl_init($link);
      curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
      curl_setopt($ch, CURLOPT_FOLLOWLOCATION, TRUE);
      $content=curl_exec($ch);
      
      if($content === false)
      {
	  echo 'Curl error: ' . curl_error($ch);
	  exit;
      }
      
     // echo $content;
      //exit;
    
    $dom = new DOMDocument;
    @$dom->loadHTML($content);
    
    $i=0;
   
     $articles=$dom->getElementsByTagName("article");
     foreach($articles  as $k1=>$a)
     {
      
       
       foreach($a->childNodes as $c1)
       {
         if(isset($c1->tagName)&&$c1->tagName=="a")
           {
             echo ($i+1)."title:".$c1->nodeValue;
             echo "<br/>link".$c1->getAttribute("href");
             echo "<hr/>";
              flush();
             $i++;
             
             $link=new ArticleLinks;
             $link->link=$c1->getAttribute("href");
             $link->site="sunderlandecho";
             $link->category="football";
             $link->save();
             break;
           }
       }
     }
     
     
     $sections=$dom->getElementsByTagName("section");
     foreach($sections  as $k1=>$s)
     {
        if(isset($s->tagName)&&$s->getAttribute("class")=="midcol m30-b")
           {
	        foreach($s->childNodes as $c1)
		{
		  if(isset($c1->tagName)&&$c1->tagName=="ul")
		    {
		   
		          foreach($c1->childNodes as $k2=>$c2)
			  {
			    if(isset($c2->tagName)&&$c2->tagName=="li")
			      {
				 foreach($c2->childNodes as $c3)
				    {
				      if(isset($c3->tagName)&&$c3->tagName=="a")
					{
					  echo ($i+1)."title:".$c3->nodeValue;
					  echo "<br/>link:".$c3->getAttribute("href");
					  echo "<hr/>";
					  flush();
					    $link=new ArticleLinks;
					    $link->link=$c3->getAttribute("href");
					    $link->site="sunderlandecho";
					    $link->category="football";
					    $link->save();
					  $i++;
					  
					  break;
					}
				    }
				
			      }
			  }
			  
			break;
		    }
		}
           
           }
       
       
     }
     
     
     //
	  exit;
    return($data);

 }
 
 public function storeLinks($links,$category)
 { 
   $brand_name=$links['brand_name'];
   $parent_link=$links['parent_link'];
   
   $c=0;
   foreach($links as $k=>$l)
   {
      if($k=="parent_link"||$k=="brand_name")
       continue;
       
       $url=parse_url($l);
        parse_str($url['query'],$url);

        $model=new Productlinks;
        $model->link=$l;
        $model->product_code=$url['pid'];
        $model->store_name="flipkart";
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

 public function getLaptopLists()
 {
     $category="laptop";
     
      /*
      $url="http://www.flipkart.com/laptops/pr?sid=6bo,b5g&otracker=ch_vn_laptop_filter_Computer%20Brands";
      $category="laptop";
      $list_views=$this->getProductListViews($url,$category);

        echo "<br/><b>Products list1 count:</b>".count( $list_views);
         
      echo "<pre>";
      print_r($list_views);
      echo "</pre>";
   
      $this->addShopLinks($list_views,$category);
      */ 
      
      $brand_links=array(
        'dell' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Dell&sid=6bo,b5g',
	'hp' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=HP&sid=6bo,b5g',
	'lenovo' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Lenovo&sid=6bo,b5g',
	'sony' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Sony&sid=6bo,b5g',
	'asus' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Asus&sid=6bo,b5g',
	'acer' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Acer&sid=6bo,b5g',
	'samsung' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Samsung&sid=6bo,b5g',
	'apple' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Apple&sid=6bo,b5g',
	'toshiba' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Toshiba&sid=6bo,b5g',
	'fujitsu' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Fujitsu&sid=6bo,b5g',
	'hcl' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=HCL&sid=6bo,b5g',
	'wipro' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=Wipro&sid=6bo,b5g',
	'lg' => 'http://www.flipkart.com/laptops/pr?p[0]=facets.brand%5B%5D=LG&sid=6bo,b5g',
	'bestsellers(laptops)' => 'http://www.flipkart.com/laptops/~bestsellers/pr?sid=6bo,b5g',
        'touch screen(laptops)' => 'http://www.flipkart.com/laptops/~touch-screen/pr?sid=6bo,b5g',
        'acer aspire' => 'http://www.flipkart.com/laptops/~acer-aspire/pr?sid=6bo,b5g',
        'notebook' => 'http://www.flipkart.com/laptops/~notebook/pr?sid=6bo,b5g',
        'featured deals(laptops)' => 'http://www.flipkart.com/laptops/~featured-deals/pr?sid=6bo,b5g'
      );
       
      foreach($brand_links as $k=>$b)
      {
        $url=$b;
  
	  $list_views=$this->getProductListViews($url,$category);
	 
	     echo "<br/><b>Products list2 count:</b>".count( $list_views);
	    echo "<pre>";
	    print_r($list_views);
	    echo "</pre>";
	    flush(); 
	    
	
	  
	  $this->addShopLinks($list_views,$category,$k);
      }	  
         
     return($list_views);
 }
  public function addShopLinks($list_views,$category=null,$brand=null)
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
	  $model->store_name="flipkart";
	  $model->store_id=1;
	  $model->create_time=time();
	  $model->update_time=time();
	  if($model->save())
	   {
	     echo "<br/>Saved";
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
  
 
  public function getMobileLists()
 {
      $category="mobile";
      /*
      $url="http://www.flipkart.com/phones";
      $category="mobile";
      $list_views=$this->getProductListViews($url,$category);

        echo "<br/><b>Products list1 count:</b>".count( $list_views);
         
      echo "<pre>";
      print_r($list_views);
      echo "</pre>";
      $this->addShopLinks($list_views,$category);
      */
      $brand_links=array(
    'samsung' => 'http://www.flipkart.com/mobiles/samsung~brand/pr?sid=tyy,4io',
    'micromax' => 'http://www.flipkart.com/mobiles/micromax~brand/pr?sid=tyy,4io',
    'nokia' => 'http://www.flipkart.com/mobiles/nokia~brand/pr?sid=tyy,4io',
    'sony' => 'http://www.flipkart.com/mobiles/sony~brand/pr?sid=tyy,4io',
    'htc' => 'http://www.flipkart.com/mobiles/htc~brand/pr?sid=tyy,4io',
    'apple' => 'http://www.flipkart.com/mobiles/apple~brand/pr?sid=tyy,4io',
    'blackberry' => 'http://www.flipkart.com/mobiles/blackberry~brand/pr?sid=tyy,4io',
    'samsung galaxy' => 'http://www.flipkart.com/mobiles/~samsung-galaxy/pr?sid=tyy,4io',
    'samsung rex' => 'http://www.flipkart.com/mobiles/~samsung-rex/pr?sid=tyy,4io',
    'nokia lumia' => 'http://www.flipkart.com/mobiles/~nokia-lumia/pr?sid=tyy,4io',
    'sony xperia' => 'http://www.flipkart.com/mobiles/~sony-xperia/pr?sid=tyy,4io',
    'htc desire' => 'http://www.flipkart.com/mobiles/~htc-desire/pr?sid=tyy,4io',
    'lg' => 'http://www.flipkart.com/mobiles/lg~brand/pr?sid=tyy,4io',
    'karbonn' => 'http://www.flipkart.com/mobiles/karbonn~brand/pr?sid=tyy,4io',
    'maxx' => 'http://www.flipkart.com/mobiles/maxx~brand/pr?sid=tyy,4io',
    'android phones' => 'http://www.flipkart.com/mobiles/android-phones~type/pr?sid=tyy,4io',
    'smartphones' => 'http://www.flipkart.com/mobiles/smartphones~type/pr?sid=tyy,4io',
    'dual sim phones' => 'http://www.flipkart.com/mobiles/dual-sim-phones~type/pr?sid=tyy,4io',
    'rew releases(mobiles)' => 'http://www.flipkart.com/mobiles/~new-releases/pr?sid=tyy,4io',
    'featured deals(mobiles)' => 'http://www.flipkart.com/mobiles/~featured-deals/pr?sid=tyy,4io'
      );
      /*
      echo "<pre>";
      print_r($brand_links);
      echo "</pre>";
      exit;
      */
    foreach($brand_links as $k=>$b)
      { 
        echo "<h2>".$k."</h2>";
        $url=$b;
  
	  $list_views=$this->getProductListViews($url,$category);
	  
	    echo "<br/><b>Products list2 count:</b>".count( $list_views);
	    echo "<pre>";
	    print_r($list_views);
	    echo "</pre>";
   
	    flush();
	  
	  $this->addShopLinks($list_views,$category,$k);
      }	  
 }
 public function getProductListViews($url,$category,$brand=null)
 {
   //$url="http://www.flipkart.com/laptops/pr?sid=6bo,b5g&otracker=ch_vn_laptop_filter_Computer%20Brands";
     /*
       Products count:19
       Products list count:170
     */
    
    
    //$url="http://www.flipkart.com/computers/laptops?otracker=ch_vn_laptop_filter_Categories";
    /*
        Products count:14
        Products list count:37
      */
    $content=file_get_contents($url);
    //echo $content;
    $dom = new DOMDocument;
    @$dom->loadHTML($content);
    
    //$products=$dom->getElementById("products");
    $products=$dom->getElementsByTagName("a");
      $i=1;
     $data=array();
     foreach($products as $p)
     {
       if(isset($p->tagName)
                            &&
                              (strpos($p->getAttribute('href'), $category)!=false
                              // ||
                               //strpos($p->getAttribute('href'), "mobile")!=false
                              )
                            &&
                            strpos($p->getAttribute('href'), "accessories")==false
                            &&
                            strpos($p->getAttribute('href'), "bag")==false
                            &&
                            strpos($p->getAttribute('href'), "brands")==false
                            &&
                            strpos($p->getAttribute('href'), "fb_login")==false
                            &&
                            strpos($p->getAttribute('href'), "google_login")==false
                            
                            
        )
       {
          $link=urldecode("http://www.flipkart.com".$p->getAttribute('href'));
          
          if(
               //substr_count($link, "p[0]=facets")>0&&
             //substr_count($link, "facets.brand")<=1&&
             substr_count($link, "pid=")==0)
         {
        
              $data['product_lists'][]=$link;
            
         } 
          //echo "<hr>";
          $i++;
       }
     }
        // $data['product_views']=array_unique($data['product_views']);
         
         $data['product_lists']=array_unique($data['product_lists']);
         
         return($data['product_lists']);
  
 }

   
}
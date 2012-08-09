<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/all.js#xfbml=1&appId=271271732958999";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
<?php

//Yii::import('ext.fb.facebook');
class FbLike extends CWidget
{
	public $link,$layout;
	public function run()
	{
		if(!isset($this->layout))//button_count,box_count
			$this->layout='';
	echo '<fb:like href="'.$this->link.'" send="false" layout="'.$this->layout.'"  show_faces="false"></fb:like>';
			
	}
                  
}

?>
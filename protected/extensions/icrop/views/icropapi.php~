   <style type="text/css">
      .optdual { position: relative; }
      .optdual .offset { position: absolute; left: 18em; }
      .optlist label { width: 16em; display: block; }
      #dl_links { margin-top: .5em; }
    </style>
    
 <div id="outer">
    <div class="jcExample">
    <div class="article">

      <h1>Jcrop - API Demo</h1>
      <img src="<?php echo $this->img_url; ?>" id="target" alt="Jcrop Image" />
          
        
      X:<input type="text" id="x"><br/>  
      X2:<input type="text" id="x2"><br/>
      Y:<input type="text" id="y"><br/> 
      Y2:<input type="text" id="y2"><br/>
      W:<input type="text" id="w"><br/>  
      H:<input type="text" id="h"><br/>  
          
      <div style="margin: .8em 0 .5em;">
        <span class="requiresjcrop">
          <button id="setSelect">setSelect</button>
          <button id="animateTo">animateTo</button>
          <button id="release">Release</button>
          <button id="disable">Disable</button>
        </span>
        <button id="enable" style="display:none;">Re-Enable</button>
        <button id="unhook">Destroy!</button>
        <button id="rehook" style="display:none;">Attach Jcrop</button>
      </div>

      <fieldset class="optdual requiresjcrop">
        <legend>Option Toggles</legend>
        <div class="optlist offset">
          <label><input type="checkbox" id="ar_lock" />Aspect ratio</label>
          <label><input type="checkbox" id="size_lock" />minSize/maxSize setting</label>
        </div>
        <div class="optlist">
          <label><input type="checkbox" id="can_click" />Allow new selections</label>
          <label><input type="checkbox" id="can_move" />Selection can be moved</label>
          <label><input type="checkbox" id="can_size" />Resizable selection</label>
        </div>
      </fieldset>

      <fieldset class="requiresjcrop" style="margin: .5em 0;">
        <legend>Change Image</legend>
        <span>
          <button id="img2">Pool</button>
          <button id="img1">Sago</button>
          <button id="img3">Sago w/ outerImage</button>
        </span>
      </fieldset>
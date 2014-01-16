
    
     <div id="outer">
  <div class="jcExample">
  <div class="article">

    <h1>Jcrop - Aspect ratio w/ preview pane</h1>

    <table>
      <tr>
        <td>
          <img src="<?php echo $this->img_url; ?>" id="target" alt="Flowers" />
        </td>
        <td>
          <div style="width:100px;height:100px;overflow:hidden;">
            <img src="<?php echo $this->img_url; ?>" id="preview" alt="Preview" class="jcrop-preview" />
          </div>
        </td>
      </tr>
    </table>

    <p>
      <b>An example implementing a preview pane.</b>
        Obviously the most visual demo, the preview pane is accomplished
        entirely outside of Jcrop with a simple jQuery-flavored callback.
        This type of interface could be useful for creating a thumbnail
        or avatar. The onChange event handler is used to update the
        view in the preview pane.
    </p>

    <div id="dl_links">
      <a href="http://deepliquid.com/content/Jcrop.html">Jcrop Home</a> |
      <a href="http://deepliquid.com/content/Jcrop_Manual.html">Manual (Docs)</a>
    </div>


  </div>
  </div>
  </div>
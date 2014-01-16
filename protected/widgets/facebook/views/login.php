<span style="padding-top:20px;">
<?php if(Yii::app()->user->isGuest): ?>
    <div id="<?php echo $this->fbLoginButtonId; ?>" class="<?php echo $this->fbLoginButtonClass; ?>"><?php echo $this->facebookButtonTitle; ?></div>
<?php endif; ?>

</siv>

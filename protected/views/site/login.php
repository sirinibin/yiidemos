<?php
$this->pageTitle = Yii::app()->name . ' - Login';

?>
<div class="container" style="margin-top:40px">
    <div class="span12">
        <div class="span5 offset3">
            <h2 style="text-align: center">Login</h2>

            <div class="form">
				<?php $form = $this->beginWidget('bootstrap.widgets.TbActiveForm', array(
				'id' => 'login-form',
				'enableClientValidation' => true,
				'htmlOptions' => array('class' => 'well'),
				'clientOptions' => array(
					'validateOnSubmit' => true,
				),
			)); ?>

                <p class="note">Fields with <span class="required">*</span> are required.</p>

				<?php echo $form->textFieldRow($model, 'username', array('class' => 'span3'));?>
				<?php echo $form->passwordFieldRow($model, 'password', array('class' => 'span3'));?>
				<?php echo $form->checkBoxRow($model, 'rememberMe');?>

                <div class="form-actions">
					<?php $this->widget('bootstrap.widgets.TbButton', array('buttonType' => 'submit', 'type' => 'primary', 'label' => 'Submit', 'icon' => 'ok'));?>
					<?php $this->widget('bootstrap.widgets.TbButton', array('buttonType' => 'reset', 'label' => 'Reset'));?>
                </div>

				<?php $this->endWidget(); ?>
            </div>
            <!-- form -->
        </div>
    </div>
</div>

<link rel="stylesheet" href="<?php echo Yii::app()->baseUrl; ?>/css/bootstrap.min.css">
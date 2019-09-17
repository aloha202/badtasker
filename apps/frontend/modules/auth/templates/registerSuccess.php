<div class="row">
	<!-- left column -->
	<div class="col-md-6">
		<!-- general form elements -->
		<div class="box box-primary">
			<form method="post" action="<?php echo url_for('auth/register'); ?>" enctype="multipart/form-data" class="js-form-control">
				<fieldset>
					<div class="box-body">
						<?php echo $form; ?>
					</div>
					<div class="box-footer">
						<!-- Button -->
						<button class="btn btn-success"><?= __('Регистрация') ?></button>
					</div>
				</fieldset>
			</form>
		</div>    
	</div>
</div>
<div class='hidden'>
    <a href='<?php echo url_for_system_page('user_agreement'); ?>' id='user_agreement_link'><?= __('пользовательского соглашения') ?></a>
</div>
<script type='text/javascript'>

    $(function(){
		$label =  $('#profile_agree').parent().find('label');
		$label.find('strong').before('&nbsp;');
		$label.find('strong').before($('#user_agreement_link'));
       
    });

</script>
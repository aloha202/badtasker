<?php /*

  <?php echo page_header($page); ?>

  <?php echo page_well($page); ?>

  <?php include_partial('auth/form', array('form' => $form, 'page' => $page)); ?>
 * 
 * 
 */ ?>
<div class="row">
	<!-- left column -->
	<div class="col-md-6">
		<!-- general form elements -->
		<div class="box box-primary">
			<!-- form start -->
			<form role="form" class="js-form-control" method="post" action="<?php echo url_for('auth/signin'); ?>">
				<div class="box-body">
					<?php echo $form; ?>
				</div><!-- /.box-body -->

				<div class="box-footer">
                    <button type="submit" class="btn btn-primary"><?php echo __('Войти'); ?></button>
				</div>
			</form>
		</div><!-- /.box -->
	</div>

</div>

		<div class="login-wrap">

			<div class="box-info">
				<h2 class="text-center"><?php echo __('Who are you bro?'); ?></h2>

				<form role="form" method="POST" action="<?php echo url_for('auth/signin') ?>">

					<?php echo $form->renderHiddenFields(); ?>
					<?php echo $form->renderGlobalErrors(); ?>
					
					
					
					<div class="form-group">				
						<div class="login-input">
						<i class="fa fa-sign-in overlay"></i>
						<?php echo $form['username']->render(array('class' => 'form-control text-input')); ?>
						</div>
						
					</div>

					<div class="form-group login-input">
						
						<i class="fa fa-key overlay"></i>
						<?php echo $form['password']->render(array('class' => 'form-control text-input')); ?>				
					</div>
					<div class="checkbox">
						<label>
							<?php echo $form['remember']->render(); ?><?php echo __('Remember me'); ?>
						</label>
					</div>

					<div class="row">
						<div class="col-sm-12">
							<button type="submit" class="btn btn-success btn-block"><i class="fa fa-unlock"></i> I am a friend! Trust me!</button>
						</div>
					</div>

				</form>

			</div>
		</div>

<?php /*


<form action="<?php echo url_for('auth/signin') ?>" method="post">
  <table>
    <tbody>
      <?php echo $form ?>
    </tbody>
    <tfoot>
      <tr>
        <td colspan="2">
          <input type="submit" value="<?php echo __('Signin', null, 'sf_guard') ?>" />

        </td>
      </tr>
    </tfoot>
  </table>
</form>
 * 
 * 
 */ ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <?php include_partial('global/head'); ?>
  </head>
  <body>
      <div class="wrapper">

          <?php include_component('default', 'header'); ?>


          <!-- Full Width Column -->
          <div class="content-wrapper">
              <div class="container">
                  <div class="container-padding">

        <?php echo $sf_content ?>
                  </div>
              </div><!-- /.container -->
          </div><!-- /.content-wrapper -->


          <footer class="main-footer">
              <div class="container">
                  <div class="pull-right hidden-xs">
                      <b>Version</b> 2.0
                  </div>
                  <strong>Copyright &copy; 2018-<?php echo date('Y'); ?> <a href="http://digitally-yours.org">Digitally Yours</a>.</strong> All rights reserved.
              </div><!-- /.container -->
          </footer>

      </div><!-- ./wrapper -->
  </body>
</html>

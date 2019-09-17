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

        <?php echo $sf_content ?>

              </div><!-- /.container -->
          </div><!-- /.content-wrapper -->


          <footer class="main-footer">
              <div class="container">
                  <div class="pull-right hidden-xs">
                      <b>Version</b> 2.0
                  </div>
                  <strong>Copyright &copy; 2014-2015 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights reserved.
              </div><!-- /.container -->
          </footer>

      </div><!-- ./wrapper -->
  </body>
</html>

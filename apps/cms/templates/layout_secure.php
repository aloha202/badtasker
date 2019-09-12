<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <?php include_partial('global/head'); ?>
    </head>
    <body>

        <script type='text/javascript'>

            // This global variables implemented in admin.js
            CUR_MODULE  = '<?php echo strtolower($sf_params->get('module')); ?>';
            CUR_ACTION  = '<?php echo strtolower($sf_params->get('action')); ?>';
            MODULE_URL  = '<?php echo url_for($sf_params->get('module') . '/index'); ?>';
            BASE_URL    = 'http://<?php echo $_SERVER['HTTP_HOST']; ?>/backend.php/';
            
            var URL_UTIL_EMBEDDED_COLLECTION_ADD_FIELDS = '<?php echo url_for('util/embeddedCollectionAddFields'); ?>'
   
        </script>


<div class="container">

	<div class="full-content-center animated fadeInDownBig">
		<div class="alert alert-success alert-dismissable">
			<script type="text/javascript" src="http://www.brainyquote.com/link/quotebr.js"></script>
			<small><i><a href="http://www.brainyquote.com/quotes_of_the_day.html" target="_blank">more Quotes</a></i></small>
		</div>
	</div>

	<div class="full-content-center animated fadeInDownBig">
		<?php echo $sf_content; ?>

	</div>
</div>

		<?php include_partial('global/foot'); ?>
    </body>
</html>
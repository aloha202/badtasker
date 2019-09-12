<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
    <head>
        <?php include_partial('global/head'); ?>
    </head>
    <body>

        <script type='text/javascript'>

            // This global variables implemented in admin.js
            CUR_MODULE = '<?php echo strtolower($sf_params->get('module')); ?>';
            CUR_ACTION = '<?php echo strtolower($sf_params->get('action')); ?>';
            MODULE_URL = '<?php echo url_for($sf_params->get('module') . '/index'); ?>';
            BASE_URL = 'http://<?php echo $_SERVER['HTTP_HOST']; ?>/backend.php/';

            var URL_UTIL_EMBEDDED_COLLECTION_ADD_FIELDS = '<?php echo url_for('util/embeddedCollectionAddFields'); ?>'

        </script>
        <div class="container">


            <div id="sidebar-scroll-top" class="sidebar-scroll-button">
                <i class="fa fa-angle-up"></i>
            </div>

            <div id="sidebar-scroll-bottom" class="sidebar-scroll-button">
                <i class="fa fa-angle-down"></i>
            </div>

            <div class="left side-menu">
                <div class="header sidebar rows">
                    <div class="logo animated bounceIn">
                        <h1><img src="/lanceng/assets/img/logo.png" alt="" ></h1>
                    </div>
                </div>
                <div class="body rows scroll-y animated scroll-container fadeInLeftBig">
                    <div class="sidebar-inner slimscroller">
                        <div id="sidebar-menu">
                            <?php include_partial('global/left'); ?>
                            <div class="clear"></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="right content-page">
                <div class="header content rows-content-header">

                    <button class="button-menu-mobile show-sidebar">
                        <i class="fa fa-bars"></i>
                    </button>


                    <div class="navbar navbar-default" role="navigation">

                        <div class="container">
                            <div class="navbar-header">
                                <button type="button" class="navbar-toggle" data-toggle="collapse"
                                        data-target=".navbar-collapse">
                                    <i class="fa fa-angle-double-down"></i>
                                </button>
                            </div>

                            <div class="navbar-collapse collapse">

                                <ul class="nav navbar-nav navbar-right top-navbar">




                                    <li class="dropdown">

                                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                            <?php echo __('Howdy, '); ?><strong><?php echo $sf_user->getGuardUser(); ?></strong>
                                            <i class="fa fa-chevron-down i-xs"></i>
                                        </a>

                                        <ul class="dropdown-menu animated half flipInX">
                                            <?php if($sf_user->isSecondaryUser()): ?>
                                            <li><a class="md-trigger" href="<?php echo url_for('auth/signoutAs'); ?>"><?php echo __('Logout as...'); ?></a></li>
                                            <?php endif; ?>
                                            <li><a class="md-trigger" href="<?php echo url_for('auth/signout'); ?>"><?php echo __('Logout'); ?></a></li>

                                        </ul>

                                    </li>

                                </ul>
                            </div>

                        </div>
                    </div>

                </div>


                <div class="body content rows scroll-y">

                    <?php echo $sf_content; ?>
                    
                    <?php include_partial('global/footer'); ?>

                </div>

            </div>

            <div class="md-overlay"></div>
        </div>
        <?php include_partial('global/foot'); ?>	
        
        
    </body>
</html>
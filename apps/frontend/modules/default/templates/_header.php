<header class="main-header">
    <nav class="navbar navbar-static-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse">
                    <i class="fa fa-bars"></i>
                </button>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse pull-left" id="navbar-collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="#"><?php echo $sf_user->getGuardUser()->getUsername(); ?></a></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Доски <span class="caret"></span></a>
                        <ul class="dropdown-menu" role="menu">
                            <?php foreach($Boards as $board): ?>
                                <li><a href="<?php echo url_for('@board_show?id=' . $board->id); ?>"><?php echo $board->name; ?></a></li>
                            <?php endforeach; ?>
                        </ul>
                    </li>
                    <li><a href="<?php echo url_for('auth/signout'); ?>">Log out</a></li>
                </ul>

            </div><!-- /.navbar-collapse -->
            <!-- Navbar Right Menu -->
        </div><!-- /.container-fluid -->
    </nav>
</header>
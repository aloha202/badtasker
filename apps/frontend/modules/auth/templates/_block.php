<div class="art-block">
    <div class="art-block-tl"></div>
    <div class="art-block-tr"></div>
    <div class="art-block-bl"></div>
    <div class="art-block-br"></div>
    <div class="art-block-tc"></div>
    <div class="art-block-bc"></div>
    <div class="art-block-cl"></div>
    <div class="art-block-cr"></div>
    <div class="art-block-cc"></div>
    <div class="art-block-body">
        <?php if ($sf_user->isAuthenticated()): ?>
            <div class="art-blockheader">
                <div class="l"></div>
                <div class="r"></div>
                <h3 class="t">Welcome!</h3>
            </div>
            <div class="art-blockcontent">
                <div class="art-blockcontent-body">
                    <div>
                        Hello, <strong><?php echo $username; ?></strong>
                        <ul>
                            <?php foreach($menu as $item): ?>
                                <li><?php echo link_to($item[0], $item[1]); ?></li>
                            <?php endforeach; ?>
                        </ul>
                    </div>                
                    <div class="cleared"></div>
                </div>
            </div>
        <?php else: ?>
            <div class="art-blockheader">
                <div class="l"></div>
                <div class="r"></div>
                <h3 class="t">Sign in</h3>
            </div>
            <div class="art-blockcontent">
                <div class="art-blockcontent-body">
                    <div>
                        <?php include_component('auth', 'form'); ?>
                    </div>                
                    <div class="cleared"></div>
                </div>
            </div>        

        <?php endif; ?>
        <div class="cleared"></div>

    </div>
</div>
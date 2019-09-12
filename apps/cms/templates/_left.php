<ul id="sf_admin_menu">

    <?php if($sf_user->isSuper()): ?>

        <?php $items = sfConfig::get('app_sf_admin_dash_menu'); ?>
    <?php else: ?>

        <?php $items = sfConfig::get('app_sf_admin_dash_menu2'); ?>


    <?php endif; ?>

    <?php foreach($items as $name => $item): ?>


        <?php if(!empty($item['items'])): ?>
            <li>
                <a href="javascript:void(0);">
                    <?php if(!empty($item['icon'])): ?><i class="fa fa-<?php echo $item['icon']; ?>"></i><?php endif; ?>
                    <i class="fa fa-angle-double-down i-right"></i>
                    <?php echo __($name); ?>
                    <span class='new_messages_parent'></span>
                </a>
                <ul>
                    <?php foreach($item['items'] as $name2 => $item2): ?>
                        <li class='<?php echo $sf_context->matchesUrl($item2['url']) ? 'active' : ''; ?>'>
                            <a href="<?php echo url_for($item2['url']); ?>"><?php if(!empty($item2['icon'])): ?><i class="fa fa-<?php echo $item2['icon']; ?>"></i><?php endif; ?> <?php echo __($name2); ?>
                                <?php if(!empty($item2['new_messages'])): ?>
                                    <?php include_component('util', 'new_messages_count', array('model' => $item2['new_messages'])); ?>
                                <?php endif; ?>
                            </a>
                        </li>
                    <?php endforeach; ?>
                </ul>
            </li>
        <?php else: ?>
            <li class='<?php echo $sf_context->matchesUrl($item2['url']) ? 'active' : ''; ?>'>
                <a href="<?php echo url_for($item['url']); ?>"><?php if(!empty($item['icon'])): ?><i class="fa fa-<?php echo $item['icon']; ?>"></i><?php endif; ?> <?php echo __($name); ?>
                    <?php if(!empty($item['new_messages'])): ?>
                        <?php include_component('util', 'new_messages_count', array('model' => $item['new_messages'])); ?>
                    <?php endif; ?>
                </a>
            </li>
        <?php endif; ?>


    <?php endforeach; ?>









	

</ul>





<script type='text/javascript'>

    $(function(){
       $('#sf_admin_menu li li.active').each(function(){
           $(this).parents('li').addClass('active selected');
           //$(this).parents('li>a').click();
       }) ;
    });


</script>
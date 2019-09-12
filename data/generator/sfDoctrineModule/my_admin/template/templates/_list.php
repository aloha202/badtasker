<div class="sf_admin_list">
    [?php if (!$pager->getNbResults()): ?]
    <p>[?php echo __('No result', array(), 'sf_admin') ?]</p>
    [?php else: ?]
    <table cellspacing="0">
        <thead>
            <tr>
                <?php if ($this->configuration->getValue('list.batch_actions')): ?>
                    <th id="sf_admin_list_batch_actions"><input id="sf_admin_list_batch_checkbox" type="checkbox" /></th>
                <?php endif; ?>
                [?php include_partial('<?php echo $this->getModuleName() ?>/list_th_<?php echo $this->configuration->getValue('list.layout') ?>', array('sort' => $sort)) ?]
                <?php if ($this->configuration->getValue('list.object_actions')): ?>
                    <th id="sf_admin_list_th_actions">[?php echo __('Actions', array(), 'sf_admin') ?]</th>
                <?php endif; ?>
            </tr>
        </thead>
        <tfoot>
            <tr>
                <th colspan="<?php echo count($this->configuration->getValue('list.display')) + ($this->configuration->getValue('list.object_actions') ? 1 : 0) + ($this->configuration->getValue('list.batch_actions') ? 1 : 0) ?>">
                    [?php if ($pager->haveToPaginate()): ?]
                    [?php include_partial('<?php echo $this->getModuleName() ?>/pagination', array('pager' => $pager)) ?]
                    [?php endif; ?]

                    [?php echo format_number_choice('[0] no result|[1] 1 result|(1,+Inf] %1% results', array('%1%' => $pager->getNbResults()), $pager->getNbResults(), 'sf_admin') ?]
                    [?php if ($pager->haveToPaginate()): ?]
                    [?php echo __('(page %%page%%/%%nb_pages%%)', array('%%page%%' => $pager->getPage(), '%%nb_pages%%' => $pager->getLastPage()), 'sf_admin') ?]
                    [?php endif; ?]
                </th>
            </tr>
        </tfoot>
        <tbody>
            [?php foreach ($pager->getResults() as $i => $<?php echo $this->getSingularName() ?>): $odd = fmod(++$i, 2) ? 'odd' : 'even' ?]
<?php if($this->getTable()->hasTemplate('BackendViewed')): ?>
        <script type='text/javascript'>
            [?php if(!$<?php echo $this->getSingularName() ?>->getIsBackendViewed()): ?]
            $(function(){
                set_backend_viewed([?php echo $<?php echo $this->getSingularName() ?>->getId() ?]);                
            });
            [?php endif; ?]
        </script>
<?php endif; ?>
            <tr class="sf_admin_row [?php echo $odd ?]">
                <?php if ($this->configuration->getValue('list.batch_actions')): ?>
                    [?php include_partial('<?php echo $this->getModuleName() ?>/list_td_batch_actions', array('<?php echo $this->getSingularName() ?>' => $<?php echo $this->getSingularName() ?>, 'helper' => $helper)) ?]
                <?php endif; ?>
                [?php include_partial('<?php echo $this->getModuleName() ?>/list_td_<?php echo $this->configuration->getValue('list.layout') ?>', array('<?php echo $this->getSingularName() ?>' => $<?php echo $this->getSingularName() ?>)) ?]
                <?php if ($this->configuration->getValue('list.object_actions')): ?>
                    [?php include_partial('<?php echo $this->getModuleName() ?>/list_td_actions', array('<?php echo $this->getSingularName() ?>' => $<?php echo $this->getSingularName() ?>, 'helper' => $helper)) ?]
                <?php endif; ?>
            </tr>
            [?php endforeach; ?]
        </tbody>
    </table>
    [?php endif; ?]
</div>
<script type="text/javascript">
    /* <![CDATA[ */
    <?php if($this->getTable()->hasTemplate('BackendViewed')): ?>
        var backend_viewed = [];
        function set_backend_viewed(id){
            backend_viewed.push(id);
        }
    <?php endif; ?>    
    $(function(){
        $('#sf_admin_list_batch_checkbox').change(function(){
            $('.sf_admin_batch_checkbox').prop('checked', this.checked);
        });
        <?php if($this->getTable()->hasTemplate('BackendViewed')): ?>        
        $.get("[?php echo url_for('<?php echo $this->getModuleName(); ?>/backendViewedAll') ?]", {
            ids: backend_viewed
        }, function(resp){
            $('#' + CUR_MODULE + '_new_messages_count').text(resp);
            if(window.init_new_messages_count){
                window.init_new_messages_count();
            }
        });
        <?php endif; ?>
    });
    


    /* ]]> */
</script>



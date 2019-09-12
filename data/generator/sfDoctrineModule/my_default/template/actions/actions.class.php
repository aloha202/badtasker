[?php

/**
 * <?php echo $this->getModuleName() ?> actions.
 *
 * @package    ##PROJECT_NAME##
 * @subpackage <?php echo $this->getModuleName()."\n" ?>
 * @author     ##AUTHOR_NAME##
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class <?php echo $this->getGeneratedModuleName() ?>Actions extends <?php echo 'myActions'//$this->getActionsBaseClass() ?>

{
<?php include dirname(__FILE__).'/../../parts/preExecute.php' ?>

<?php include dirname(__FILE__).'/../../parts/indexAction.php' ?>

<?php include dirname(__FILE__).'/../../parts/showAction.php' ?>

/* --- ACTIONS --- */

}

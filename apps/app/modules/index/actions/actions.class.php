<?php

/**
 * index actions.
 *
 * @package    cms
 * @subpackage index
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class indexActions extends sfActions
{
 /**
  * Executes index action
  *
  * @param sfRequest $request A request object
  */
  public function executeIndex(sfWebRequest $request)
  {
    return $this->renderText('1');
  }


  public function executeLoad(sfWebRequest $request){
      $this->getResponse()->setContentType('text/javascript');

      $href = $request->getParameter('href');
      $parsed = parse_url($href);

      $host  = $parsed['host'];

      $Projects = null;
      $Website = null;
      $appName = 'TheApp';
      $appNamesArray = [];
      $codebase = '';
      if($this->getUser()->isAuthenticated()) {
          $Website = Q::c('Website', 'w')
              ->where('w.host = ?', $host)
              ->fetchOne();
          if ($Website) {
              $Projects = Q::c('WebsiteProject', 'p')
                  ->where('p.website_id = ?', $Website->id)
                  ->andWhere('p.Users.id = ?', $this->getUser()->getGuardUser()->getId())
                ->execute();
          }
      }



      return $this->renderPartial('index/load.js', [
          'href' => $href,
          'host' => $host,
          'Projects' => $Projects,
          'Website' => $Website
          ]
      );
  }


}

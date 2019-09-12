  public function executeCreateUser(sfWebRequest $request)
  {
    $this-><?php echo $this->getSingularName(); ?> = $this->getRoute()->getObject();
    try{
        $user = sfGuardUserTable::createUserFromObject($this-><?php echo $this->getSingularName() ?>);
        SiteEvent::fire('user_created_by_admin', $user);
        $this->getUser()->setFlash('notice', "User created successfully");
        return $this->redirect('user/index');        
    }catch(Exception $e){
        $this->getUser()->setFlash('error', $e->getMessage());
    }
    return $this->redirect($request->getReferer());    
  }
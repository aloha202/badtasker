<?php

/**
 * auth actions.
 *
 * @package    cms
 * @subpackage auth
 * @author     Your name here
 * @version    SVN: $Id: actions.class.php 23810 2009-11-12 11:07:44Z Kris.Wallsmith $
 */
class authActions extends myActions {

	public function executeIndex() {
		$this->forward('auth', 'signin');
	}

	public function executeRegister(sfWebRequest $request) {
		if ($this->getUser()->isAuthenticated()) {
			return $this->redirect('@homepage');
		}
		$this->form = new RegistrationForm;

		$this->page = $this->processPage('register');
		$this->processForm2($this->form, $request, 'Registration complete', 'auth/registrationComplete');
		/*
		  if ($request->isMethod('post')) {
		  $this->form->bind($request->getParameter($this->form->getName()));
		  if ($this->form->isValid()) {
		  $profile = $this->form->save();
		  $this->getUser()->signIn($profile->getUser());
		  return $this->redirect('register/registrationComplete');
		  }
		  }
		 * 
		 */
	}

	public function executeSignin($request) {

	    $this->setLayout('layout_auth');

		$user = $this->getUser();
		if ($user->isAuthenticated()) {
			return $this->redirect('@homepage');
		}

		$this->form = new SigninForm;
		Breadcrumbs::add(array($this->page));

		if ($request->isMethod('post')) {
			$this->form->bind($request->getParameter('signin'));
			if ($this->form->isValid()) {
				$values = $this->form->getValues();
				$this->getUser()->signin($values['user'], array_key_exists('remember', $values) ? $values['remember'] : false);


				return $this->redirect('@homepage');
			}
		} else {
			if ($request->isXmlHttpRequest()) {
				$this->getResponse()->setHeaderOnly(true);
				$this->getResponse()->setStatusCode(401);

				return sfView::NONE;
			}

			// if we have been forwarded, then the referer is the current URL
			// if not, this is the referer of the current request
			$user->setReferer($this->getContext()->getActionStack()->getSize() > 1 ? $request->getUri() : $request->getReferer());

			$module = sfConfig::get('sf_login_module');
			if ($this->getModuleName() != $module) {
				return $this->redirect($module . '/' . sfConfig::get('sf_login_action'));
			}

			$this->getResponse()->setStatusCode(401);
		}
	}

	public function executeSignout($request) {
		$this->getUser()->signOut();

		$signoutUrl = sfConfig::get('app_sf_guard_plugin_success_signout_url', $request->getReferer());

		$this->redirect('' != $signoutUrl ? $signoutUrl : '@homepage');
	}

	public function executeSecure($request) {
		$this->getResponse()->setStatusCode(403);
		$this->processPage();
	}

	public function executeRegistrationComplete(sfWebRequest $request) {
		$this->processPage();
		//$this->redirectToSystemPage('registration_complete');
	}

	public function executeForgotPassword(sfWebRequest $request) {
		$this->processPage('auth_forgot_password');
		$this->form = new ForgotPasswordForm;

		/*
		  if($request->isMethod('post')){
		  $this->form->bind($request->getParameter($this->form->getName()));
		  if($this->form->isValid()){

		  $values = $this->form->getValues();
		  if(!empty($values['email'])){
		  $this->form->saveAsEmail();
		  return $this->redirect('auth/forgotPasswordThanks');
		  }
		  if(!empty($values['phone'])){
		  $forgot = $this->form->saveAndSendSms();
		  return $this->redirect('@auth_forgot_sms?hash=' . $forgot->getHash());
		  }

		  }
		  }
		 * 
		 */
		$this->processForm2($this->form, $request, T::__('Письмо отправлено'), 'auth/forgotPasswordThanks');
	}

	public function executeForgotSms(sfWebRequest $request) {
		$lifetime = sfConfig::get('app_forgot_password_lifetime');
		$this->forgot = $forgot = Q::c('ForgotPassword', 'p')
				->where('p.hash = ?', $request->getParameter('hash'))
				->andWhere("DATE_ADD(p.created_at, INTERVAL $lifetime) > NOW()")
				->fetchOne()
		;
		$this->forward404Unless($this->forgot);
		$this->processPage();

		$this->form = new ForgotPasswordFormSmsConfirm(null, array('forgot' => $forgot));
		$this->processForm2($this->form, $request, '', 'auth/recover');
	}

	public function executeForgotPasswordThanks(sfWebRequest $request) {
		$this->processPage('auth_forgot_password_thanks');
		$this->displayPage();
		//$this->setLayout('layout_profile');
	}

	public function executeRecover(sfWebRequest $request) {
		$this->hash = $request->getParameter('hash', $this->getUser()->getAttribute('password_recovery_hash'));
		$this->forward404Unless($this->hash);
		$lifetime = MyConfig::get('auth_password_recovery_hash_lifetime');
		$forgot = Doctrine::getTable('ForgotPassword')
				->createQuery('f')
				->where('f.hash = ?', $this->hash)
				->andWhere("DATE_ADD(f.created_at, INTERVAL $lifetime) > NOW()")
//                ->andWhere('f.status = ?', 'open')
				->leftJoin('f.User')
				->fetchOne()
		;

		$this->processPage('auth_password_recovery');
		$this->forward404Unless($forgot);
		$this->form = new ForgotPasswordFormActivate($forgot->getUser());

		if ($request->isMethod('post')) {
			$this->form->bind($request->getParameter($this->form->getName()));

			if ($this->form->isValid()) {
				$this->form->save();

				//       $forgot->setStatus('closed');
				//       $forgot->save();
				$forgot->delete();

				$this->getUser()->setFlash('notice', T::__('Пароль восстановлен'));
				return $this->redirect('auth/signin');
			}
		}
	}

	public function executeActivate(sfWebRequest $request) {
		$code = $request->getParameter('code');
		$this->forward404Unless($code);

		$user = Doctrine::getTable('sfGuardUser')->findOneBySalt($code);
		$this->forward404Unless($user);

		$user->setIsActive(true);
		$user->save();
		$this->getUser()->signIn($user);

		return $this->redirect('auth/activationSuccessful');
	}

	public function executeActivationSuccessful() {
		$this->processPage();
		//$this->redirectToSystemPage('activation_successful');        
	}

	/* --- ACTIONS --- */
}

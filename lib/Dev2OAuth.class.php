<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of OAuth
 *
 * @author Alaxa
 */
class Dev2OAuth {

    protected $type;
    protected $app_id;
    protected $app_secret;
    protected $server;
    protected $data;
    protected $auth_service;
    protected $redirect_uri;

    public function __construct($type) {
        $this->server = $_SERVER['SERVER_NAME'];
        $this->type = $type;
        $this->app_id = MyConfig::get("oauth_{$this->type}_app_id");
        $this->app_secret = MyConfig::get("oauth_{$this->type}_app_secret");
        $this->redirect_uri = "http://{$this->server}/oauth/$type";
    }

    public function getLoginUrl() {

        switch ($this->type) {
            case 'facebook':
                $scope = 'public_profile,email';
                return "https://www.facebook.com/dialog/oauth?client_id=$this->app_id&redirect_uri=$this->redirect_uri&scope=$scope";
            case 'vkontakte':
                $scope = 'notify,email';
                $url = "https://oauth.vk.com/authorize?client_id=$this->app_id&scope=$scope&redirect_uri=$this->redirect_uri&response_type=code";
                return $url;
            case 'google':
                $client = $this->getClient();
                return $client->createAuthUrl();
            case 'yandex':
                $url = 'https://oauth.yandex.ru/authorize';
                $params = array(
                    'client_id' => $this->app_id,
                    'response_type' => 'code',
                    'display' => 'popup'
                );
                $url .= '?' . urldecode(http_build_query($params));
                return $url;
            case 'twitter':
                $_SESSION['twitter_token'] = null;
                $_SESSION['twitter_token_secret'] = null;                
                $client = $this->getClient();
                $request_token = $client->getRequestToken($this->redirect_uri);
                $_SESSION['twitter_token'] = $request_token['oauth_token'];
                $_SESSION['twitter_token_secret'] = $request_token['oauth_token_secret'];
                return $client->getAuthorizeURL($request_token['oauth_token']);

            case 'mailru':
                return 'https://connect.mail.ru/oauth/authorize' .  '?' . http_build_query(array(
                    'client_id' => $this->app_id,
                    'response_type' => 'code',
                    'redirect_uri' => $this->redirect_uri));                
                break;
        }
    }

    public function getAccessToken($code) {
        switch ($this->type) {
            case 'facebook':
                $url = "https://graph.facebook.com/oauth/access_token?client_id=" . $this->app_id .
                        "&client_secret=" . $this->app_secret .
                        "&code=" . $code .
                        "&redirect_uri=" . $this->redirect_uri;

                $res = $this->request($url, false, 'GET');
                if ($res) {
                    $json = json_decode($res, true);
                    if (empty($json['access_token'])) {
                        throw new Exception('Ошибка получения токена');
                    }
                    return $json['access_token'];
                }
				echo $url;
                throw new Exception('Ошибка получения токена');
                break;
            case 'vkontakte':
                $url = "https://oauth.vk.com/access_token?client_id=" . $this->app_id .
                        "&client_secret=" . $this->app_secret .
                        "&code=" . $code .
                        "&redirect_uri=" . $this->redirect_uri;

                $res = $this->request($url, false, 'GET');
                $res_arr = json_decode($res, true);
                if (empty($res_arr['access_token'])) {
                    throw new Exception('Ошибка получения токена');
                }
                $this->data = $res_arr;
                return $res_arr['access_token'];
            case 'google':
                $gClient = $this->getClient();
                $gClient->authenticate($code);
                $token = $gClient->getAccessToken();
                if (!$token) {
                    throw new Exception('Ошибка получения токена');
                }
                return $token;
            case 'yandex':
                $params = array(
                    'code' => $code,
                    'grant_type' => 'authorization_code',
                    'client_id' => $this->app_id,
                    'client_secret' => $this->app_secret
                );
                $url = 'https://oauth.yandex.ru/token';
                $info = $this->request($url, $params);
                if (!$info) {
                    throw new Exception('Ошибка получения токена');
                }
                $info = json_decode($info, true);
                return $info['access_token'];
            case 'twitter':
                if (empty($_SESSION['twitter_token']) || empty($_SESSION['twitter_token_secret'])) {
                    throw new Exception('Ошибка получения токена');
                }
                $client = $this->getClient();
                $oauth_verifier = sfContext::getInstance()->getRequest()->getParameter('oauth_verifier');
                $access_token = $client->getAccessToken($oauth_verifier);
                if ($client->http_code != '200') {
                    throw new Exception('Ошибка получения токена');
                }
                //dunno why is all this shit with token
                return $access_token;
            case 'mailru':
                $data = array(
                    'client_id' => $this->app_id,
                    'client_secret' => $this->app_secret,
                    'grant_type' => 'authorization_code',
                    'code' => trim($code),
                    'redirect_uri' => $this->redirect_uri
                );

                $res = $this->request('https://connect.mail.ru/oauth/token', $data);
                if(!$res){
                    throw new Exception('Ошибка получения токена');
                }
                $token = json_decode($res, true);
                return $token;
        }
    }

    public function getUserProfile($token) {
        switch ($this->type) {
            case 'facebook':
                $dataurl = 'https://graph.facebook.com/me?access_token=' . $token . '&fields=name,email';
                $res = $this->request($dataurl, false, 'GET');
                if (!$res) {
                    throw new Exception('Ошибка получения профиля');
                }
                $profile = json_decode($res, true);
				try{
					$name = explode(' ', $profile['name']);
					$name = array_filter($name);
					$profile['first_name'] = array_shift($name);
					$profile['last_name'] = array_shift($name);
				}catch(Exception $e){
					
				}
				return $profile;
            case 'vkontakte':
                $url_profile = "https://api.vk.com/method/users.get?user_id={$this->data['user_id']}&access_token={$token}&fields=first_name,last_name,photo_200,email";
                $res = $this->request($url_profile, false, 'GET');
                if (!$res) {
                    throw new Exception('Ошибка получения профиля');
                }
                $res = json_decode($res, true);
                $profile = $res['response'][0];
                $profile['id'] = $this->data['user_id'];
                $profile['email'] = $this->data['email'];
                return $profile;
            case 'yandex':
                $params = array(
                    'format' => 'json',
                    'oauth_token' => $token
                );
                $url = 'https://login.yandex.ru/info';
                $res = $this->request($url, $params, 'GET');
                if (!$res) {
                    throw new Exception('Ошибка получения профиля');
                }
                $profile = json_decode($res, true);
                $profile['email'] = $profile['default_email'];
                return $profile;
            case 'google':
                $profile = $this->auth_service->userinfo->get();
                $profile['first_name'] = $profile['given_name'];
                $profile['last_name'] = $profile['family_name'];
                return $profile;
            case 'twitter':
                $_SESSION['twitter_token'] = $token['oauth_token'];
                $_SESSION['twitter_token_secret'] = $token['oauth_token_secret'];                
                $client = $this->getClient();
                $res = $client->oAuthRequest('https://api.twitter.com/1.1/account/verify_credentials.json', 'GET', array(
                    'oauth_verifier' => sfContext::getInstance()->getRequest()->getParameter('oauth_verifier')
                        ));
                if (!$res)
                    throw new Exception('Ошибка получения профиля');
                $profile = json_decode($res, true);
                $name = explode(' ', $profile['name']);
                $profile['first_name'] = $name[0];
                $profile['last_name'] = $name[1];                
                return $profile;
            case 'mailru':
                $params = array(
                    'app_id' => $this->app_id,
                    'method' => 'users.getInfo',
                    'secure' => 1,
                    'session_key' => $token['access_token'],
                    'uids' => $token['x_mailru_vid'],
                );
                $sParams = '';
                foreach($params as $key=>$value)
                    $sParams .= "$key=$value";
                $signature = md5($sParams . $this->app_secret);
                $params['sig'] = $signature;

                $res = $this->request('http://www.appsmail.ru/platform/api', $params, 'GET');

                if(!$res){
                    throw new Exception('Ошибка получения профиля');
                }
                $res = json_decode ($res, true);
                $res = $res[0];
                $res['id'] = $res['uid'];
                return $res;
        }
    }

    public function signin($profile) {

        $email = !empty($profile['email']) ? $profile['email'] : '';
        $s_user = Q::c('SocialUser', 'u')
                ->where("u.{$this->type}_user_id = ?", $profile['id'])
                ->fetchOne()
        ;
        if ($s_user) {
            $s_user->set("{$this->type}_user_info", serialize($profile));
            $s_user->save();
            if ($s_user->getUserId()) {
                sfContext::getInstance()->getUser()->signIn($s_user->getUser());
                return 'logged';
            }
        }
        if ($email) {
            $user = Q::c('sfGuardUser', 'u')
                    ->where('u.email_address = ?', $email)
                    ->fetchOne()
            ;
            if ($user) {
                $bridge = new SocialBridge;
                $bridge->fromArray(array(
                    'user_id' => $user->getId(),
                    'email' => $email,
                    'token' => sha1(time() . $email),
                    'network' => $this->type,
                    'network_user_id' => $profile['id']
                ));
                $bridge->save();
                sfContext::getInstance()->getUser()->setAttribute('social_bridge_id', $bridge->getId());
                return 'bridge';
            }
        }

        if (!$s_user) {
            $s_user = new SocialUser;
            $s_user->set("{$this->type}_user_id", $profile['id']);
            $s_user->set("{$this->type}_user_info", serialize($profile));
            $s_user->setEmail($email);
            $s_user->save();
        }

        $email_address = $email ? $email : $profile['id'] . '@' . $this->type . '.com'; //true or dummy email
        $user = new sfGuardUser;
        $user->fromArray(array(
            'username' => $email_address,
            'email_address' => $email_address,
            'password' => md5(time()),
            'is_active' => true
        ));
        $user->save();
        $s_user->setUserId($user->getId());
        $s_user->save();
        sfContext::getInstance()->getUser()->signIn($user);

        $user_profile = new Profile;
        $user_profile->fromArray(array(
            'first_name' => $profile['first_name'],
            'last_name' => $profile['last_name'],
            'user_id' => $user->getId(),
            'email' => $email
        ));
        $user_profile->fromSocialNetworkData($this->type, $profile);
        $user_profile->save();
        return 'created_and_logged';
    }

    public function request($url, $params = null, $method = 'POST', $debug = false) {
        $res = myCurl::request($url, $params, $method, $debug);
        return $res;
    }

    protected function getClient() {
        switch ($this->type) {
            case 'google':
                require_once sfConfig::get('sf_lib_dir') . '/vendor/vendor/google-api-php-client/src/Google_Client.php';
                require_once sfConfig::get('sf_lib_dir') . '/vendor/vendor/google-api-php-client/src/contrib/Google_Oauth2Service.php';
                $gClient = new Google_Client();
                $gClient->setApplicationName(MyConfig::get('oauth_google_app_name'));
                $gClient->setClientId($this->app_id);
                $gClient->setClientSecret($this->app_secret);
                $gClient->setRedirectUri($this->redirect_uri);
                $gClient->setScopes('https://www.googleapis.com/auth/plus.login https://www.googleapis.com/auth/userinfo.email');
                $gClient->setDeveloperKey(MyConfig::get('oauth_google_api_key'));
                $this->auth_service = new Google_Oauth2Service($gClient);
                return $gClient;

            case 'twitter':
                $token = empty($_SESSION['twitter_token']) ? null : $_SESSION['twitter_token'];
                $token_secret = empty($_SESSION['twitter_token_secret']) ? null : $_SESSION['twitter_token_secret'];
                require_once sfConfig::get('sf_lib_dir') . '/vendor/vendor/twitter/twitteroauth.php';
                return new TwitterOAuth($this->app_id, $this->app_secret, $token, $token_secret);
        }
    }

    public function getCodeParameterName() {
        switch ($this->type) {
            case 'twitter':
                return 'oauth_token';
            default:
                return 'code';
        }
    }

}
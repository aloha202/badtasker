<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of ProjectHelper
 *
 * @author Алекс
 */
class ProjectHelper {

    protected static function getContext() {
        return sfContext::getInstance();
    }

    protected static function _is_mod_active($mod_action) {
        $context = sfContext::getInstance();
        $splitted = explode('/', $mod_action);
        $mod = array_shift($splitted);
        $action = count($splitted) ? array_shift($splitted) : false;
        if ($action) {
            return $context->getModuleName() == $mod && $context->getActionName() == $action;
        } else {
            return $context->getModuleName() == $mod;
        }
    }

    public static function isModActive($mod_action) {
        if (is_array($mod_action)) {
            foreach ($mod_action as $m_a) {
                if (self::_is_mod_active($m_a)) {
                    return true;
                }
            }
            return false;
        }
        return self::_is_mod_active($mod_action);
    }

    public static function getMenu($root_name, $level = 1, $debug = false) {
        $root = Doctrine::getTable('MenuItem')->findOneByRootName($root_name);
        if (!$root) {
            throw new sfException('Unknown root name ' . $root_name);
        }
        $tree = Doctrine::getTable('MenuItem')->getTree();
        $options = array(
            'root_id' => $root->getRootId(),
            'level' => $level
        );
        $menu = $tree->fetchTree($options);
        $collection = new Doctrine_Collection('MenuItem');
        foreach ($menu as $item) {
            if ($item->getLevel() >= $level) {
                $collection->add($item);
            }
        }
        return $collection;
    }

    public static function setPageActive($page) {
        sfContext::getInstance()->set('current_page', $page);
    }

    public static function isPageActive($page) {
        $context = sfContext::getInstance();
        return ($context->has('current_page')
                && $context->get('current_page')->getId() == $page->getId())
                ||
                ($page->getIsModulePage() && $page->getModuleName() == $context->getModuleName());
    }

    public static function rus_to_translit($string) {
        $converter = array(
            'а' => 'a', 'б' => 'b', 'в' => 'v', 'г' => 'g', 'д' => 'd', 'е' => 'e', 'ё' => 'e', 'ж' => 'zh',
            'з' => 'z', 'и' => 'i', 'й' => 'y', 'к' => 'k', 'л' => 'l', 'м' => 'm', 'н' => 'n', 'о' => 'o',
            'п' => 'p', 'р' => 'r', 'с' => 's', 'т' => 't', 'у' => 'u', 'ф' => 'f', 'х' => 'h', 'ц' => 'c',
            'ч' => 'ch', 'ш' => 'sh', 'щ' => 'sch', 'ь' => '', 'ы' => 'y', 'ъ' => '', 'э' => 'e', 'ю' => 'yu',
            'я' => 'ya',
            'А' => 'A', 'Б' => 'B', 'В' => 'V', 'Г' => 'G', 'Д' => 'D', 'Е' => 'E', 'Ё' => 'E', 'Ж' => 'ZH',
            'З' => 'Z', 'И' => 'I', 'Й' => 'Y', 'К' => 'K', 'Л' => 'L', 'М' => 'M', 'Н' => 'N', 'О' => 'O',
            'П' => 'P', 'Р' => 'R', 'С' => 'S', 'Т' => 'T', 'У' => 'U', 'Ф' => 'F', 'Х' => 'H', 'Ц' => 'C',
            'Ч' => 'CH', 'Ш' => 'SH', 'Щ' => 'SCH', 'Ь' => '', 'Ы' => 'Y', 'Ъ' => '', 'Э' => 'E', 'Ю' => 'YU',
            'Я' => 'YA',
        );

        return strtr($string, $converter);
    }

    public static function rus_to_slugify($string, $delim = '_') {
        $string = self::rus_to_translit($string);

        $string = strtolower($string);
        $string = preg_replace('/\W+/', $delim, $string);

        // trim and lowercase
        $string = strtolower(trim($string, $delim));
        return $string;
    }
    public static function rus_to_slugify_builder($value, $record)
    {
        //return Doctrine_Inflector::urlize($value);

    } 
    
    public static function slugify_ru($string, $delim = '-')
    {
        return self::rus_to_slugify($string, $delim);
    }
    
    
    public static function slug_builder($value, $record)
    {

        $lang = sfContext::getInstance()->getUser()->getGuardUser()->getLang();
        if(method_exists('ProjectHelper', 'slugify_' . $lang)){
            return call_user_func('ProjectHelper::slugify_' . $lang, $value);
        }                
        return Doctrine_Inflector::urlize($value);        
        /*
        $modified = $record->getModified();
        if(isset($modified['slug'])){
            if($modified['slug']){
                return $modified['slug'];
            }else{

            }
        }else{
            if($record->getSlug()){
                return $record->getSlug();
            }
        }
        
        return $record->getSlug();        
         * 
         */
    }

    public static function recursive_remove_directory($directory, $empty=FALSE) {
        if (substr($directory, -1) == '/') {
            $directory = substr($directory, 0, -1);
        }
        if (!file_exists($directory) || !is_dir($directory)) {
            return FALSE;
        } elseif (is_readable($directory)) {
            $handle = opendir($directory);
            while (FALSE !== ($item = readdir($handle))) {
                if ($item != '.' && $item != '..') {
                    $path = $directory . '/' . $item;
                    if (is_dir($path)) {
                        self::recursive_remove_directory($path);
                    } else {
                        unlink($path);
                    }
                }
            }
            closedir($handle);
            if ($empty == FALSE) {
                if (!rmdir($directory)) {
                    return FALSE;
                }
            }
        }
        return TRUE;
    }

    public static function sendEmail($to, $subject, $body, $attach = false) {
        $from = sfConfig::get('app_email_noreply');

       self::XMail($to, $subject, $body, $attach);
    }

    public static function sendAdminEmail($subject, $body, $attach = false) {
        $to = MyConfig::get('administrator_email');
        $from = sfConfig::get('app_email_noreply');
        self::XMail($to, $subject, $body, $attach);
    }
    
    public static function XMail($to, $subj, $text, $filename = false, $copy = false) {
        try {
            if (!empty($_SERVER['SERVER_NAME'])) {
                $server = $_SERVER['SERVER_NAME'];
            } else {
                $server = 'dev2';
            }
            $text = str_replace('src="/uploads/images', 'src="http://' . $server . '/uploads/images', $text);

            $pEmailGmail = MyConfig::get('smtp_mailbox'); //'smtp@dostavka.tk';
            $pPasswordGmail = MyConfig::get('smtp_password');
            ;
            $pFromEmail = MyConfig::get('smtp_mailbox');
            ;
            $pFromName = MyConfig::get('smtp_display_name'); //display name
            /*
              $from_expl = explode(' ', trim($from));
              if(count($from_expl) > 1){
              $pFromName = $from_expl[0];
              $pFromEmail = str_replace(array('<', '>'), '', $from_expl[1]);
              }
             * 
             */

            $pTo = $to; //destination email
            $pSubjetc = $subj; //the subjetc 
            $pBody = $text; //body html
    

            if (!class_exists('Swift_SmtpTransport')) {
                require_once sfConfig::get('sf_lib_dir') . '/vendor/vendor/swiftmailer/swift_required.php';
                /*
                  Swift::autoload('Swift_Transport_SmtpAgent');
                  Swift::autoload('Swift_Transport');
                  Swift::autoload('Swift_Transport_AbstractSmtpTransport');
                  Swift::autoload('Swift_Transport_EsmtpTransport');
                  Swift::autoload('Swift_SmtpTransport');
                  Swift::autoload('Swift_Mailer');
                  Swift::autoload('Swift_Mime_MimeEntity');
                  Swift::autoload('Swift_Mime_SimpleMimeEntity');
                  Swift::autoload('Swift_Mime_MimePart');
                  Swift::autoload('Swift_Mime_SimpleMessage');
                  Swift::autoload('Swift_Message');
                  Swift::autoload('Swift_Attachment');
                 * 
                 */
            }

            $transport = Swift_SmtpTransport::newInstance(MyConfig::get('smtp_server'), MyConfig::get('smtp_port', 465), 'tls')
                    ->setUsername($pEmailGmail)
                    ->setPassword($pPasswordGmail);

            $mMailer = Swift_Mailer::newInstance($transport);

            $mEmail = Swift_Message::newInstance();
            if ($filename) {
                $info = pathinfo($filename);
                $mEmail->attach(new Swift_Attachment(file_get_contents($filename), $info['basename']));
            }

            $mEmail->setSubject($pSubjetc);
            $mEmail->setTo($pTo);
            $mEmail->setFrom(array($pFromEmail => $pFromName));
            $mEmail->setBody($pBody, 'text/html'); //body html	
            if ($copy) {
                $copy = explode(',', $copy);
                $mEmail->setCc($copy);
            }

            return $mMailer->send($mEmail);
        } catch (Exception $e) {
            $err = new EmailError;
            $err->fromArray(array(
                'email_from' => $pFromEmail,
                'email_to' => $to,
                'subject' => $subj,
                'body' => $text,
                'cc' => $copy,
                'file' => $filename,
                'errmes' => $e->getMessage()
            ));
            $err->save();
            return 0;
        }
    }     

    public static function generateEmailAddress() {
        return md5(microtime()) . '@default.org';
    }

    public static function getBanner($banner_place_name) {
        $q = Doctrine::getTable('Banner')
                ->createQuery('b')
                ->where('b.BannerPlace.name = ?', $banner_place_name)
                ->andWhere('b.is_active = ?', true)
                ->orderBy('RAND()')
        ;
        $banner = $q->fetchOne();
        if (!$banner) {
            return '';
        }
        $banner->setViewCount($banner->getViewCount() + 1);
        $banner->save();
        return $banner->getCode();
    }

    public static function pager($model, $pages, $query, $request) {
        $pager = new sfDoctrinePager($model, $pages);
        $pager->setPage($request->getParameter('page'));
        $pager->setQuery($query);
        $pager->init();
        return $pager;
    }

    public static function time($time) {
        return date('H:i', strtotime($time));
    }



    public static function price($val) {
        if (is_object($val)) {
            $val = $val->getPrice();
        }
        return intval($val) . 'p.';
    }

    public static function ru_months_array() {
        return array(
            '01' => 'января',
            '02' => 'февраля',
            '03' => 'марта',
            '04' => 'апреля',
            '05' => 'мая',
            '06' => 'июня',
            '07' => 'июля',
            '08' => 'августа',
            '09' => 'сентября',
            '10' => 'октября',
            '11' => 'ноября',
            '12' => 'декабря'
        );
    }



    public static function getCsvArray($str, $delim = false) {
        if (!$delim) {
            $delim = sfConfig::get('app_csv_delimiter');
        }
        $arr = explode("\n", $str);
        for ($i = 0; $i < count($arr); $i++) {
            $row = explode($delim, $arr[$i]);
            $arr[$i] = $row;
        }
        return $arr;
    }

    public static function giveXlsFromCsv($csv, $name, $stylizer = false) {
        $csv_arr = ProjectHelper::getCsvArray($csv);
        require_once sfConfig::get('sf_lib_dir') . '/vendor/vendor/PHPExcel.php';
        $objPHPExcel = new PHPExcel();
        $sheet = $objPHPExcel->setActiveSheetIndex(0);
        $letters = array();

        $x = 0;
        $y = count($csv_arr);
        for ($i = 0; $i < count($csv_arr); $i++) {
            for ($j = 0; $j < count($csv_arr[$i]); $j++) {
                $letter = self::xlsGetLetter($j);
                $cell = $sheet->getCellByColumnAndRow($j, $i + 1);
                $val = $csv_arr[$i][$j];
                $cell->setValue($val);
                $w = isset($letters[$letter]) ? $letters[$letter] : 0;
                if (strlen($val) > $w) {
                    $w = strlen($val);
                }
                $letters[$letter] = $w;
                if (!$x) {
                    //$sheet->getColumnDimension($j)->setWidth(100);
                }
            }
            if (!$x) {
                $x = $j;
            }
        }

        foreach ($letters as $letter => $w) {
            $sheet->getColumnDimension($letter)->setWidth($w);
        }

        if ($stylizer) {
            call_user_func_array('StylizeXls::' . $stylizer, array($sheet, $x, $y));
        }
        $objWriter = PHPExcel_IOFactory::createWriter($objPHPExcel, 'Excel2007');


        //$file = sfConfig::get('sf_web_dir') . '/uploads/xls/zakaz' . $order->getId() . '.xlsx';
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');
        header('Content-Disposition: attachment;filename="' . $name . '"');
        header('Cache-Control: max-age=0');
        $objWriter->save('php://output');
    }
    
    public static function xlsGetLetter($i) {
        $letters = array('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z');
        $letter = $letters[$i % count($letters)];
        return str_pad($letter, floor($i / count($letters)) + 1, $letter);
    }    

    public static function getEmailFromObject($object) {
        try {
            return $object->getEmail();
        } catch (Exception $e) {
            
        }
        try {
            return $object->getEmailAddress();
        } catch (Exception $e) {
            
        }
        return '';
    }

    public static function cut($str, $len = 100) {
        $str = strip_tags($str);
        $arr = explode(' ', $str);
        $str2 = '';
        foreach ($arr as $i => $s) {
            $str2 .= ($i ? ' ' : '') . $s;
            if (strlen($str2) >= $len) {
                return $str2 . '...';
            }
        }
        return $str;
    }
    
    public static function is_local()
    {
        return $_SERVER['SERVER_ADDR'] == '127.0.0.1';
    }
    
    public static function is_dev()
    {
        return self::is_local();
    }
    
    public static function is_test()
    {
        return false;
    }
    
    public static function is_live() {
        return $_SERVER['SERVER_NAME'] == sfConfig::get('app_live_server')
                || $_SERVER['SERVER_NAME'] == 'www.' . sfConfig::get('app_live_server')
        ;
    } 
    
    protected static $appRouting = array();

    public static function generateApplicationUrl($application, $name, $parameters = array()) {
        return self::getAppRouting($application)->generate($name, $parameters);
    }

    protected static function getAppRouting($application) {
        if (empty(self::$appRouting[$application])) {
            self::$appRouting[$application] = new sfPatternRouting(new sfEventDispatcher());

            $config = new sfRoutingConfigHandler();
            $routes = $config->evaluate(array(sfConfig::get('sf_apps_dir') . '/' . $application . '/config/routing.yml'));

            self::$appRouting[$application]->setRoutes($routes);
        }

        return self::$appRouting[$application];
    }
    
    
    public static function banIpAddress($reason = null)
    {
        return false;

        $bannedIp = new BannedIp;
        $bannedIp->fromArray(array(
           'ip' => $_SERVER['REMOTE_ADDR'],
            'reason' => $reason
        ));
        $bannedIp->save();
        Notifier::notify('666', 'Заблокирован айпи адрес');
        self::forward_banned_ip();
    }
    
    public static function isIpBanned()
    {
        return false;


        $interval = MyConfig::get('ip_ban_lifetime', '1 HOUR');
        $q = Q::c('BannedIp', 'i')
                ->where('i.ip = ?', $_SERVER['REMOTE_ADDR'])
                ->addWhere("i.created_at > DATE_SUB(NOW(), INTERVAL $interval)")
                ;
        $banned_ip = $q->fetchOne();
        if($banned_ip)
        {
            self::getContext()->getUser()->setAttribute('banned_ip_id', $banned_ip->getId());
            return true;
        }
        return false;
    }
    
    public static function forward_banned_ip()
    {
        $context = sfContext::getInstance();
        $res = $context->checkModuleAction('default', 'ipBanned');
        if(!$res){
            $context->getController()->redirect('default/ipBanned');
        }
         //   
        
    }
    
  public static function asPhp($variable)
  {
    return str_replace(array("\n", 'array ('), array('', 'array('), var_export($variable, true));
  }

  public static function getColorPalette(){
    return array(
        '' => 'default',
        '#ffebee' => 'red lighten-5',
        '#ffcdd2' => 'red lighten-4',
        '#ef9a9a' => 'red lighten-3',
        '#e57373' => 'red lighten-2',
        '#ef5350' => 'red lighten-1',
        '#f44336' => 'red',
        '#e53935' => 'red darken-1',
        '#d32f2f' => 'red darken-2',
        '#c62828' => 'red darken-3',
        '#b71c1c' => 'red darken-4',
        '#ff8a80' => 'red accent-1',
        '#ff5252' => 'red accent-2',
        '#ff1744' => 'red accent-3',
        '#d50000' => 'red accent-4',
        '#fce4ec' => 'pink lighten-5',
        '#f8bbd0' => 'pink lighten-4',
        '#f48fb1' => 'pink lighten-3',
        '#f06292' => 'pink lighten-2',
        '#ec407a' => 'pink lighten-1',
        '#e91e63' => 'pink',
        '#d81b60' => 'pink darken-1',
        '#c2185b' => 'pink darken-2',
        '#ad1457' => 'pink darken-3',
        '#880e4f' => 'pink darken-4',
        '#ff80ab' => 'pink accent-1',
        '#ff4081' => 'pink accent-2',
        '#f50057' => 'pink accent-3',
        '#c51162' => 'pink accent-4',
        '#f3e5f5' => 'purple lighten-5',
        '#e1bee7' => 'purple lighten-4',
        '#ce93d8' => 'purple lighten-3',
        '#ba68c8' => 'purple lighten-2',
        '#ab47bc' => 'purple lighten-1',
        '#9c27b0' => 'purple',
        '#8e24aa' => 'purple darken-1',
        '#7b1fa2' => 'purple darken-2',
        '#6a1b9a' => 'purple darken-3',
        '#4a148c' => 'purple darken-4',
        '#ea80fc' => 'purple accent-1',
        '#e040fb' => 'purple accent-2',
        '#d500f9' => 'purple accent-3',
        '#aa00ff' => 'purple accent-4',
        '#ede7f6' => 'deep-purple lighten-5',
        '#d1c4e9' => 'deep-purple lighten-4',
        '#b39ddb' => 'deep-purple lighten-3',
        '#9575cd' => 'deep-purple lighten-2',
        '#7e57c2' => 'deep-purple lighten-1',
        '#673ab7' => 'deep-purple',
        '#5e35b1' => 'deep-purple darken-1',
        '#512da8' => 'deep-purple darken-2',
        '#4527a0' => 'deep-purple darken-3',
        '#311b92' => 'deep-purple darken-4',
        '#b388ff' => 'deep-purple accent-1',
        '#7c4dff' => 'deep-purple accent-2',
        '#651fff' => 'deep-purple accent-3',
        '#6200ea' => 'deep-purple accent-4',
        '#e8eaf6' => 'indigo lighten-5',
        '#c5cae9' => 'indigo lighten-4',
        '#9fa8da' => 'indigo lighten-3',
        '#7986cb' => 'indigo lighten-2',
        '#5c6bc0' => 'indigo lighten-1',
        '#3f51b5' => 'indigo',
        '#3949ab' => 'indigo darken-1',
        '#303f9f' => 'indigo darken-2',
        '#283593' => 'indigo darken-3',
        '#1a237e' => 'indigo darken-4',
        '#8c9eff' => 'indigo accent-1',
        '#536dfe' => 'indigo accent-2',
        '#3d5afe' => 'indigo accent-3',
        '#304ffe' => 'indigo accent-4',
        '#e3f2fd' => 'blue lighten-5',
        '#bbdefb' => 'blue lighten-4',
        '#90caf9' => 'blue lighten-3',
        '#64b5f6' => 'blue lighten-2',
        '#42a5f5' => 'blue lighten-1',
        '#2196f3' => 'blue',
        '#1e88e5' => 'blue darken-1',
        '#1976d2' => 'blue darken-2',
        '#1565c0' => 'blue darken-3',
        '#0d47a1' => 'blue darken-4',
        '#82b1ff' => 'blue accent-1',
        '#448aff' => 'blue accent-2',
        '#2979ff' => 'blue accent-3',
        '#2962ff' => 'blue accent-4',
        '#e1f5fe' => 'light-blue lighten-5',
        '#b3e5fc' => 'light-blue lighten-4',
        '#81d4fa' => 'light-blue lighten-3',
        '#4fc3f7' => 'light-blue lighten-2',
        '#29b6f6' => 'light-blue lighten-1',
        '#03a9f4' => 'light-blue',
        '#039be5' => 'light-blue darken-1',
        '#0288d1' => 'light-blue darken-2',
        '#0277bd' => 'light-blue darken-3',
        '#01579b' => 'light-blue darken-4',
        '#80d8ff' => 'light-blue accent-1',
        '#40c4ff' => 'light-blue accent-2',
        '#00b0ff' => 'light-blue accent-3',
        '#0091ea' => 'light-blue accent-4',
        '#e0f7fa' => 'cyan lighten-5',
        '#b2ebf2' => 'cyan lighten-4',
        '#80deea' => 'cyan lighten-3',
        '#4dd0e1' => 'cyan lighten-2',
        '#26c6da' => 'cyan lighten-1',
        '#00bcd4' => 'cyan',
        '#00acc1' => 'cyan darken-1',
        '#0097a7' => 'cyan darken-2',
        '#00838f' => 'cyan darken-3',
        '#006064' => 'cyan darken-4',
        '#84ffff' => 'cyan accent-1',
        '#18ffff' => 'cyan accent-2',
        '#00e5ff' => 'cyan accent-3',
        '#00b8d4' => 'cyan accent-4',
        '#e0f2f1' => 'teal lighten-5',
        '#b2dfdb' => 'teal lighten-4',
        '#80cbc4' => 'teal lighten-3',
        '#4db6ac' => 'teal lighten-2',
        '#26a69a' => 'teal lighten-1',
        '#009688' => 'teal',
        '#00897b' => 'teal darken-1',
        '#00796b' => 'teal darken-2',
        '#00695c' => 'teal darken-3',
        '#004d40' => 'teal darken-4',
        '#a7ffeb' => 'teal accent-1',
        '#64ffda' => 'teal accent-2',
        '#1de9b6' => 'teal accent-3',
        '#00bfa5' => 'teal accent-4',
        '#e8f5e9' => 'green lighten-5',
        '#c8e6c9' => 'green lighten-4',
        '#a5d6a7' => 'green lighten-3',
        '#81c784' => 'green lighten-2',
        '#66bb6a' => 'green lighten-1',
        '#4caf50' => 'green',
        '#43a047' => 'green darken-1',
        '#388e3c' => 'green darken-2',
        '#2e7d32' => 'green darken-3',
        '#1b5e20' => 'green darken-4',
        '#b9f6ca' => 'green accent-1',
        '#69f0ae' => 'green accent-2',
        '#00e676' => 'green accent-3',
        '#00c853' => 'green accent-4',
        '#f1f8e9' => 'light-green lighten-5',
        '#dcedc8' => 'light-green lighten-4',
        '#c5e1a5' => 'light-green lighten-3',
        '#aed581' => 'light-green lighten-2',
        '#9ccc65' => 'light-green lighten-1',
        '#8bc34a' => 'light-green',
        '#7cb342' => 'light-green darken-1',
        '#689f38' => 'light-green darken-2',
        '#558b2f' => 'light-green darken-3',
        '#33691e' => 'light-green darken-4',
        '#ccff90' => 'light-green accent-1',
        '#b2ff59' => 'light-green accent-2',
        '#76ff03' => 'light-green accent-3',
        '#64dd17' => 'light-green accent-4',
        '#f9fbe7' => 'lime lighten-5',
        '#f0f4c3' => 'lime lighten-4',
        '#e6ee9c' => 'lime lighten-3',
        '#dce775' => 'lime lighten-2',
        '#d4e157' => 'lime lighten-1',
        '#cddc39' => 'lime',
        '#c0ca33' => 'lime darken-1',
        '#afb42b' => 'lime darken-2',
        '#9e9d24' => 'lime darken-3',
        '#827717' => 'lime darken-4',
        '#f4ff81' => 'lime accent-1',
        '#eeff41' => 'lime accent-2',
        '#c6ff00' => 'lime accent-3',
        '#aeea00' => 'lime accent-4',
        '#fffde7' => 'yellow lighten-5',
        '#fff9c4' => 'yellow lighten-4',
        '#fff59d' => 'yellow lighten-3',
        '#fff176' => 'yellow lighten-2',
        '#ffee58' => 'yellow lighten-1',
        '#ffeb3b' => 'yellow',
        '#fdd835' => 'yellow darken-1',
        '#fbc02d' => 'yellow darken-2',
        '#f9a825' => 'yellow darken-3',
        '#f57f17' => 'yellow darken-4',
        '#ffff8d' => 'yellow accent-1',
        '#ffff00' => 'yellow accent-2',
        '#ffea00' => 'yellow accent-3',
        '#ffd600' => 'yellow accent-4',
        '#fff8e1' => 'amber lighten-5',
        '#ffecb3' => 'amber lighten-4',
        '#ffe082' => 'amber lighten-3',
        '#ffd54f' => 'amber lighten-2',
        '#ffca28' => 'amber lighten-1',
        '#ffc107' => 'amber',
        '#ffb300' => 'amber darken-1',
        '#ffa000' => 'amber darken-2',
        '#ff8f00' => 'amber darken-3',
        '#ff6f00' => 'amber darken-4',
        '#ffe57f' => 'amber accent-1',
        '#ffd740' => 'amber accent-2',
        '#ffc400' => 'amber accent-3',
        '#ffab00' => 'amber accent-4',
        '#fff3e0' => 'orange lighten-5',
        '#ffe0b2' => 'orange lighten-4',
        '#ffcc80' => 'orange lighten-3',
        '#ffb74d' => 'orange lighten-2',
        '#ffa726' => 'orange lighten-1',
        '#ff9800' => 'orange',
        '#fb8c00' => 'orange darken-1',
        '#f57c00' => 'orange darken-2',
        '#ef6c00' => 'orange darken-3',
        '#e65100' => 'orange darken-4',
        '#ffd180' => 'orange accent-1',
        '#ffab40' => 'orange accent-2',
        '#ff9100' => 'orange accent-3',
        '#ff6d00' => 'orange accent-4',
        '#fbe9e7' => 'deep-orange lighten-5',
        '#ffccbc' => 'deep-orange lighten-4',
        '#ffab91' => 'deep-orange lighten-3',
        '#ff8a65' => 'deep-orange lighten-2',
        '#ff7043' => 'deep-orange lighten-1',
        '#ff5722' => 'deep-orange',
        '#f4511e' => 'deep-orange darken-1',
        '#e64a19' => 'deep-orange darken-2',
        '#d84315' => 'deep-orange darken-3',
        '#bf360c' => 'deep-orange darken-4',
        '#ff9e80' => 'deep-orange accent-1',
        '#ff6e40' => 'deep-orange accent-2',
        '#ff3d00' => 'deep-orange accent-3',
        '#dd2c00' => 'deep-orange accent-4',
        '#efebe9' => 'brown lighten-5',
        '#d7ccc8' => 'brown lighten-4',
        '#bcaaa4' => 'brown lighten-3',
        '#a1887f' => 'brown lighten-2',
        '#8d6e63' => 'brown lighten-1',
        '#795548' => 'brown',
        '#6d4c41' => 'brown darken-1',
        '#5d4037' => 'brown darken-2',
        '#4e342e' => 'brown darken-3',
        '#3e2723' => 'brown darken-4',
        '#fafafa' => 'grey lighten-5',
        '#f5f5f5' => 'grey lighten-4',
        '#eeeeee' => 'grey lighten-3',
        '#e0e0e0' => 'grey lighten-2',
        '#bdbdbd' => 'grey lighten-1',
        '#9e9e9e' => 'grey',
        '#757575' => 'grey darken-1',
        '#616161' => 'grey darken-2',
        '#424242' => 'grey darken-3',
        '#212121' => 'grey darken-4',
        '#eceff1' => 'blue-grey lighten-5',
        '#cfd8dc' => 'blue-grey lighten-4',
        '#b0bec5' => 'blue-grey lighten-3',
        '#90a4ae' => 'blue-grey lighten-2',
        '#78909c' => 'blue-grey lighten-1',
        '#607d8b' => 'blue-grey',
        '#546e7a' => 'blue-grey darken-1',
        '#455a64' => 'blue-grey darken-2',
        '#37474f' => 'blue-grey darken-3',
        '#263238' => 'blue-grey darken-4',
        '#000000' => 'black',
        '#ffffff' => 'white'
    );
  }

  public static function getClassFromColor($color){
      if($color){
          $palette = static::getColorPalette();
          return !empty($palette[$color]) ? $palette[$color] : '';
      }
      return '';
  }

    public static function getTextClassFromColor($color){
        if($color){
            $palette = static::getColorPalette();
            $class = !empty($palette[$color]) ? $palette[$color] : '';
            if($class){
                $expl = explode(' ', $class);
                $expl[0] = $expl[0] . '-text';
                if(!empty($expl[1])){
                    $expl[1] = 'text-' . $expl[1];
                }
                return $expl[0] . (!empty($expl[1]) ? (' ' . $expl[1]) : '');
            }
        }
        return '';
    }


    public static function createPrintablePeriod($period){
        $years = array();
        $months = array();
        $days = array();

        $yspan = 0;
        $mspan = 0;
        $curY = null;
        $curM = null;
        foreach($period as $date){
            $expl = explode('-', $date);
            $y = $expl[0];
            $m = $expl[1];
            $d = $expl[2];

            if($y != $curY){
                if($curY){
                    $years[] = array(
                        'year' => $curY,
                        'span' => $yspan
                    );
                }
                $curY = $y;
                $yspan = 1;
            }else{
                $yspan++;
            }

            if($m != $curM){
                if($curM){
                    $months[] = array(
                        'month' => date("F",mktime(0,0,0,intval($curM),1,2011)),
                        'span' => $mspan
                    );
                }
                $curM = $m;
                $mspan = 1;
            }else{
                $mspan++;
            }
            $days[] = array('day' => $d, 'fulldate' => $date);
        }
        $years[] = array(
            'year' => $curY,
            'span' => $yspan
        );
        $months[] = array(
            'month' => date("F",mktime(0,0,0,intval($curM),1,2011)),
            'span' => $mspan
        );
        return array(
            'years' => $years,
            'months' => $months,
            'days' => $days
        );

    }

    public static function createDateRangeArray($strDateFrom,$strDateTo)
    {
        // takes two dates formatted as YYYY-MM-DD and creates an
        // inclusive array of the dates between the from and to dates.

        // could test validity of dates here but I'm already doing
        // that in the main script

        $aryRange=array();

        $iDateFrom=mktime(1,0,0,substr($strDateFrom,5,2),     substr($strDateFrom,8,2),substr($strDateFrom,0,4));
        $iDateTo=mktime(1,0,0,substr($strDateTo,5,2),     substr($strDateTo,8,2),substr($strDateTo,0,4));

        if ($iDateTo>=$iDateFrom)
        {
            array_push($aryRange,date('Y-m-d',$iDateFrom)); // first entry
            while ($iDateFrom<$iDateTo)
            {
                $iDateFrom+=86400; // add 24 hours
                array_push($aryRange,date('Y-m-d',$iDateFrom));
            }
        }
        return $aryRange;
    }

    public static function cleanLinebreaks($text){
        return str_replace(array("\n", "\r", "\t"), '', $text);
    }

    public static function prepareForJs($text)
    {
        $text = self::cleanLinebreaks($text);
        $text = str_replace('\'', '\\\'', $text);
        return $text;
    }

}

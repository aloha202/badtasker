<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of myCurl
 *
 * @author Alaxa
 */
class myCurl {
   
	protected static $redirect_count = 0;
	protected static $max_redirect_count = 3;
	
    public static function post($url, $params)
    {
        
    }
    
    public static function get($url, $params)
    {
        
    }
    
    public static function request($url, $params = null, $method = 'POST', $debug = false)
    {
        $agent= 'Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322)';        

        $curl = curl_init();
        if ($method == 'POST') {
            curl_setopt($curl, CURLOPT_POST, 1);
            curl_setopt($curl, CURLOPT_POSTFIELDS, http_build_query($params)); // передаём параметры
        } elseif ($method == 'GET') {
            if($params)
                $url .= '?' . http_build_query($params);
        }
        curl_setopt($curl, CURLOPT_URL, $url); // url, куда будет отправлен запрос
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true);        
        if(strpos($url, 'https:') !== false){
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        }
        curl_setopt($curl, CURLOPT_USERAGENT, $agent);        
        $result = curl_exec($curl);
		$status = curl_getinfo($curl, CURLINFO_HTTP_CODE);		
		if($status == 302){
			if(self::$redirect_count < self::$max_redirect_count){
				self::$redirect_count++;
				$redirect = curl_getinfo($curl, CURLINFO_REDIRECT_URL);
				$result = self::request($redirect, $params, $method, $debug);
			}else{
				return false;
			}
		}		
        curl_close($curl);


        return $result;        
    }
    
}
<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of TextHelper
 *
 * @author Alaxa
 */
class TextHelper {

    protected static $data = null;

    protected static function getData() {
        if (!self::$data) {
            self::$data = array();
            $cult = sfContext::getInstance()->getUser()->getRealCulture();
            $q = Doctrine::getTable('TextBlock')
                    ->createQuery('b')
                    ->leftJoin('b.Translation bt')
                    ->where('b.application = ?', sfContext::getInstance()->getConfiguration()->getApplication())
                    ->andWhere('bt.lang = ?', $cult)
                    ->select('b.name, bt.text')
                    ->setHydrationMode(Doctrine::HYDRATE_ARRAY)
            ;
            $blocks = $q->execute();

            foreach ($blocks as $name => $block) {
                self::$data[$block['name']] = $block['Translation'][$cult]['text'];
            }
        }
        return self::$data;
    }

    protected static function get($key) {
        return isset(self::$data[$key]) ? self::$data[$key] : $key;
    }

    public static function getByKey($text, $replacements = array()) {
        self::getData();
        $key = mb_substr($text, 0, 255);
        if (!isset(self::$data[$key])) {
            if(sfConfig::get('sf_environment') == 'dev') {
                self::addByKey($key, $text);
            }
        }
        return strtr(self::get($key), $replacements ? : array());
    }

    public static function __($text, $replacements = array(), $compat = null) {
        if(sfContext::getInstance()->getConfiguration()->getApplication() == 'frontend'){
            return self::getByKey($text, $replacements);
        }
        return strtr($text, $replacements);

    }

    public static function ____($text, $replacements = array()) {
        return self::__(sfInflector::humanize($text), $replacements);
    }

    protected static function addByKey($key, $text) {
        myLog::write($key);
        $block = new TextBlock;
        $block->fromArray(array(
            'name' => $key,
            'text' => $text,
            'application' => sfContext::getInstance()->getConfiguration()->getApplication()
        ));
        $block->save();
        self::$data[$key] = $text;
    }

    public static function normalize($value) {
        $value = self::mb_ucfirst($value);
        $value = str_replace('& NBSP;', '&nbsp;', $value);
        $value = str_replace('% ', '%', $value);
        $value = str_replace(' %', '%', $value);
        return $value;
    }

    public static function mb_ucfirst($text) {
        return mb_strtoupper(mb_substr($text, 0, 1)) . mb_substr($text, 1, mb_strlen($text) - 1);
    }

}
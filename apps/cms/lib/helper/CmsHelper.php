<?php



    function menu_item($item, $template = "")
    {
        if(!empty($item[3])){
            $user = sfContext::getInstance()
                    ->getUser();
            if(!$user->hasCredential($item[3])){
                return '';
            }
        }
        $active = CmsHelper::isMenuActive($item) ? 'active' : '';
        return strtr($template, array(
            '%active%' => $active,
            '%link%' => link_to(__($item[0], array(), 'cms'), $item[1])
        ));
    }
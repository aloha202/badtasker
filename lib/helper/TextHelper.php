<?php

function __($val, $replacements = array(), $compat = null) {
    return T::__($val, $replacements);
}

function ____($val, $replacements = array()) {
    return T::____($val, $replacements);
}

function format_number_choice($text, $args = array(), $number, $catalogue = 'messages') {
    $translated = __($text, $args, $catalogue);

    $choice = new sfChoiceFormat();

    $retval = $choice->format($translated, $number);

    if ($retval === false) {
        throw new sfException(sprintf('Unable to parse your choice "%s".', $translated));
    }

    return $retval;
}

function format_country($country_iso, $culture = null) {
    $c = sfCultureInfo::getInstance($culture === null ? sfContext::getInstance()->getUser()->getCulture() : $culture);
    $countries = $c->getCountries();

    return isset($countries[$country_iso]) ? $countries[$country_iso] : '';
}

function format_language($language_iso, $culture = null) {
    $c = sfCultureInfo::getInstance($culture === null ? sfContext::getInstance()->getUser()->getCulture() : $culture);
    $languages = $c->getLanguages();

    return isset($languages[$language_iso]) ? $languages[$language_iso] : '';
}


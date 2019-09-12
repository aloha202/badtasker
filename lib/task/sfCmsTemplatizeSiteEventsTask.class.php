<?php

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 * Description of sfCmsTemplatizeSiteEvents
 *
 * @author Алекс
 */
class sfCmsTemplatizeSiteEventsTask extends sfBaseTask {

	protected function configure() {
		$this->namespace = 'cms';
		$this->name = 'templatize-site-events';
	}

	protected function execute($arguments = array(), $options = array()) {
		$databaseManager = new sfDatabaseManager($this->configuration);

		$file = sfConfig::get('sf_config_dir') . '/site_events.yml';
		$yaml = sfYaml::load($file);
		$processed_templates = array();
		foreach ($yaml['all']['events'] as $key => &$event) {
			$processed = false;
			if (!empty($event['callback']))
				continue;

			if (empty($event['name'])) {
				$event['name'] = sfInflector::humanize($key);
			}
			if (!empty($event['email_user'])) {
				if (!isset($event['email_user']['template']) && !isset($event['email_user']['callback'])) {
					$t_name = $key . '_user';
					$t_title = $event['name'] . '(user)';
					$t = new EmailTemplate;
					$t->fromArray(array(
						'name' => $t_name, 'title' => $t_title,
						'subject' => $event['email_user']['subject'],
						'message' => $event['email_user']['message']
					));
					$t->save();

					unset($event['email_user']['subject'], $event['email_user']['message']);
					$event['email_user']['template'] = $t_name;
					$processed = true;
				}
			}
			if (!empty($event['email_admin'])) {
				if (!isset($event['email_admin']['template']) && !isset($event['email_admin']['callback'])) {
					$t_name = $key . '_admin';
					$t_title = $event['name'] . '(admin)';
					$t = new EmailTemplate;
					$t->fromArray(array(
						'name' => $t_name, 'title' => $t_title,
						'subject' => $event['email_admin']['subject'],
						'message' => $event['email_admin']['message']
					));
					$t->save();

					unset($event['email_admin']['subject'], $event['email_admin']['message']);
					$event['email_admin']['template'] = $t_name;
					$processed = true;
				}
			}

			if ($processed) {
				$this->logSection('template processed', $key);
			}
		}

		require_once sfConfig::get('sf_lib_dir') . '/vendor/vendor/spyc-0.5/spyc.php';
		$str = Spyc::YAMLDump($yaml, 2, 60);
		file_put_contents($file, $str);

		$this->logSection('cms', "$file changes saved");
	}

}

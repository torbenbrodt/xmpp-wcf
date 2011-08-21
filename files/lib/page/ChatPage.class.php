<?php
// wcf imports
require_once(WCF_DIR.'lib/page/AbstractPage.class.php');

/**
 * SearchForm handles given search request and shows the extended search form.
 *
 * @package	de.easy-coding.wcf.xmpp
 */
class ChatPage extends AbstractPage {
	public $templateName = 'chat';

	/**
	 * supported languages
	 * @var array<string>
	 */
	protected $valid_languages = array(
		'de',
		'en',
		'fr',
	);

	/**
	 * @return	string
	 */
	protected function getLanguageCode() {
		return in_array(WCF::getLanguage()->getLanguageCode(), $this->valid_languages) 
			? WCF::getLanguage()->getLanguageCode() 
			: 'en';
	}

	/**
	 * @see Page::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables();
		
		$autojoin_str = '';
		foreach(explode("\n", XMPP_CHAT_AUTOJOIN) as $row) {
			$autojoin_str .= ',[\''.$row.'\']';
		}
		$autojoin_str = ltrim($autojoin_str, ',');
		
		$username = '';
		$password = '';
		if(WCF::getUser()->userID) {
			$username = rawurlencode(WCF::getUser()->username).'@'.XMPP_DOMAIN;
			if(XMPP_AUTH_COOKIE) {
				$password = WCF::getUser()->password.WCF::getUser()->salt;
			}
		} else if (XMPP_CHAT_ANONYMOUS) {
			$username = XMPP_DOMAIN;
		}

		WCF::getTPL()->assign(array(
			'allowSpidersToIndexThisPage' => true,
			'xmpp_lang' => $this->getLanguageCode(),
			'xmpp_http' => XMPP_CHAT_HTTP,
			'xmpp_domain' => XMPP_DOMAIN,
			'xmpp_username' => $username,
			'xmpp_password' => $password,
			'xmpp_chat_autojoin' => $autojoin_str
		));
	}
	
	/**
	 * @see Page::show()
	 */
	public function show() {
		if (MODULE_XMPP != 1) {
			throw new IllegalLinkException();
		}

		require_once(WCF_DIR.'lib/page/util/menu/PageMenu.class.php');
		PageMenu::setActiveMenuItem('wcf.header.menu.chat');

		parent::show();
	}
}
?>

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
	 * @see Page::assignVariables()
	 */
	public function assignVariables() {
		parent::assignVariables();
		
		WCF::getTPL()->assign(array(
			'allowSpidersToIndexThisPage' => true
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

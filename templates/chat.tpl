{include file="documentHeader"}
<head>
	<title>{lang}wcf.header.menu.chat{/lang} - {lang}{PAGE_TITLE}{/lang}</title>
	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript">jQuery.noConflict();</script>
	{include file='headInclude' sandbox=false}

	<link rel="stylesheet" type="text/css" href="{@RELATIVE_WCF_DIR}images/candy/default.css" />
	<script type="text/javascript" src="{@RELATIVE_WCF_DIR}js/3rdParty/candy.libs.bundle.js"></script>
	<script type="text/javascript" src="{@RELATIVE_WCF_DIR}js/3rdParty/candy.min.js"></script>
	<script type="text/javascript">
	//<![CDATA[
		onloadEvents.push(function(){
			Candy.init('{$xmpp_http}', {
				core: {
					debug: false
					{if $autojoin_str},autojoin: [{@$autojoin_str}]{/if}
				},
				view: {
					resources: '{@RELATIVE_WCF_DIR}images/candy/',
					language: '{$xmpp_lang}'
				}
			});
			Candy.Core.connect({if $xmpp_username}'{$xmpp_username}'{/if}{if $xmpp_password}, '{$xmpp_password}'{/if});
		});
	//]]>
	</script>
</head>
<body{if $templateName|isset} id="tpl{$templateName|ucfirst}"{/if}>
{include file='header' sandbox=false}

<div id="main">
	
	<ul class="breadCrumbs">
		<li><a href="index.php?page=Index{@SID_ARG_2ND}"><img src="{icon}indexS.png{/icon}" alt="" /> <span>{lang}{PAGE_TITLE}{/lang}</span></a> &raquo;</li>
	</ul>
	<div class="mainHeadline">
		<img src="{icon}chatL.png{/icon}" alt="" />
		<div class="headlineContainer">
			<h2>{lang}wcf.header.menu.chat{/lang}</h2>
		</div>
	</div>

	{if $userMessages|isset}{@$userMessages}{/if}

	<p class="info">Die Chat Integration in das Forum befindet sich noch im Aufbau. Mehr unter : <a href="http://www.easy-coding.de/easy-coding-xmpp-server-talk-easy-coding-de-t7173.html">easy-coding XMPP Server - talk.easy-coding.de</a></p>

	<div style="position:relative"><div id="candy"></div></div>
</div>

{include file='footer' sandbox=false}
</body>
</html>

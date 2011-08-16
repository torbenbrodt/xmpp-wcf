{include file="documentHeader"}
<head>
	<title>{lang}wcf.header.menu.chat{/lang} - {lang}{PAGE_TITLE}{/lang}</title>
	{include file='headInclude' sandbox=false}
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

	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
	<script type="text/javascript">jQuery.noConflict();</script>
	<link rel="stylesheet" type="text/css" href="{@RELATIVE_WCF_DIR}images/candy/default.css" />
	<script type="text/javascript" src="{@RELATIVE_WCF_DIR}js/3rdParty/candy.libs.bundle.js"></script>
	<script type="text/javascript" src="{@RELATIVE_WCF_DIR}js/3rdParty/candy.min.js"></script>
	<script type="text/javascript">
		onloadEvents.push(function(){
			Candy.init('http-bind/', {
				core: { debug: false },
				view: { resources: '{@RELATIVE_WCF_DIR}images/candy/', language: 'de' }
			});
			Candy.Core.connect();
		});
	</script>

	{if $userMessages|isset}{@$userMessages}{/if}
	<p class="info">Die Chat Integration in das Forum befindet sich noch im Aufbau. Mit eurem Jabber Client könnt ihr aber schon fleißig mitchatten. Mehr unter : <a href="http://www.easy-coding.de/easy-coding-xmpp-server-talk-easy-coding-de-t7173.html">easy-coding XMPP Server - talk.easy-coding.de</a></p>

	<div id="candy"></div>
</div>

{include file='footer' sandbox=false}
</body>
</html>

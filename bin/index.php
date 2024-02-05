<?php if (session_id() == "") session_start(); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
	<title>BlackBox</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="revised" content="Gabriel Mariani, 3/20/2008" />
	
	<? $path="../"; include $path.'lib/php/global_header.php'; ?>
	
	<link rel="stylesheet" type="text/css" href="style.css" />
	
	<script type="text/javascript">
		var flashvars = {};
		var params = {};
		params.bgcolor = "#000000";
		var attributes = {};
		attributes.id = "blackbox";
		swfobject.embedSWF("login.swf", "flashcontent", "200", "100", "9.0.0", "../lib/flash/expressInstall.swf", flashvars, params, attributes);
	</script>

</head>

<body>
	<div id="distance"></div>
	<div id="wrapper">
		<div id="flashcontent">
			<h1>Course Vector Web Design</h1>
			<br>
			<p>
				<strong>You need to upgrade your Flash Player</strong><br>
				This site requires atleast version 9.
			</p>
		</div>
	</div>

	<? include $path.'lib/php/global_footer.php'; ?>

</body>
</html>

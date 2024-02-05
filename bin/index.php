<?php if (session_id() == "") session_start(); ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>BlackBox</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="description" content="BlackBox is a Adobe Flash based chat program" />
    <meta name="revised" content="Gabriel Mariani, 3/20/2008" />

    <style>
        *,
        *:before,
        *:after {
            box-sizing: border-box;
        }

        html,
        body {
            height: 100%;
        }

        ul,
        ol {
            margin: 0 0 20px 20px;
            padding: 0px;
        }

        a {
            color: #c7532d;
        }

        /*a:link,
		a:visited,
		a:active {
			text-decoration: none;
			color: #999999;
		}
		a:hover {
			text-decoration: none;
			color: #148BB8;
		}*/

        .style1 {
            font-family: Arial, Helvetica, sans-serif;
            font-size: x-small;
            color: #999999;
        }

        .style2 {
            color: #666666;
            font-family: Arial, Helvetica, sans-serif;
            font-weight: bold;
        }

        .style3 {
            font-size: 12px;
            font-family: Arial, Helvetica, sans-serif;
            color: #666666;
        }

        h1 a {
            text-decoration: none;
        }

        h3 a {
            text-decoration: none;
            display: inline-block;
            width: 100%;
        }

        body {
            margin: 0 auto;
            max-width: 1000px;
            width: 100%;
            padding: 25px;
            background-color: #fff;
            font: 11px/16px Verdana, Tahoma;
            color: #363636;
        }

        main {
            padding-bottom: 30px;
        }

        #wrapper {
            text-align: center;
            padding: 30px;
        }

        #wrapper object {
            box-shadow: 2px 2px 20px 5px rgba(0, 0, 0, 0.3);
        }

        div.logo {
            float: left;
            background-repeat: no-repeat;
            height: 128px;
            width: 165px;
        }

        div.details {
            padding: 20px 0 0 0;
        }

        .wp-caption {
            border: 1px solid #ddd;
            text-align: center;
            background-color: #f3f3f3;
            padding-top: 4px;
            margin: 10px;
        }

        .wp-caption p.wp-caption-text {
            font-size: 11px;
            line-height: 17px;
            padding: 0 4px 5px;
            margin: 0;
        }

        .aligncenter,
        div.aligncenter {
            display: block;
            margin-left: auto;
            margin-right: auto;
        }
    </style>
</head>

<body>
    <main>
        <h1>BlackBox - Flash Secure Login</h1>

        <div id="wrapper">
            <div id="flashcontent">
                <p>
                    <strong>You need to upgrade your Flash Player</strong><br>
                    This site requires atleast version 9.
                </p>
            </div>
        </div>
    </main>

    <script src="./assets/js/swfobject.js"></script>
    <script type="text/javascript">
        var flashvars = {};
        flashvars.lastpage = 'secret.php';
        var params = {};
        params.bgcolor = "#000000";
        var attributes = {};
        attributes.id = "blackbox";
        swfobject.embedSWF("./assets/swf/login.swf?lastpage=secret.php", "flashcontent", "200", "100", "9.0.0", "./assets/swf/expressInstall.swf", flashvars, params, attributes);
    </script>
</body>

</html>
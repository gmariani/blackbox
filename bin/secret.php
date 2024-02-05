<?php
session_start();
if ( isset($_SESSION['username']) && !empty($_SESSION['username']) ) {
	?>
	<h1>Super Secret Page</h1>
	<h2>You made it!</h2>
	<?php
	exit;
}
echo 'DENIED!';
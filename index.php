<?php
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}
	require_once('authenticate.php');
	if(isLoggedIn()){
		header('location: dashboard.php');
		exit();
	}
	else{
		include_once('login.php');
	}
?>

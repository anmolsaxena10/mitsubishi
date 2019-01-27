<?php
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}
	require_once('authenticate.php');
	if(isLoggedIn()){
		header("location: dashboard.php");
		exit();
	}
	if(isset($_POST['email']) && isset($_POST['password'])){
		try{
			if(strcmp($_POST['email'], "admin")==0 && strcmp($_POST['password'], "admin123")==0){
				if(!isset($_SESSION)){
					session_start();
				}
				$_SESSION['logged_in'] = TRUE;
				header('location: dashboard.php');
				exit();
			}
			else{
				header('location: login.php');
				exit();
			}
		}
		catch(ErrorException $e){
			echo $e->getMessage();
		}
	}
	else{
		header('location: login.php');
		exit();
	}
?>

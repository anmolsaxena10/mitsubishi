<?php
	$dbl = parse_url(getenv("DATABASE_URL"));
	$port = 5432;
	$host = 'localhost';
	$username = 'postgres';
	$password = 'anmol';
	$db = 'mitsubishi';
	if(sizeof($dbl)!=1){
		$host = $dbl["host"];
		$port = $dbl["port"];
		$username = $dbl["user"];
		$password = $dbl["pass"];
		$db = ltrim($dbl["path"], "/");
	}
	$dsn = "pgsql:host=$host;port=$port;dbname=$db;user=$username;password=$password";
	try{
		$database_handler = new PDO($dsn);
		if($database_handler) {
			// echo "Connected";
		}
	}
	catch(PDOException $e){
		echo $e->getMessage();
	}
?>

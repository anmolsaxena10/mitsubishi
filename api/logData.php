<?php
	if(isset($_POST['logTime']) && isset($_POST['batchId']) &&
	isset($_POST['color']) && isset($_POST['ph']) &&
	isset($_POST['tds']) && isset($_POST['v1']) &&
	isset($_POST['v2']) && isset($_POST['v3']) && isset($_POST['v4'])){
		try{
			require_once('../connection.php');
			$sql = "INSERT INTO logs (batch_id, time, ph, tds, color, valve1, valve2, valve3, valve4) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			$stmt = $database_handler->prepare($sql);
			$stmt->execute(array($_POST['batchId'], $_POST['logTime'], $_POST['ph'], $_POST['tds'], $_POST['color'], $_POST['v1'], $_POST['v2'], $_POST['v3'], $_POST['v4']));

			echo "Logged at ".$_POST['logTime'];
		}
		catch(ErrorException $e){
			echo $e->POSTMessage();
		}

	}
	else{
		echo"fail";
	}
?>

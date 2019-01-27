<?php
	if(isset($_POST['startTime']) && isset($_POST['color']) && isset($_POST['ph']) && isset($_POST['tds'])){
		try{
			echo "1   ";
			require_once('../connection.php');
			$sql = "INSERT INTO batch (time_started, ph, tds, color) VALUES (?, ?, ?, ?) RETURNING batch_id;";
			$stmt = $database_handler->prepare($sql);
			$stmt->execute(array($_POST['startTime'], $_POST['ph'], $_POST['tds'], $_POST['color']));
			print_r(array($_POST['startTime'], $_POST['ph'], $_POST['tds'], $_POST['color']));
			echo $stmt->fetch(PDO::FETCH_ASSOC)['batch_id'];

		}
		catch(ErrorException $e){
			echo $e->getMessage();
		}
	}
	else{
		echo"failed";
	}
?>

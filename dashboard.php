<?php
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}
	require_once('authenticate.php');
	if(!isLoggedIn()){
		header("location: index.php");
		exit();
	}

	require_once('connection.php');

?>
<html>
<?php
$title = "Dashboard";
include("header.php");
?>
<body>
	<header>
		<nav>
			<div class="nav-wrapper light-blue darken-3">
				<a href="#" class="brand-logo center">Dashboard</a>
				<ul id="nav-mobile" class="right">
					<li><a href="logout.php">Logout</a></li>
				</ul>
			</div>
		</nav>
	</header>
	<main class="container" style="">
		<br>
		<div class="row">
			<h5 class="col s2">Batch Id</h5>
			<input class="col s8" type="number" id="batch_id">
			<a id="details" class="btn col s2">Show Details</a>
		</div>
		<h4 id="label" class="center" style="display:none;">Batch Data Logs</h4>
		<div id="batch_details"></div>
	</main>
	<?php
		include("footer.html");
	?>
	<script>
		$('#details').click(function(){
			$.get("details.php?batch_id="+$("#batch_id").val(), function(data){
				$('#batch_details').html(data);
				$('#label').css("display", "block");
			});
			setInterval(function () {
				$.get("details.php?batch_id="+$("#batch_id").val(), function(data){
					$('#batch_details').html(data);
					$('#label').css("display", "block");
				});
			}, 10000);;
		});
	</script>
</body>
</html>

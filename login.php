<?php
	if (session_status() == PHP_SESSION_NONE) {
		session_start();
	}
	require_once('authenticate.php');
	if(isLoggedIn()){
		header('location: dashboard.php');
		exit();
	}
?>

<html>

	<?php
		$title = "Login";
		include("header.php");
	?>

	<body>
		<header>
			<nav>
				<div class="nav-wrapper light-blue darken-3">
					<a href="#" class="brand-logo center">Login</a>
				</div>
			</nav>
		</header>
		<main>
			<div class="container" style="padding-top: 2%;">
				<div class="row">
	  				<div class="col card hoverable s6 offset-s3 ">
	    				<form method="POST" action="do_login.php">
							<input type="hidden" name="qid" value="<?php echo $_GET['qid']; ?>">
							<div class="center-align">
								<img src="imageset/water_icon.png" alt="" class="circle responsive-img hoverable" style="padding-top: 2%; max-width: 30%;">
							</div>
							<div class="card-content center-align">
								<!--<span class="card-title">Login Details</span>-->
								<div class="row">
									<div class="input-field col s12">
										<label for="email">Username</label>
										<input type="text" class="validate" name="email" id="email" />
									</div>
									<div class="input-field col s12">
										<label for="password">Password </label>
										<input type="password" class="validate" name="password" id="password" />
									</div>
								</div>
							</div>
							<div class="card-action right-align">
								<button class="btn waves-effect waves-light light-blue darken-1" type="reset" name="action">Reset
									<i class="material-icons right">restore</i>
								</button>
								<button class="btn waves-effect waves-light light-blue darken-4" type="submit" name="action">Submit
									<i class="material-icons right">send</i>
								</button>
							</div>
				    	</form>
					</div>
				</div>
			</div>
		</main>

		<?php
			include("footer.html");
		?>
	</body>
</html>

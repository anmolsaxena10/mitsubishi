<?php
	require_once('connection.php');

	$sql = "WITH t AS (SELECT * FROM logs WHERE batch_id=? ORDER BY time DESC LIMIT 5) SELECT * from t ORDER BY time ASC;";
	$query = $database_handler->prepare($sql);
	$query->execute(array($_GET['batch_id']));

	$pha = array();
	$tdsa = array();
	$colora = array();
	$v1 = array();
	$v2 = array();
	$v3 = array();
	$v4 = array();
	$t = array();
	while($row = $query->fetch()){
		extract($row);
		array_push($pha, $ph);
		array_push($tdsa, $tds);
		array_push($colora, $color);
		array_push($v1, $valve1);
		array_push($v2, $valve2);
		array_push($v3, $valve3);
		array_push($v4, $valve4);
		array_push($t, substr($time, 10, 9));
	}
	$ph = "['".implode("','", $pha)."']";
	$tds = "['".implode("','", $tdsa)."']";
	$color = "['".implode("','", $colora)."']";
	$v1 = "['".implode("','", $v1)."']";
	$v2 = "['".implode("','", $v2)."']";
	$v3 = "['".implode("','", $v3)."']";
	$v4 = "['".implode("','", $v4)."']";
	$time = "['".implode("','", $t)."']";
?>
<div class="row">
	<div class="col s6"><canvas id="ph" style="width: 100%;"></canvas></div>
	<div class="col s6"><canvas id="tds" style="width: 100%;"></canvas></div>
	<div class="col s6"><canvas id="color" style="width: 100%;"></canvas></div>
	<div class="col s6"><canvas id="v1" style="width: 100%;"></canvas></div>
	<div class="col s6"><canvas id="v2" style="width: 100%;"></canvas></div>
	<div class="col s6"><canvas id="v3" style="width: 100%;"></canvas></div>
	<div class="col s6"><canvas id="v4" style="width: 100%;"></canvas></div>
</div>
<script>
var ctx = $("#ph");
var dailyChart = new Chart(ctx, {
	type: 'line',
	data: {
		labels: <?php echo $time; ?>,
		datasets: [{
			label: 'Value ',
			data: <?php echo $ph; ?>,
			backgroundColor: '#1565c0',
			borderWidth: 1
		}]
	},
	options: {
		title: {
			display: true,
			text: 'PH'
		},
		responsive: true
	}
});

var ctx = $("#tds");
var dailyChart = new Chart(ctx, {
	type: 'line',
	data: {
		labels: <?php echo $time; ?>,
		datasets: [{
			label: 'Value ',
			data: <?php echo $tds; ?>,
			backgroundColor: '#1565c0',
			borderWidth: 1
		}]
	},
	options: {
		title: {
			display: true,
			text: 'TDS'
		},
		responsive: true
	}
});

var ctx = $("#color");
var dailyChart = new Chart(ctx, {
	type: 'line',
	data: {
		labels: <?php echo $time; ?>,
		datasets: [{
			label: 'Value ',
			data: <?php echo $color; ?>,
			backgroundColor: '#1565c0',
			borderWidth: 1
		}]
	},
	options: {
		title: {
			display: true,
			text: 'COLOR'
		},
		responsive: true
	}
});

var ctx = $("#v1");
var dailyChart = new Chart(ctx, {
	type: 'line',
	data: {
		labels: <?php echo $time; ?>,
		datasets: [{
			label: 'Value ',
			data: <?php echo $v1; ?>,
			backgroundColor: '#1565c0',
			borderWidth: 1
		}]
	},
	options: {
		title: {
			display: true,
			text: 'VALVE1'
		},
		responsive: true
	}
});

var ctx = $("#v2");
var dailyChart = new Chart(ctx, {
	type: 'line',
	data: {
		labels: <?php echo $time; ?>,
		datasets: [{
			label: 'Value ',
			data: <?php echo $v2; ?>,
			backgroundColor: '#1565c0',
			borderWidth: 1
		}]
	},
	options: {
		title: {
			display: true,
			text: 'VALVE2'
		},
		responsive: true
	}
});

var ctx = $("#v3");
var dailyChart = new Chart(ctx, {
	type: 'line',
	data: {
		labels: <?php echo $time; ?>,
		datasets: [{
			label: 'Value ',
			data: <?php echo $v3; ?>,
			backgroundColor: '#1565c0',
			borderWidth: 1
		}]
	},
	options: {
		title: {
			display: true,
			text: 'VALVE3'
		},
		responsive: true
	}
});

var ctx = $("#v4");
var dailyChart = new Chart(ctx, {
	type: 'line',
	data: {
		labels: <?php echo $time; ?>,
		datasets: [{
			label: 'Value ',
			data: <?php echo $v4; ?>,
			backgroundColor: '#1565c0',
			borderWidth: 1
		}]
	},
	options: {
		title: {
			display: true,
			text: 'VALVE4'
		},
		responsive: true
	}
});
</script>

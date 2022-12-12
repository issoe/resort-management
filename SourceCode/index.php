<?php
	require('db.php');
	include 'header.php';
	//Check if a user is logged in or not
	session_start();
		if (isset($_SESSION['username'])){
		$username = $_SESSION['username'];
		//Display a message for logged-in users only
		echo "<center><h3>Hello " . $username . "
		!</h3></center>";
		echo "<center><div><p><a href='dashboard.php'> Dashboard</a><a href='logout.php'> Logout</a></p></div></center>";

		}
		else{
		//Display different text if a user is not logged in.
		echo "<center><h3>Welcome to the Beach hotel</h3></center>";
				echo '<center><div>New user? Please <a href="login.php">Login</a> or <a href="register.php">Register</a>
				</div></center>';
		}
	?> 
	<html>
	<body>
		<header> 
			<div class="container">
				<h3>The beach hotel</h3>
			
		<?php
		//If the user is logged-in
		if (isset($_SESSION['username'])){
		$username = $_SESSION['username'];
		echo '
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">My Awesome Website</a>
			</div>
		<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="index.php">
						<span class="glyphicon glyphicon-home"></span> 
						Home</a></li>
					<li><a href="#contact">Contact</a></li>
					<li><a href="dashboard.php"> Dashboard</a></li>
					<li><a href="logout.php"> Logout</a></li>';
	}
		//If the user is logged-out
		else{
		echo '
		<nav class="navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Beach hotel</a>
				</div>

			<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li class="active"><a href="index.php">
							<span class="glyphicon glyphicon-home"></span> 
							Home</a></li>
			<li><a href="login.php"><span class="glyphicon 
					glyphicon-log-in"></span> Login</a></li>
					<li><a href="register.php"><span class="glyphicon 
					glyphicon-user"></span> Register</a></li>';

		}
		
	?>       
			</div>
		</header>
		<section class="container" >
			<div class="row">
				<div class="col-md-9 content">
					 <p class="text-justify">Hehe</p>
				</div>
			</div>
			
		</section>
		
		<footer class="container">
		   <?php include 'footer.php'; ?>
		</footer>
	  
	</body>
	</html>
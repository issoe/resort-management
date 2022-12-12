<?php
	include 'header.php';
	//Start the Session
	session_start();
	require('db.php');
	//If the form is submitted or not.
	//If the form is submitted
	$flag = 0;

	if (isset($_POST['username']) and isset($_POST['password']))
	{
		//Assigning posted values to variables.
		$username = $_POST['username'];
		$password = $_POST['password'];

		//Checking the values are existing in the database or not
		$query = "SELECT * FROM khach_hang WHERE 'username' = '$username' and 'passwordd' = '$password'";
		$result = mysqli_query($conn, $query) or die(mysqli_error($conn));
		$count = mysqli_num_rows($result);

		if ($username == 'smanager' && $password == 'hehe')
		{
			$_SESSION['manager'] = 'manager';
			echo "Hi manager";
			echo "! You are now logged in.";
			echo "<br><a href='manager.php'> Managing client</a><a href='logout.php'> Logout</a>";
			$flag = 1;
		}

		else
		{
			//If the posted values are equal to the database values, then session will be created for the user.
			if ($count == 1)
			{
				$_SESSION['username'] = $username;
			}
			
			else
			{
				//If the login credentials doesn't match, he will be shown with an error message.
				$fmsg = "Invalid Login Credentials.";
			}
		}
	}

	//if the user is logged in Greets the user with message
	if ($flag == 0 && isset($_SESSION['username']))
	{
		$username = $_SESSION['username'];
		echo "Hi " . $username . "";
		echo "! You are now logged in.";
		echo "<br><a href='index.php'> Home</a><a href='dashboard.php'> Dashboard</a><a href='logout.php'> Logout</a>";
	}
	
	else
	{
		//When the user visits the page first time, simple login form will be displayed.
		?>
		<html>
		<head>
			<title>User Login Using PHP & MySQL</title>
			<meta name="robots" content="noindex" />
			
		</head>

		<body>
		<div class="container">
			<form class="form-signin" method="POST">
			<?php if(isset($fmsg)){ ?><div class="alert alert-danger" role="alert"> <?php echo $fmsg; ?> </div><?php } ?>
				<h2 class="form-signin-heading">Please Login</h2>
				<div class="input-group">
			<span class="input-group-addon" id="basic-addon1">@</span>
			<input type="text" name="username" class="form-control" placeholder="Username" required>
			</div>
				<label for="inputPassword" class="sr-only">Password</label>
				<input type="password" name="password" id="inputPassword" class="form-control" placeholder="Password" required>
				<button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
				<a class="btn btn-lg btn-primary btn-block" href="register.php">Register</a>
			</form>
		</div>
		</body>
		</html>
		<?php 
	} 
?>
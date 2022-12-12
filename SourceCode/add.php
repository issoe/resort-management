<?php
	include 'header.php';
	require('db.php');

    if (isset($_POST['name']) && isset($_POST['area']) && isset($_POST['guests']) && isset($_POST['other']))
    {
        $ten_loai_phong = $_POST['name'];
        $dien_tich = $_POST['area'];
        $so_khach = $_POST['guests'];
        $mo_ta_khac = $_POST['other'];

		$sql = "INSERT INTO loai_phong (ten_loai_phong, dien_tich, so_khach, mo_ta_khac)
		VALUES ('$ten_loai_phong', '$dien_tich', '$so_khach', '$mo_ta_khac')";

		if (mysqli_query($conn, $sql)) 
		{
			echo "<center><h3>New room type created successfully!<br/>Click here to <a href='manager.php'>go back to manager page.</a></h3></center>";
		} 

		else 
		{
			echo "Error: " . $sql . "<br>" . mysqli_error($conn);
		}

		mysqli_close($conn);         		
	}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>How to Create Employee Manager in PHP MySQL</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<style>
		.content 
		{
			margin-top: 80px;
		}
	</style>
</head>


<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
			
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="manager.php">See customer information</a></li>
					<li><a href="search.php">Search customer information</a></li>
					<li><a href="add.php">Add a room type</a></li>
					<li><a href="roomtype.php">View room types</a></li>
					<li><a href="statistics.php">View statistics</a></li>

				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>

    <div class="container">
			<form class="form-signin" method="POST">
                <?php if(isset($smsg)){ ?><div class="alert alert-success" role="alert"> <?php echo $smsg; ?> </div><?php } ?>
		        <?php if(isset($fmsg)){ ?><div class="alert alert-danger" role="alert"> <?php echo $fmsg; ?> </div><?php } ?>

				<h2 class="form-signin-heading">Add a new room type</h2>

                <label for="inputName" class="sr-only">Name:</label>
			    <input type="text" name="name" id="Name" class="form-control" placeholder="Name" required>

                <label for="inputArea" class="sr-only">Area:</label>
			    <input type="text" name="area" id="Area" class="form-control" placeholder="Area" required>

                <label for="inputGuests" class="sr-only">Number of guests:</label>
			    <input type="text" name="guests" id="Guests" class="form-control" placeholder="Number of guests" required>

                <label for="inputOther" class="sr-only">Other desciptions:</label>
			    <input type="text" name="other" id="Other" class="form-control" placeholder="Other desciptions" required>

				<button class="btn btn-lg btn-primary btn-block" type="submit">Create</button>
			</form>
		</div>
</body>
</html>
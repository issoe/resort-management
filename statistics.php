<?php
	include 'header.php';
	require('db.php');
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
		.content {
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
					<li><a href="manager.php">See customer information</a></li>
					<li><a href="search.php">Search customer information</a></li>
					<li><a href="add.php">Add a room type</a></li>
                    <li><a href="roomtype.php">View room types</a></li>
					<li class="active"><a href="statistics.php">View statistics</a></li>

				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>


	<div class="container">
			<form class="form-signin" method="POST">
                <?php if(isset($smsg)){ ?><div class="alert alert-success" role="alert"> <?php echo $smsg; ?> </div><?php } ?>
		        <?php if(isset($fmsg)){ ?><div class="alert alert-danger" role="alert"> <?php echo $fmsg; ?> </div><?php } ?>

				<h2 class="form-signin-heading">Visitor Statistics</h2>
                <label for="inputBranch" class="sr-only">Branch number:</label>
			    <input type="text" name="branch" id="branch" class="form-control" placeholder="Branch (a number from 1 to 5)" required>

                <label for="inputYear" class="sr-only">Year:</label>
			    <input type="text" name="year" id="year" class="form-control" placeholder="Year" required>

				<button class="btn btn-lg btn-primary btn-block" type="submit">View</button>
		</form>
	</div>

	<div class="container">
		<div class="content">
			<h2>Visitor statistics table</h2>
            <hr />
			<div class="table-responsive">
			<table class="table table-striped table-hover">
				<tr>
                    <th>Month</th>
                    <th>Number of customer</th>
				</tr>
				<?php

				if (isset($_POST['year']) && isset($_POST['branch']))
				{
					$branch = $_POST['branch'];
					$year = $_POST['year'];

					if ($branch == '1')
					{
						$branch = 'CN1';
					}
					else if ($branch == '2')
					{
						$branch = 'CN2';
					}

					else if ($branch == '3')
					{
						$branch = 'CN3';
					}
					else if ($branch == '4')
					{
						$branch = 'CN4';
					}
					else if ($branch == '5')
					{
						$branch = 'CN5';
					}

					else
					{
						echo '<tr><td colspan="9">There is no such branch.</td></tr>';
					}

					$sql = "CALL ThongKeLuotKhach('$branch','$year')";
				
					if($result = mysqli_query($conn, $sql))
					{
						while($row = mysqli_fetch_assoc($result))
						{
							echo '
							<tr>
								<td>'.$row['thang'].'</td>
								<td>'.$row['tong_so_luot_khach'].'</td>
								<td>';
						}		
					}
					
					else
					{
						echo '<tr><td colspan="9">Data not found.</td></tr>';
					}
				}
				?>
				</table>
		</div>
	</div>

	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>




				
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
		<div class="content">
			<h2>Customer information list</h2>
            <hr />
			<div class="table-responsive">
			<table class="table table-striped table-hover">
				<tr>
                    <th>No</th>
                    <th>Customer ID</th>
					<th>ID number</th>
					<th>Full name</th>
                    <th>Phone number</th>
                    <th>Email address</th>
					<th>username</th>
					<th>Customer point</th>
					<th>Customer type</th>
				</tr>
				<?php

				$sql = mysqli_query($conn, "SELECT * FROM khach_hang ORDER BY ma_khach_hang ASC");
				
				if(mysqli_num_rows($sql) == 0)
                {
					echo '<tr><td colspan="9">Data not found.</td></tr>';
				}
                
                else
                {
					$no = 1;
					while($row = mysqli_fetch_assoc($sql)){
						echo '
						<tr>
							<td>'.$no.'</td>
							<td>'.$row['ma_khach_hang'].'</td>
                            <td>'.$row['cccd'].'</td>
                            <td>'.$row['ho_ten'].'</td>
							<td>'.$row['dien_thoai'].'</td>
                            <td>'.$row['email'].'</td>
                            <td>'.$row['username'].'</td>
                            <td>'.$row['pointt'].'</td>
                            <td>'.$row['typee'].'</td>
							<td>';
						$no++;
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
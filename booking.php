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
					<li><a href="statistics.php">View room types</a></li>
                    <li><a href="roomtype.php">View room types</a></li>
					<li><a href="statistics.php">View statistics</a></li>


				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">
		<div class="content">
			<h2>Customer booking status</h2>
			<hr />

			<?php
				$ma_khach_hang = $_GET['ma_khach_hang'];
				
				$sql = mysqli_query($conn, "SELECT * FROM don_dat_phong WHERE ma_khach_hang='$ma_khach_hang'");
				if(mysqli_num_rows($sql) == 0)
				{
					echo ("This customer have never created any booking.");
					header("Location: manager.php");
				}
				
				else
				{
					$row = mysqli_fetch_assoc($sql);
				}
			?>

			<table class="table table-striped table-condensed">
				<tr>
					<th width="20%">Customer ID</th>
					<td><?php echo $row['ma_khach_hang']; ?></td>
				</tr>
				<tr>
					<th>Booking code</th>
					<td><?php echo $row['ma_dat_phong']; ?></td>
				</tr>
				<tr>
					<th>Booking date</th>
					<td><?php echo $row['ngay_gio_dat']; ?></td>
				</tr>
				<tr>
					<th>Number of guests</th>
					<td><?php echo $row['so_khach']; ?></td>
				</tr>
				<tr>
					<th>Check-in date</th>
					<td><?php echo $row['ngay_nhan_phong']; ?></td>
				</tr>
				<tr>
					<th>Check-out date</th>
					<td><?php echo $row['ngay_tra_phong']; ?></td>
				</tr>
				<tr>
					<th>Total price</th>
					<td><?php echo $row['tong_tien']; ?></td>
				</tr>
				<tr>
					<th>Condition</th>
					<td><?php echo $row['trinh_trang']; ?></td>
				</tr>
			</table>

		</div>
		</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
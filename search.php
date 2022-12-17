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
					<li><a href="manager.php">See customer information</a></li>
					<li class="active"><a href="search.php">Search customer information</a></li>
					<li><a href="add.php">Add a room type</a></li>
					<li><a href="roomtype.php">View room types</a></li>
					<li><a href="statistics.php">View statistics</a></li>

				</ul>
			</div><!--/.nav-collapse -->
		</div>
	</nav>

	<div class="container">
		<form class="form-lookup" method="POST">
			<?php if(isset($smsg)){ ?><div class="alert alert-success" role="alert"> <?php echo $smsg; ?> </div><?php } ?>
		   	<?php if(isset($fmsg)){ ?><div class="alert alert-danger" role="alert"> <?php echo $fmsg; ?> </div><?php } ?>

			<label for="inputsearch" class="sr-only">Full name</label>
			<input type="text" name="search" id="inputsearch" class="form-control" placeholder="Full name" required>
		<input type ="submit">
		</form>

		<div class="content">
            <hr />			   
			<h2>Customer searching list</h2>
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


				if (isset($_POST['search']))
				{
					$search = $_POST['search'];
					$sql = "SELECT * from khach_hang where ho_ten like '%$search%'";
					$result = $conn->query($sql);

				
					if(mysqli_num_rows($result) == 0)
					{
						echo '<tr><td colspan="9">Data not found.</td></tr>';
					}
					
					else
					{
						$no = 1;
						while($row = mysqli_fetch_assoc($result)){
							echo '
							<tr>
								<td>'.$no.'</td>
								<td>'.$row['ma_khach_hang'].'</td>
								<td>'.$row['cccd'].'</td>
								<td><a href="booking.php?ma_khach_hang='.$row['ma_khach_hang'].'"> '.$row['ho_ten'].'</a></td>
								<td>'.$row['dien_thoai'].'</td>
								<td>'.$row['email'].'</td>
								<td>'.$row['username'].'</td>
								<td>'.$row['pointt'].'</td>
								<td>'.$row['typee'].'</td>
								<td>';
							$no++;
						}
					}
					mysqli_close($conn);       		
				}
				?>
			</table>
			</div>
		</div>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
</body>
</html>
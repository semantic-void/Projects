<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create User</title>

<!-- Compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<!-- Compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<!--CSS Icons-->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">

<!--jQuery link-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
	integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
	crossorigin="anonymous"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
.success {
	display: flex;
	align-items: flex-end;
}
</style>
</head>
<body
	style="background-image: url(/images/yellow_black_sphere.jpg); background-size: cover; background-attachment: fixed;">
	<div class="container">
		<div class="row">

			<div clss="col m6 offset-m3">
				<div class="card">
					<div class="card-content">
						<h3>Sign Up</h3>

						<div class="success center-align">
							<h5 class="msgs center-align" id="msg"></h5>
							&nbsp; <i class="small material-icons green-text" id="iconi"
								style="display: none;">done</i> <i
								class="small material-icons red-text" id="iconj"
								style="display: none;">clear</i>
						</div>

						<div class="form center-align" id="frmCont1">
							<!--creating form-->
							<form action="signup" method="post" id="frm">

								<div class="row">
									<div class="input-field col s6">
										<input type="text" minlength="3" name="name" id="username"
											placeholder="Enter Name" class="validate" required> <label
											for="username">Name</label>
									</div>
									<div class="input-field col s6">
										<label for="password">Password</label> <input type="password"
											minlength="5" name="password" id="password"
											placeholder="Enter User Password" class="validate" required>
									</div>
								</div>
								<div class="row">
									<div class="input-field col s6">
										<label for="username">User Name</label> <input type="text"
											minlength="3" name="username" id="username"
											placeholder="Enter User Name" class="validate" required>
									</div>

									<div class="input-field  col s6">
										<label for="address">Address</label>
										<textarea id="address" minlength="5"
											class="materialize-textarea validate" data-length="120"
											name="address" placeholder="Enter Address" required></textarea>
									</div>
								</div>
								<button type="submit" class="btn deep-purple">Submit</button>
							</form>
						</div>

						<div class="loder center-align" style="display: none;" id="loder1">
							<div class="preloader-wrapper active">
								<div class="spinner-layer spinner-red-only">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>
							</div>
							<br> Please Wait . . .
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>



	<!--//Add address  -->
	<div class="container">
		<div class="row">

				<div class="card">
					<div class="card-content">
						<h3>Add address</h3>

						<div class="success center-align">
							<h5 class="msgs center-align" id="msg2"></h5>
							&nbsp; <i class="small material-icons green-text" id="iconi2"
								style="display: none;">done</i> <i
								class="small material-icons red-text" id="iconj2"
								style="display: none;">clear</i>
						</div>

						<div class="form center-align" id="frmCont2">
							<!--creating form-->
							<form action="addAddress" method="post" id="addAddress">

								<div class="row">
									<div class="input-field col s6">
										<input type="text" minlength="3" name="username" id="username"
											placeholder="Enter Username" class="validate" required>
										<label for="username">Username</label>
									</div>
									<div class="input-field col s6">
										<label for="password">Password</label> <input type="password"
											minlength="5" name="password" id="password"
											placeholder="Enter User Password" class="validate" required>
									</div>
									<div class="input-field  col s6">
										<label for="address">Address</label>
										<textarea id="address" minlength="5"
											class="materialize-textarea validate" data-length="120"
											name="address" placeholder="Enter Address" required></textarea>
									</div>
								</div>
								<button type="submit" class="btn deep-purple">Add
									Address</button>
							</form>
						</div>

						<div class="loder center-align" style="display: none;" id="loder2">
							<div class="preloader-wrapper active">
								<div class="spinner-layer spinner-red-only">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>
							</div>
							<br> Please Wait . . .
						</div>

					</div>
				</div>

		</div>
	</div>

	<!--//Find addresses by username-->
	<div class="container">
		<div class="row">
				<div class="card">
					<div class="card-content">
						<h3>Search user addresses</h3>

						<div class="success center-align">
							<h5 class="msgs center-align" id="msg3"></h5>
							&nbsp; <i class="small material-icons green-text" id="iconi3"
								style="display: none;">done</i> <i
								class="small material-icons red-text" id="iconj3"
								style="display: none;">clear</i>
						</div>

						<div class="form center-align" id="frmCont3">
							<!--creating form-->
							<form action="searchAddressesByUsername" method="post" id="allAddress">

								<div class="row">
								
									<div class="input-field col s6">
										<input type="text" minlength="3" name="username" id="username"
											placeholder="Enter Username" class="validate" required>
										<label for="username">Username</label>
									</div>
									
									<div class="input-field col s6">
										<label for="password">Password</label> <input type="password"
											minlength="5" name="password" id="password"
											placeholder="Enter User Password" class="validate" required>
									</div>

								</div>
								<button type="submit" class="btn deep-purple">Search
									Addresses</button>
							</form>
						</div>

						<div class="loder center-align" style="display: none;" id="loder3">
							<div class="preloader-wrapper active">
								<div class="spinner-layer spinner-red-only">
									<div class="circle-clipper left">
										<div class="circle"></div>
									</div>
									<div class="gap-patch">
										<div class="circle"></div>
									</div>
									<div class="circle-clipper right">
										<div class="circle"></div>
									</div>
								</div>
							</div>
							<br> Please Wait . . .
						</div>

					</div>
				</div>
			</div>
	</div>

	<script>
		$(document).ready(function() {
			console.log("Its Working\njQuery is ready ...");
		});
		$("#frm").on('submit', function(event) {
			//Flushing Things       
			$('#msg').html('');
			$('#loder1').hide();
			$('#frmCont1').show();
			$('#iconi').hide();
			$('#iconj').hide();
			// Flush over

			event.preventDefault();
			let f = new FormData(this);
			console.log(f);
			$('#loder1').show();
			$('#frmCont1').hide();
			$.ajax({
				url : 'signup',
				data : f,
				type : 'post',
				success : function(data, textStatus, jqXHR) {
					let data2 = data.toString();
					$('.loder').hide();
					$('#frmCont1').show();
					console.log(data2);
					if (data2 !== "") {
						$('#msg').html('SigenUp Successfull');
						$('#msg').addClass('green-text');
						$('#iconi').show();
					} else {
						$('#msg').html('Username allready exists');
						$('#msg').addClass('red-text');
						$('#iconj').show();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("Something went wrong!");
					$('#loder1').hide();
					$('#frmCont1').show();
					$('#msg').html('Server error');
				},
				processData : false,
				contentType : false
			});
		});

		//Add Addresses
		$("#addAddress").on('submit', function(event) {
			//Flushing Things       
			$('#msg2').html('');
			$('#loder2').hide();
			$('#frmCont2').show();
			$('#iconi2').hide();
			$('#iconj2').hide();
			// Flush over

			event.preventDefault();
			let f = new FormData(this);
			console.log(f);
			$('#loder2').show();
			$('#frmCont2').hide();
			$.ajax({
				url : 'addAddress',
				data : f,
				type : 'post',
				success : function(data, textStatus, jqXHR) {
					let data2 = data.toString();
					$('#loder2').hide();
					$('#frmCont2').show();
					console.log(data2);
					if (data2 !== "") {
						$('#msg2').html('Address Added');
						$('#msg2').addClass('green-text');
						$('#iconi2').show();
					} else {
						$('#msg2').html('Address already Exists OR user don\'t exist');
						$('#msg2').addClass('red-text');
						$('#iconj2').show();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("Something went wrong!");
					$('#loder2').hide();
					$('#frmCont2').show();
					$('#msg2').html('Server error');
				},
				processData : false,
				contentType : false
			});
		});

		//Search Addresses
	 	$("#allAddress").on('submit', function(event) {
			//Flushing Things       
			$('#msg3').html('');
			$('#loder3').hide();
			$('#frmCont3').show();
			$('#iconi3').hide();
			$('#iconj3').hide();
			// Flush over

			event.preventDefault();
			let f = new FormData(this);
			console.log(f);
			$('#loder3').show();
			$('#frmCont3').hide();
			$.ajax({
				url : 'searchAddressesByUsername',
				data : f,
				type : 'post',
				success : function(data, textStatus, jqXHR) {
					let data2 = data.toString();
					$('#loder3').hide();
					$('#frmCont3').show();
					console.log(data2);
					if (data2 !== "") {
						$('#msg3').html('Address Prompted');
						$('#msg3').addClass('green-text');
						$('#iconi3').show();
						swal("All addresses", data2);
					} else {
						$('#msg3').html('Address not found');
						$('#msg3').addClass('red-text');
						$('#iconj3').show();
					}
				},
				error : function(jqXHR, textStatus, errorThrown) {
					console.log("Something went wrong!");
					$('#loder3').hide();
					$('#frmCont3').show();
					$('#msg3').html('Server error');
				},
				processData : false,
				contentType : false
			});
		}); 
	</script>
</body>
</html>
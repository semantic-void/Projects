<%-- <%@page import="com.techblog.entities.Message"%>--%>
<%-- <%@page import="com.techblog.entities.Message"%>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="./public/style.css" rel="stylesheet" type="text/css">
</head>
<body>	

	<%@include file="./layouts/navbar.jsp"%>

	<!--Main block.-->
	<main
		class="d-flex align-items-center primary-background-nav banner-background"
		style="height: 70vh  ;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-4">
					<div class="card">
						<div
							class="card-header primary-background-nav text-white text-center">
							<span class="fa fa-user-plus fa-2x"></span>
							<p>Login Here</p>
						</div>
					<%--	<%
						Message msg = (Message) session.getAttribute("message");
						if (msg != null) {
						%>
						<div id="errorMsg" class="alert <%=msg.getCss()%>" role="alert">
							<%=msg.getMessage()%>
						</div>
						<%
						session.removeAttribute("message");
						} 
						%> --%>
						<div class="card-body">
							<form action="Login" method="POST" id="reg_form">
								<div class="form-group">
									<label for="exampleInputEmail1">Email or Username</label> <input
										type="text" class="form-control" id="email"
										aria-describedby="emailHelp" name="user_name" required>
								</div>
								<div class="form-group mt-3">
									<label for="exampleInputPassword1">Password</label> <input
										type="password" class="form-control"
										id="exampleInputPassword1" name="password" required>
								</div>

								<div class="container text-center mt-2" id="loader"
									style="display: none;">
									<span class=" fa fa-refresh fa-spin fa-3x"></span>
									<h4>Please wait...</h4>
									<br>
								</div>
								<div class="container text-center">
									<button type="submit" class="btn btn-primary btn-color mt-3"
										id="submit-btn" onclick="validateEmail('email')">Submit</button>
								</div>
								<input type="checkbox" name="userOrEmail" style="display: none;"
									id="userOrEmail" value="true">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

	</main>

	<script src="./public/index.js" type="text/javascript"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		$(document).ready(function() {

			console.log("Ready to log you in...");

			$('#reg_form').on('submit', function(event) {

				event.preventDefault();

				let form = new FormData(this);
				$('#submit-btn').hide();
				$('#loader').show();

				$.ajax({
					url : "Login",
					type : "POST",
					data : form,
					success : function(data, textStatus, jqXHR) {
						console.log(data);
						$('#submit-btn').show();
						$('#loader').hide();

						if (data.trim() === "Login Success.") {
							window.location = "ProfilePage";
						} else {
							location.reload(false);
							//"relod(true);" true means you want to ignore cache and load whole page again
						}

					},
					error : function(jqXHR, textStatus, errorThrown) {
						console.log(jqXHR);
						$('#submit-btn').show();
						$('#loader').hide();
						swal("Something Went Wrong...");
					},
					processData : false,
					contentType : false
				});
			});
		});

		function validateEmail(FeildId) {
			if (FeildId !== null) {
				let email = document.getElementById(FeildId).value;
				let re = /\S+@\S+\.\S+/;
				let flag = re.test(email);
				console.log(flag);
				document.getElementById('userOrEmail').checked = flag;
			} else {
				console.log('Textbox can\'t be null');
			}
		}
	</script>
</body>
</html>

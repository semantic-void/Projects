<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
    <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="/css/styles.css">
</head>
<body>
	<%@include file="./layouts/navbar.jsp"%>
	<div class="container-fluid m-0 p-0 banner-background text-white ">
		<div class="jumbotron primary-background-nav p-4 pb-5">
			<div class="container ">
				<h3 class="display-3">GeekCentral</h3>
				<p>
					Welcome to the world of technical enthusiast and professionals. A
					computer programmer, sometimes called a software developer, <br>
					a programmer or more recently a coder (especially in more informal
					contexts), is a person who creates computer software.<br>
				</p>
				<a href="signup" class="btn btn-outline-light btn-color btn-lg">
				<span class="fa fa-user-plus"></span> Start ! it's free  </a>
					<a href="login"
					class="btn btn-outline-light btn-color btn-lg"><span
					class="fa fa-user-circle fa-spin"></span> Login</a>
			</div>
		</div>
	</div>
	<br>

	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

</body>
</html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link href="/css/styles.css" rel="stylesheet" type="text/css" />
  </head>
  <body>

        <!--navigation-->
        <%@include file="Structure/navbar.jsp" %>

        <!--Main block.-->
        <main class="d-flex align-items-center primary-background-nav banner-background" style="height: 70vh;">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-4">
                        <div class="card">
                            <div class="card-header primary-background-nav text-white text-center">
                                <span class="fa fa-user-plus fa-2x"></span>
                                <p>Login Here</p>
                            </div>

                            <div class="card-body">
                                <form action="Login" method="POST" id="reg_form">
                                    <div class="form-group">
                                        <label for="username">Username</label>
                                        <input type="text" class="form-control" id="username" aria-describedby="emailHelp" name="username" required>
                                    </div>
                                    <div class="form-group mt-3">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" required>
                                    </div>

                                    <div class="container text-center mt-2" id="loader" style="display: none;">
                                        <span class=" fa fa-refresh fa-spin fa-3x"></span>
                                        <h4>Please wait...</h4>
                                        <br>
                                    </div>
                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary btn-color mt-3" id="submit-btn"
                                                onclick="validateEmail('email')">Submit</button>
                                    </div>
                                    <input type="checkbox" name="userOrEmail" style="display: none;" id="userOrEmail" value="true">
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

  </body>
</html>

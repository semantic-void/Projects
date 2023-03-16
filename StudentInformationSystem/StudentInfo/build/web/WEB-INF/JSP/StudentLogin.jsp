<%-- 
    Document   : StudentLogin
    Created on : Nov 22, 2022, 10:55:08 PM
    Author     : Sachin Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Login</title>
        <!--Bootstarp-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--Font Awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .primary-background-nav{
                background: #7CB342!important;
            }

            .primary-background-nav{
                background: #00897B!important;
            }

            .primary-background-body{
                background-color: #00838F;
            }

            .articleColor{
                background-color:#00838F;
            }

            .btn-color{
                background-color: #00838F;
                border-color: #ffcc80;
                color:#ffcc80;
            }
            .btn-color:hover{
                background: #ffcc80;
                color: black;
            }
        </style>
    </head>
    <body>
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
                                <form action="Student" method="GET" id="reg_form">
                                    <div class="form-group">
                                        <label for="username">Roll No</label>
                                        <input type="number" class="form-control" id="username" aria-describedby="emailHelp" name="username" required>
                                    </div>
                                    <div class="form-group mt-3">
                                        <label for="password">Password</label>
                                        <input type="password" class="form-control" id="password" name="password" required>
                                    </div>

                                    <div class="container text-center">
                                        <button type="submit" class="btn btn-primary btn-color mt-3" id="submit-btn" 
                                               >Submit</button>
                                    </div>
                                 </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </main>

    </body>
</html>

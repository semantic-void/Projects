<%-- 
    Document   : index
    Created on : Nov 21, 2022, 5:15:20 PM
    Author     : Sachin Sharma
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home page</title>
        <!--Bootstarp-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
        <!--Font Awesome-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>

            body{
                background-image: url('/72695.png');
            }

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
            img{
                 opacity: 0.6;
            }
        </style>
    </head>
    <body>
        <main class="primary-background-nav banner-background" style="height: 50vh;" >
            <!--banner-->
            <div class="container-fluid m-0 p-0 banner-background text-white">
                <div class="jumbotron primary-background-nav p-4">
                    <div class="container ">

                        <h3  class="display-3">Student information system</h3>
                        <p>“Education is the passport to the future, for tomorrow belongs to those who prepare for it today.” —Malcolm X<br>
                        </p>
                        <a href="StudentLogin" class="btn btn-outline-light btn-color btn-lg"><span class="fa fa-user-circle fa-spin"></span> Student Login</a>
                        <a href="Admin" class="btn btn-outline-light btn-color btn-lg"><span class="fa fa-user-circle fa-spin"></span> Admin Login</a>
                    </div>
                </div>
            </div>
        </main>
        
            <div class="has-bg-img bg-purple bg-blend-multiply">
                <img class="bg-img" src="https://img.freepik.com/free-vector/college-building-educational-institution-banner_1441-3616.jpg?w=2000" alt="Background">
            </div>
        
    </body>
</html>

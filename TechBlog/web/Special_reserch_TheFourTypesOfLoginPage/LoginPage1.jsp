<%-- 
This one have popup message for wrong details and also for login. 
But cant see login pop because of instant url change.
--%>

<%@page import="com.techblog.entities.Message"%>
<%@page import="com.techblog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <%@include file="../QuickAdd/cssBase.jsp" %>
        <link href="../css/base.css" rel="stylesheet" type="text/css"/>
        <style>
            /*//ZigZagShape*/
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 73% 86%, 31% 100%, 0 94%, 0 0);        
            }
        </style>
    </head>
    <body>

        <!--navigation-->
        <%@include file="../Structure/navbar.jsp" %>

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
                                        <label for="exampleInputEmail1">Email or Username</label>
                                        <input type="text" class="form-control" id="email" aria-describedby="emailHelp" name="user_name">
                                    </div>
                                    <div class="form-group mt-3">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                                    </div>

                                    <div class="container text-center" id="loader" style="display: none;">         
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

        <!--Js and JQuerry-->
        <%@include file="../QuickAdd/jsBase_jQuery.jsp"%>
        <!--Sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                                                    let server_output;
                                                    $(document).ready(function () {

                                                        console.log("Ready to log you in...");

                                                        $('#reg_form').on('submit', function (event) {

                                                            event.preventDefault();

                                                            let form = new FormData(this);
                                                            $('#submit-btn').hide();
                                                            $('#loader').show();

                                                            $.ajax({
                                                                url: "Login",
                                                                type: "POST",
                                                                data: form,
                                                                success: function (data, textStatus, jqXHR)
                                                                {
                                                                    console.log(data);
                                                                    $('#submit-btn').show();
                                                                    $('#loader').hide();

                                                                    if (data.trim() === "Login Success.") {
                                                                        window.location = "ProfilePage";
                                                                    } else {
                                                                        swal(data);
                                                                     }

                                                                },
                                                                error: function (jqXHR, textStatus, errorThrown) {
                                                                    console.log(jqXHR);
                                                                    $('#submit-btn').show();
                                                                    $('#loader').hide();
                                                                    swal("Something Went Wrong...");
                                                                },
                                                                processData: false,
                                                                contentType: false
                                                                        // becuase there is no content type so, it's nessasry user @Multiconfig wiht sevlet so servlet will accept every type of data.
                                                            });
                                                        });
                                                    });
//                                                    // When HTML DOM "click" event is invoked on element with ID "somebutton", execute the following function...
//                                                    $(document).on("click", "#email", function () {
//                                                        // Execute Ajax GET request on URL of "someservlet" and execute the following function with Ajax response JSON...
//                                                        $.get("Login", function (responseJson) {
//                                                            // Create HTML <ul> element and append it to HTML DOM element with ID "somediv".
//                                                            var $ul = $("<div  class="alert alert - secondary" role="alert">").appendTo($("#errorMsg"));
//                                                                    // Iterate over the JSON array.
//                                                                    $.each(responseJson, function (index, item) {
//                                                                        // Create HTML <li> element, set its text content with currently iterated item and append it to the <ul>.
//                                                                        $("<li>").text(item).appendTo($ul);
//                                                                    });
//                                                        });
//                                                    });


                                                    function validateEmail(FeildId)
                                                    {
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

                                                    /* 
                                                     * Actual working part.
                                                     * function validateEmail(email)
                                                     {   
                                                     let re = /\S+@\S+\.\S+/;
                                                     return re.test(email);
                                                     }
                                                     *
                                                     **/
        </script>
    </body>
</html>

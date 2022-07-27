<%-- 
    Document   : LoginPage Primary (This is error friendly. Read point 6.)Not success yet.
    Created on : Nov 6, 2021, 7:21:37 PM
    Author     : Lenovo

Check LoginPage4 for ajax related info same s this class and more then that.

The primary login page(this page) takes ajax output but it is not a single page 
webapp. We had to access session and it cant be done without reloading.
The reson i had to do this is because i'm nutts with this web application.
1. The page was used to show massage being SPA or ajax.
2. The i wanted to show message like durgesh, in top of textboxes.
3. I wanted to access data from servlet using ajax and show message.  I faild.
4. I thought about hiding message then showing it, but thats too not god.
   because then we need to make more then one <div> with bootsrap alert
   classes of diffrent types and different messages like.
   invalid, login successs, logout success, and another exceptions.
5. So i simply used ajax to refresh the page. Which is not optimal aproach 
   but it setisfy my ego. So, this page is my ego.


Note: I know i could use cookies but i think they cant still invoke the 
      scriptlet again.

6. And now finally i wanted to show dynamic message for errors, By making then 
   user friendly because we dont know what can accur.
   If it will find an unusual error this page will pop that error up in swal aka
   function of simple alert messages.(Not succedd yet).
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
        <%@include file="QuickAdd/cssBase.jsp" %>
        <link href="css/base.css" rel="stylesheet" type="text/css"/>
        <style>
            /*//ZigZagShape*/
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 73% 86%, 31% 100%, 0 94%, 0 0);        
            }
        </style>
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
                            <% Message msg = (Message) session.getAttribute("message");
                                if (msg != null) {
                            %>
                            <div id="errorMsg" class="alert <%=msg.getCss()%>" role="alert">
                                <%= msg.getMessage()%>
                            </div>
                            <%
                                    session.removeAttribute("message");
                                }
                            %>
<!--                            <div class="alert alert-warning" role="alert" id="validation-msg" hidden>
                            </div>-->
                            <div class="card-body">
                                <form action="Login" method="POST" id="reg_form">
                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email or Username</label>
                                        <input type="text" class="form-control" id="email" aria-describedby="emailHelp" name="user_name" required>
                                    </div>
                                    <div class="form-group mt-3">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" class="form-control" id="exampleInputPassword1" name="password" required>
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

        <!--Js and JQuerry-->
        <%@include file="QuickAdd/jsBase_jQuery.jsp"%>
        <!--Sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
                                                    $(document).ready(function () {

                                                        console.log("Ready to log you in...");

                                                        $('#reg_form').on('submit', function (event) {

                                                            event.preventDefault();

//                                                            if (!validateFormFeild("reg_form", "email")
//                                                                    || !validateFormFeild("reg_form", "exampleInputPassword1")) {
//                                                                return;
//                                                            }

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
                                                                        location.reload(false);
                                                                        //"relod(true);" true means you want to ignore cache and load whole page again
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
                                                            });
                                                        });
                                                    });

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

//                                                    function validateFormFeild(formId, textfieldId) {
//                                                        var x = document.forms[formId][textfieldId].value.trim();
//                                                        if (x === "" || x === null) {
//                                                            $("#validation-msg").show();
//                                                            $("#validation-msg").value = "Empty fields..";
////                                                                    customAlert.style.display = 'block';
////                                                            customAlert.innerHTML = "Empty fields..";
//
//                                                            return false;
//                                                        } else {
//                                                            document.getElementById("validation-msg").style.display = 'none';
//                                                            return true;
//                                                        }
//                                                    }

        </script>
    </body>
</html>

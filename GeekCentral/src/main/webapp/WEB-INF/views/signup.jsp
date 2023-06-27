<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Sign Up</title>
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
            <%@include file="./layouts/navbar.jsp" %>

            <main class="primary-background-nav banner-background" style="height: 90vh;" >

                <div class="container">
                    <div class="row">
                        <div class="col-md-4 offset-4">
                            <div class="card">
                                <div class="card-header primary-background-nav text-white text-center">
                                    <span class="fa fa-user-circle fa-2x"></span>
                                    <p>
                                        Sign up
                                    </p>
                                </div>
                                <div class="card-body">
                                    <form id="reg_form" action="Register" method="POST" >
                                        <div class="form-group">

                                            <div class="form-group">
                                                <label for="username">Username</label>
                                                <input type="text" class="form-control" name="user_name" id="username" aria-describedby="userHelp">
                                            </div>

                                            <div class="form-group mt-2">
                                                <label for="exampleInputEmail1">Email address</label>
                                                <input type="email" class="form-control" id="exampleInputEmail1" name="user_email"
                                                       aria-describedby="emailHelp">
                                            </div>
                                            <div class="form-group mt-2">
                                                <label for="exampleInputPassword1">Password</label>
                                                <input type="password" class="form-control" id="exampleInputPassword1" name="user_password">
                                            </div>
                                            <div class="form-group mt-2" >
                                                <label for="exampleInputPassword1">Choose Profile Pic: </label>
                                                <input type="file" class="form-control" id="profilePic" name="profile_pic" >
                                            </div>
                                            <div class="form-group mt-2" id="gender-radio">
                                                <label for="gender">Gender   </label>
                                                <br>
                                                <input type="radio" id="gender"  value="Male" name="user_gender"> Male
                                                <input type="radio" id="gender" value="Female" name="user_gender"> Female
                                                <input type="radio" id="gender" value="Others" name="user_gender"> Others
                                            </div>

                                            <div class="form-group mt-2">
                                                <label for="info">Share about yourself</label>
                                                <textarea class="form-control"  id="info" name="about">
                                                </textarea>
                                            </div>

                                            <div class="form-group form-check mt-2" id="gender-check">
                                                <input type="checkbox" class="form-check-input" id="exampleCheck1" name="check" value="on">
                                                <label class="form-check-label" for="exampleCheck1">agree on terms and conditions.</label>
                                            </div>

                                            <div class="container text-center mt-2" id="loader" style="display: none;">
                                                <span class=" fa fa-refresh fa-spin fa-3x"></span>
                                                <h4>Please wait...</h4>
                                                <br>
                                            </div>
                                            <button type="submit" class="btn btn-primary btn-color mt-2" id="submit-btn">Sign up</button>
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
                $(document).ready(function () {

                    console.log("Loaded...");

                    $('#reg_form').on('submit', function (event) {
                        event.preventDefault();
                        if (!validateFormFeild("reg_form", "username")
                                || !validateFormFeild("reg_form", "exampleInputEmail1")
                                || !validateFormFeild("reg_form", "exampleInputPassword1")
                                || !validateFormFeild("reg_form", "info")) {
                            return;
                        }
                        if (!validateRadioButton("user_gender")) {
                            return;
                        }
                        if (!validateCheckBox("check")) {
                            return;
                        }
                        if (!noSpaceAllowed("reg_form", "username")
                                || !noSpaceAllowed("reg_form", "exampleInputEmail1")) {
                            return;
                        }
                        let form = new FormData(this);
                        $('#submit-btn').hide();
                        $('#loader').show();

                        $.ajax({
                            url: "Register",
                            type: "POST",
                            data: form,
                            success: function (data, textStatus, jqXHR)
                            {
                                console.log(data);
                                $('#submit-btn').show();
                                $('#loader').hide();

                                if (data.trim() === "New User created") {
                                    swal("Successfully registered.. Redirecting to login page.")
                                            .then((value) => {
                                                window.location = "LoginPage";
                                            });
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
                            contentType: false // becuase there is no content
                                    //type so, it's nessasry user @Multiconfig wiht
                                    //sevlet so servlet will accept every type of data.
                        });
                    });
                });

                function validateCheckBox(checkboxGroupName) {
                    var b = 0, chk = document.getElementsByName(checkboxGroupName);
                    for (j = 0; j < chk.length; j++) {
                        if (chk.item(j).checked === false) {
                            b++;
                        }
                    }
                    if (b === chk.length) {
                        swal("Please check tearms and conditions...");
                        document.getElementById("gender-check").setAttribute("class", "alert alert-danger");
                        return false;
                    } else {
                        document.getElementById("gender-check").removeAttribute("class", "alert alert-danger");
                        return true;
                    }
                }

                function validateRadioButton(radiogroupName) {
                    let a = 0, rdbtn = document.getElementsByName(radiogroupName);
                    for (i = 0; i < rdbtn.length; i++) {
                        if (rdbtn.item(i).checked === false) {
                            a++;
                        }
                    }
                    if (a === rdbtn.length) {
                        swal("Please select your gender...");
                        document.getElementById("gender-radio").setAttribute("class", "alert alert-danger");
                        return false;
                    } else {
                        document.getElementById("gender-radio").removeAttribute("class", "alert alert-danger");
                        return true;
                    }
                }
                function noSpaceAllowed(formId, textfieldId) {
                    let x = document.forms[formId][textfieldId].value.trim();
                    if (x.toString().indexOf(" ") === -1) {
                        return true;
                    } else {
                        swal("Space is not allowed in username...");
                        return false;
                    }
                }
                function validateFormFeild(formId, textfieldId) {
                    let x = document.forms[formId][textfieldId].value.trim();
                    if (x === "" || x === null) {
                        return false;
                    } else {
                        return true;
                    }
                }

            </script>
        </body>
    </html>

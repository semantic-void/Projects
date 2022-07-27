<%-- 
    Document   : ProfilePage
    Created on : Nov 13, 2021, 3:09:40 AM
    Author     : Lenovo
--%>

<%@page import="com.techblog.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <%@include file="QuickAdd/cssBase.jsp" %>

        <link href="css/base.css" rel="stylesheet" type="text/css"/>
        <style>
            /*//ZigZagShape*/
            .banner-background{
                clip-path: polygon(30% 0%, 70% 0%, 100% 0, 100% 100%, 73% 86%, 31% 100%, 0 94%, 0 0);        
            }
            a.myActive:visited{
                background-color: #c7a4ff;
                color: white;
            }
            .card {
                box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
                transition: 0.3s;
                width: 40%;
                border-radius: 5px;
            }

            .card:hover {
                box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
            }

            a.cardAnchorFix{
                text-decoration: none;
                color:inherit;
            }
        </style>
    </head>
    <body>

        <%
        %>
        <!--Navbar2-->
        <%@include  file="Structure/navbar_after_login.jsp" %>
        <!--End of Navbar2-->


        <!--main body of the page-->
        <Main>
            <div class="container">
                <div class="row mt-4">
                    <!--first column-->
                    <div class="col-md-3">
                        <!--categories-->
                        <div class="list-group">
                            <a href="#" class="list-group-item list-group-item-action active primary-background-nav" style="border-color: white;">
                                Categories
                            </a>
                            <a href="#" onclick="getPosts(this)" class="list-group-item list-group-item-action c-link ">
                                All Posts 
                            </a>

                            <%  posting = new post_dao(connection.connect());
                                List = posting.getCategories();
                                for (Category cats : List) {
                            %>
                            <a href="#" onclick="getPostsById(<%= cats.getCid()%>, this)" 
                               class="list-group-item list-group-item-action c-link"><%=cats.getCategory()%></a>
                            <%        }
                            %>
                        </div> 
                    </div>

                    <!--second column-->
                    <div class="col-md-8">
                        <!--posts-->
                            <div class="container text-center"  id="loader2">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-2">Loading...</h3>
                        </div>
                        <!--Hold the dynamic data from LoadPage.jsp using ajax in this container-->
                        <div class="container-fluid" id="post-continer"></div>
                    </div>
                </div>   
            </div>
        </Main>

        <!--Js and JQuerry-->
        <%@include file="QuickAdd/jsBase_jQuery.jsp"%>

        <!--Sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!--        <script>
                                $(document).ready(function () {
                                    /* For toggle between user profile and profile edit.*/
                                    //  Starts toggle
                                    let editStatus = false;
                                    $('#edit-profile-button').click(function () {
                                        if (editStatus === false)
                                        {
                                            $('#profile-details').hide();
                                            $('#profile-edit').show();
                                            editStatus = true;
                                            $(this).text("Back");
                                            $(this).addClass(" btn-color");
                                        } else {
                                            $('#profile-details').show();
                                            $('#profile-edit').hide();
                                            editStatus = false;
                                            $(this).text("Edit");
                                            $(this).addClass(" btn-color");
                                        }
                                    });
                                    //  Ends Toggle



                                    /**
                                     * 
                                     * add post form
                                     */

                                    $('#add-post-form').on('submit', function (event) {
                                        event.preventDefault();
                                        let form = new FormData(this);
                                        // requesting server
                                        $.ajax({
                                            url: "AddPostServlet",
                                            type: "POST",
                                            data: form,
                                            success: function (data, textStatus, jqXHR) {
                                                console.log(data);
                                                if (data === 'success') {
                                                    swal("Posted!", "You clicked the button!", "success");
                                                } else {
                                                    swal({
                                                        title: "Server not responding!",
                                                        text: "Exception at server",
                                                        icon: "warning",
                                                        dangerMode: true
                                                    });
                                                }
                                            },
                                            error: function (jqXHR, textStatus, errorThrown) {
                                                swal({
                                                    title: "Unable to reach server.",
                                                    text: "Please make sure you are connected to internet.",
                                                    icon: "warning",
                                                    dangerMode: true
                                                });
                                            },
                                            //images etc data wont travel without these two lines.
                                            processData: false,
                                            contentType: false
                                        });
                                    });

                                    /**
                                     * Ajax for taking responce from Edit Profile servlet.
                                     * @param {type} event
                                     * @returns {undefined}
                                     */
                                    $('#update_form').on('submit', function (event) {
                                    //Prevents the responce to trnsfer control to new page.
                                        event.preventDefault();
                                    //Grab form data
                                        let form = new FormData(this);
                                        $('#save_btn').hide();
                                        $('#loader').show();
                                        $.ajax({
                                            url: "EditProfile",
                                            type: "POST",
                                            data: form,
                                            success: function (data, textStatus, jqXHR)
                                            {
                                                console.log(data);
                                                $('#save_btn').show();
                                                $('#loader').hide();
                                                location.reload(false);
                                                //"relod(true);" true means you want to ignore cache and load whole page again

                                            },
                                            error: function (jqXHR, textStatus, errorThrown) {
                                                console.log(jqXHR);
                                                $('#save_btn').show();
                                                $('#loader').hide();
                                                location.reload(false);
                                            },
                                            processData: false,
                                            contentType: false
                                        });
                                    });

                                });
        </script>-->



        <!--Loading post using ajax-->
        <script>
            function getPosts(element) {
                $("#loader2").show();
                $("#post-continer").hide();
                $(".c-link").removeClass('myActive');
                $.ajax({

                    url: "LoadPost.jsp",
                    success: function (data, textStatus, jqXHR) {
                        $("#loader2").hide();
                        $("#post-continer").show();
                        $("#post-continer").html(data);
                        $(element).addClass("myActive");

                    },
                    error: function (data, textStatus, jqXHR) {
                        $("#post-continer").html(data);
                    }

                });
            }

            function getPostsById(catId, element) {
                $("#loader2").show();
                $("#post-continer").hide();
                $(".c-link").removeClass('myActive');
                $.ajax({
                    url: "LoadPost.jsp",
                    data: {cid: catId},
                    success: function (data, textStatus, jqXHR) {
                        $("#loader2").hide();
                        $("#post-continer").show();
                        $("#post-continer").html(data);
                        $(element).addClass("myActive");

                    },
                    error: function (data, textStatus, jqXHR) {
                        $("#post-continer").html(data);
                    }

                });
            }



            $(document).ready(function () {
                getPosts();
            });
        </script>

    </body>
</html>

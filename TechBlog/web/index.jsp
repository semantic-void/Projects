<%-- 
    Document   : index
    Created on : Nov 2, 2021, 11:36:40 PM
    Author     : Lenovo
--%>
<!--Used products:
JQuery
Bootstrap
font awesome icons
flat icons
maretial colors
sweet alert
In java JDBC for sqlite
Timestamp for handling date in database
DateFormat class methods for making TimeStamp client friendly.
 
Before with 
TimeStamp : 2021-12-01 13:47:45.0       // database direct date not for user, difficult to understand.

After with 
Date Format: It converts the date or timestamp taken form database to in user friendly form.
date format have time specific or date specific methods also we are use combo of both called timestamp structure.
DateFormat.getDateTimeInstance().format(post.getDateTime())
Dec 1, 2021 1:47:45 PM                   // formated date good for user understandability. 

Facebook comment plugin 
Go to facebook for developers.comment plugin 
Give URL of page for which you want comment box, its fine because we use one page
to display multiple sort of data. click on getCode 
It will give CDN for JavaScriptSDK (Look at described section/tag to be used on same web page) and section to include to display.
We will simply make the pid Dynamically allocated per post.
data-href="http://localhost:8080/TechBlog/ShowBlogPage?pid=post.getPid()" in expression tag.
Example in ShowBlogPage.jsp.
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="ErrorPage" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome to Tech Blog</title>
        <%@include file="QuickAdd/cssBase.jsp" %>
        <link href="css/base.css" rel="stylesheet" type="text/css">
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
        <!--banner-->
        <div class="container-fluid m-0 p-0 banner-background text-white">
            <div class="jumbotron primary-background-nav p-4">
                <div class="container ">
                    <h3  class="display-3">Tech to technician</h3>
                    <p>Welcome to the world of technical enthusiast and professionals.  
                        A computer programmer, sometimes called a software developer, <br>
                        a programmer or more recently a coder (especially in more informal
                        contexts), is a person who creates computer software.<br>
                    </p>
                    <a href="signup" class="btn btn-outline-light btn-color btn-lg"><span class="fa fa-user-plus"></span> Start ! it's free</a>
                    <a href="login" class="btn btn-outline-light btn-color btn-lg"><span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
            </div>
        </div>
        <br>

        <!--Cards-->
        <div class="container">
            <div class="row mt-4">
                <!--making blocks-->
                <div class="col">
                    <!--posts-->
                    <div class="container text-center"  id="loader2">
                        <i class="fa fa-refresh fa-4x fa-spin"></i>
                        <h3 class="mt-2">Loading...</h3>
                    </div>
                    <!--Hold the dynamic data from Load-Post-For-Dash .jsp using ajax in this container-->
                    <div class="container-fluid" id="post-continer"></div>
                </div>
                <!--</div>-->   
            </div>

            <!-- example layout for dash posts (LoadPoastDash.jsp) -->         

<!--             <div class="col-md-4">
                 <div class="card" style="width: 18rem;">
                     <div class="card-body">
                         <h5 class="card-title ">Java Programming</h5>
                         <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                         <a href="#" class="btn btn-primary primary-background-nav ">Go somewhere</a>
                     </div>
                 </div>
             </div>-->

        </div>
    </div>
    <!--Js and JQuerry-->
    <%@include file="QuickAdd/jsBase_jQuery.jsp"%>
    <!--Loading post using ajax-->
    <script>
        function getPosts(element) {
            $("#loader2").show();
            $("#post-continer").hide();
            $(".c-link").removeClass('myActive');
            $.ajax({

                url: "LoadPostForDash.jsp",
                success: function (data, textStatus, jqXHR) {
                    $("#loader2").hide();
                    $("#post-continer").show();
                    $("#post-continer").html(data);
                    $(element).addClass("myActive");
                    console.log("Into success");
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
                url: "LoadPostForDash.jsp",
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

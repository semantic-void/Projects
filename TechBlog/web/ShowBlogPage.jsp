<%-- 
    Document   : ShiwBlogPage
    Created on : Nov 29, 2021, 6:07:07 PM
    Author     : Lenovo
--%>

<%@page import="java.util.ArrayDeque"%>
<%@page import="com.techblog.entities.Comment"%>
<%@page import="com.techblog.dao.comment_dao"%>
<%@page import="com.techblog.dao.like_dao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.techblog.dao.user_dao"%>
<%@page import="java.util.Stack"%>
<%@page import="com.techblog.entities.Posts"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.techblog.entities.User"%>
<%@page errorPage="ErrorPage" %>

<%
    String pid = request.getParameter("pid");
    post_dao postDao = new post_dao(connection.connect());
    Posts post = postDao.getPostById(pid);
    
    user_dao userDao = new user_dao(connection.connect());
    User userName = userDao.getUserByUserID(post.getUser_id());
    like_dao like = new like_dao(connection.connect());
    User currentUser = (User) session.getAttribute("user");
    comment_dao commentDao = new comment_dao();
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=post.getTitle()%></title>
        <%@include file="QuickAdd/cssBase.jsp" %>
        <link href="css/base.css" rel="stylesheet" type="text/css"/>
        <style>
            body{
                margin-bottom: 2em;
            }
            a{
                text-decoration: none;
            }
            .image{
                max-width: 400px;
                max-height: 700px;
            }
            .post-title{
                font-weight: 100;
                font-size: 30px;
            }
            .post-content{
                font-weight: 100;
                font-size: 20px;
            }
            .post-date{
                font-style: italic;
                /*                font-weight: bold;*/
            }
            .post-user-info{
                font-size:20px;
            }
            .post-commenting-user-info{
                font-size:18px;
            }
            .row-user{
                border:1px solid #e2e2e2;
                padding-top: 15px;
            }
            .pink{
                color: pink;
            }
        </style>

    </head>
    <body>
        <!--Facebook JavaScriptSDK-->
        <div id="fb-root"></div>
        <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v12.0" nonce="nxU7np1c"></script>

        <!--Navbar2-->
        <%@include  file="Structure/navbar_after_login.jsp" %>
        <!--End of Navbar2-->

        <main class="container">
            <div class="row my-4">
                <div class="col-md-8 offset-md-2">
                    <div class="card">
                        <div class="card-header articleColor">
                            <h4 class="post-title">
                                <%=post.getTitle()%>
                            </h4>
                        </div>
                        <div class="card-body">

                            <div class="image">
                                <%
                                    if (post.getRelatedPic().equals("post_default.png")) {
                                %>
                                <img class="card-img-top my-2 " src="pics/<%=post.getRelatedPic()%>" alt="Default image">
                                <%   } else {%>
                                <img class="card-img-top" src="pics/<%=post.getUser_id()%>/<%=post.getRelatedPic()%>" alt="<%=post.getRelatedPic()%>"> 
                                <% }%>
                            </div>

                            <div class="row my-3 row-user">
                                <div class=" col-md-8  post-user-info"><a href="#"><%=userName.getUser_name()%></a> has posted:</div>
                                <div class="col-md-4">
                                    <p class="post-date"><%=DateFormat.getDateTimeInstance().format(post.getDateTime())%></p>
                                </div>
                            </div>
                            <p class="post-content"> 
                                <%=post.getContent()%>
                            </p>
                            <br>
                            <div class="post-code">
                                <%
                                    String code = post.getCode();
                                    if (code != null && code != "" && !code.equals("null")) {
                                        out.println("<pre>" + code + "</pre>");
                                    }
                                %>
                            </div>
                        </div>
                        <div class="card-footer primary-background-body">
                            <a  class="btn btn-outline-light btn-sm" 
                                onclick="doLike(<%=post.getPid()%>,<%=currentUser.getUser_id()%>)">
                                <span class="fa fa-thumbs-o-up like-counter"> <%=like.totalLikes(post.getPid())%></span></a>
                            <a href="#comments-card" class="btn btn-outline-light btn-sm">
                                <span class="fa fa-commenting-o"> <%=commentDao.getNumberOfCommnets(post.getPid())%></span></a>
                        </div>

                        <div class="card-footer" id="main-footer">
                            <div class="card form-group" style="margin-bottom: 20px;">
                                <form name="commentform" action="Comment" method="POST" id="comment_form">
                                    <div class="card-body"> 
                                        <input type="text" id="comment_txt" name="commenttxt_sbp" class="form-control">
                                        <input type="text" id="pid_" name="pid_sbp" value="<%=post.getPid()%>" hidden>
                                        <input type="text" id="user_id_" name="user_id_sbp" value="<%=currentUser.getUser_id()%>" hidden>
                                    </div>
                                    <div class="card-footer "> 
                                        <div class="container text-center mt-2" id="loader-cmt" style="display: none;">         
                                            <span class=" fa fa-refresh fa-spin fa-3x"></span>
                                            <h4>Please wait...</h4>
                                            <br>
                                        </div>
                                        <button type="submit" class="btn btn-primary primary-background-nav" id="submit-btn-cmt"

                                                value="submit">Comment</button>                 
                                    </div>
                                </form>
                            </div>
                            <br>
                            <%
                                ArrayDeque<Comment> commentsList = commentDao.getCommentsOnPost(post.getPid());
                                for (Comment comment : commentsList) {
                            %>
                            <div class="card">      <a id="comments-card"></a>
                                <div class="card-header">   
                                    <div class="row">
                                        <div class=" col-md-8 post-commenting-user-info"><a href="#">
                                                <%=new user_dao(connection.connect()).getUsername(comment.getUser_id())%></a>: </div>
                                        <div class="col-md-4">
                                            <p class="post-date"><%=DateFormat.getDateTimeInstance().format(comment.getTimestamp())%></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-body">
                                    <div>
                                        <p>
                                            <%=comment.getComment()%> 
                                        </p>
                                    </div>
                                </div>
                            </div>
                            <br>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
            </div>
            <div id="abc"></div>
        </main>

        <!--JS and JQuery
        <%@include file="QuickAdd/jsBase_jQuery.jsp"%>
        <!--Sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
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
                                            //  Prevents the responce to trnsfer control to new page.
                                            event.preventDefault();
                                            //  Grab form data
                                            let form = new FormData(this);
                                            $('#save_btn').hide();
                                            $('#loader').show();
                                            $.ajax({
                                                url: "EditProfile",
                                                type: "POST",
                                                data: form,
                                                success: function (data, textStatus, jqXHR)
                                                {
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
                                        
                                        
                                        
                                        /**
                                         * Comment Ajax
                                         * i just replaced 
                                         *  $('#comment_form').on("submmit",function(event{}));
                                         * with
                                         * $('#comment_form').submit(function (event) {});
                                         * and boom ajax started working properly.
                                         */
                                        $('#comment_form').submit(function (event) {
                                            event.preventDefault();
                                            if (!validateForm()) {
                                                return;
                                            }
                                            
                                            let form = new FormData(this);
                                            $('#submit-btn-cmt').hide();
                                            $('#loader-cmt').show();
                                            $.ajax({
                                                url: "Comment",
                                                type: "POST",
                                                data: form,
                                                success: function (data, textStatus, jqXHR)
                                                {
                                                    $('#submit-btn-cmt').show();
                                                    $('#loader-cmt').hide();
                                                    /*taken cooment from text feild, username from cookine and only 
                                                     success and date and time from parent
                                                     parent se personalized values return krwane me sari mehnat barbad.*/
                                                    let comment = document.getElementById("comment_txt").value;
                                                    let result = data.slice(0, 7);
                                                    let dateAndTime = data.slice(7, data.length).trim();
                                                    let username = getCookie("user_name");
                                                    if (result === "success") {
                                                        commentDisplayAfterPost(username, dateAndTime, comment);
                                                        document.getElementById("comment_txt").value = "";
                                                    } else {
                                                        swal("Faild to comment");
                                                    }
                                                },
                                                error: function (jqXHR, textStatus, errorThrown) {
                                                    console.log(jqXHR);
                                                    $('#submit-btn-cmt').show();
                                                    $('#loader-cmt').hide();
                                                    swal("Something Went Wrong...");
                                                },
                                                processData: false,
                                                contentType: false
                                            });
                                        });
                                        //End of Comment Ajax.
                                    });
                                    
                                    function commentDisplayAfterPost(username, dateAndTime, comment) {
                                        let main = document.getElementById("main-footer");
                                        let card = document.createElement("div");
                                        card.setAttribute("class", "card");
                                        main.insertBefore(card, main.children[1]); // method to add new comment at top
                                        
                                        let card_header = document.createElement("div");
                                        card_header.setAttribute("class", "card-header");
                                        card.appendChild(card_header);// methd to add at bottom
                                        
                                        let row = document.createElement("div");
                                        row.setAttribute("class", "row");
                                        card_header.appendChild(row);
                                        
                                        let col = document.createElement("div");
                                        col.setAttribute("class", "col-md-8 post-commenting-user-info pink");
                                        row.appendChild(col);
                                        
                                        let a = document.createElement("a");
                                        a.setAttribute("href", "#");
                                        a.innerHTML = username;
                                        col.appendChild(a);
                                        
                                        let col2 = document.createElement("div");
                                        col2.setAttribute("class", "col-md-4");
                                        col2.innerHTML = dateAndTime;
                                        row.appendChild(col2);
                                        
                                        let col2p = document.createElement("p");
                                        col2p.setAttribute("class", "post-date");
                                        col2.appendChild(col2p);
                                        
                                        let card_body = document.createElement("div");
                                        card_body.setAttribute("class", "card-body");
                                        card.appendChild(card_body);
                                        
                                        let cardBodyDiv = document.createElement("div");
                                        let cardBodyP = document.createElement("p");
                                        cardBodyP.innerHTML = comment;
                                        card_body.appendChild(cardBodyDiv);
                                        cardBodyDiv.appendChild(cardBodyP);
                                    }
                                    
                                    function getCookie(cname) {
                                        let name = cname + "=";
                                        let decodedCookie = decodeURIComponent(document.cookie);
                                        let ca = decodedCookie.split(';');
                                        for (let i = 0; i < ca.length; i++) {
                                            let c = ca[i];
                                            while (c.charAt(0) === ' ') {
                                                c = c.substring(1);
                                            }
                                            if (c.indexOf(name) === 0) {
                                                return c.substring(name.length, c.length);
                                            }
                                        }
                                        return "";
                                    }
                                    
                                    function validateForm() {
                                        var x = document.forms["comment_form"]["comment_txt"].value;
                                        if (x === "" || x === null) {
                                            return false;
                                        } else {
                                            return true;
                                        }
                                    }
                                    
                                    /*  Thats how can we do HTM from JS Dynamically.
                                     let ele = document.createElement("p");
                                     let text = document.createTextNode("text text text");
                                     ele.appendChild(text);
                                     let elt = document.getElementById("abc");
                                     elt.appendChild(ele);
                                     */
        </script>
    </body>
</html>

<%@page import="java.util.ArrayList"%>
<%@page import="com.techblog.dao.post_dao"%>
<%@page import="com.techblog.helper.connection"%>
<%@page import="com.techblog.entities.Category"%>
<%@page import="com.techblog.entities.Message"%>
<!--Only square profile pics looks perfect. So to make perfect profile pics we have to add some plugins.-->
<%@page import="com.techblog.entities.User"%>


<nav class="navbar navbar-expand-lg navbar-dark primary-background-nav">
    <div class="container-fluid">
        <a class="navbar-brand" href="index"> <span class="fa fa-bolt"></span> Tech-Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="ProfilePage"><span class="fa fa-bank"></span> Home</a>
                </li>

                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        <span class="	fa fa-check-circle"></span>   Categories
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown">

                        <%  posting = new post_dao(connection.connect());
                            List = posting.getCategories();
                            for (Category cats : List) {
                        %>
                        <!--<li>--> 
                        <a href="#" onclick="getPostsById(<%= cats.getCid()%>, this)" 
                           class="list-group-item list-group-item-action c-link"><%=cats.getCategory()%></a>
                        <!--</li>-->
                        <%        }
                        %>
                        <!--<li><hr class="dropdown-divider"></li>-->
                    </ul>
                </li>


                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact us</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal"><span class="fa fa-file-text"></span> Post</a>
                </li>
            </ul>
            <%
                User user = (User) session.getAttribute("user");
            %>
            <!-- Button trigger modal -->
            <ul class="navbar-nav mr-right">
                <li class="nav-item">
                    <a href="#" class="nav-link" data-bs-toggle="modal" data-bs-target="#exampleModal"><span class="fa fa-user-circle"></span> <%= user.getUser_name()%></a>
                </li>
                <!--end of model trigger button-->
                <li class="nav-item">
                    <a class="nav-link" href="Logout"><span class="fa fa-user"></span> Logout</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<%
    Message msg = (Message) session.getAttribute("message");
    if (msg != null) {
%>
<div id="errorMsg" class="alert <%=msg.getCss()%>" role="alert">
    <%= msg.getMessage()%>
</div>
<%
        session.removeAttribute("message");
    }
%>

<!--Start of profile MODEL-->

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header primary-background-nav text-white text-center">
                <div class="container text-center">
                    <%if (user.getProfile_pic().equals("boyTecHBlue.png") || user.getProfile_pic().equals("girlTechPurple.png")) {%>
                    <img src="pics/<%=user.getProfile_pic()%>" style="border-radius: 50%; max-width: 100px" 
                         onerror="alert('Profile pic not-supported or week network or not found')" title="Profile Picture" alt="User">
                    <%} else {%>
                    <img src="pics/<%=user.getUser_id()%>/<%=user.getProfile_pic()%>" style="border-radius: 50%; max-width: 100px" 
                         onerror="alert('Profile pic not-supported or week network or not found')" title="Profile Picture" alt="User">
                    <%}%><br>     
                    <h5 class="modal-title mt-3" id="exampleModalLabel" title="Username"><%= user.getUser_name()%></h5>
                </div>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body" title="User information">
                <div class="container text-center">
                    <!--details-->
                    <div id="profile-details">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <th scope="row">Unique ID:</th>
                                    <td><%= user.getUser_id()%></td>
                                </tr>
                                <tr>
                                    <th scope="row">E-Mail</th> 
                                    <td><%= user.getE_mail()%> </td>
                                </tr>
                                <tr>
                                    <th scope="row">Gender</th> 
                                    <td><%= user.getGender()%> </td>
                                </tr>
                                <tr>
                                    <th scope="row">Status</th> 
                                    <td><%= user.getAbout()%> </td>
                                </tr>
                                <tr>
                                    <th scope="row">Registered on:</th> 
                                    <td><%= user.getRegistertime()%></td>
                                </tr>
                            </tbody>
                        </table> 
                    </div>
                    <!--profile edit-->
                    <div id="profile-edit" style="display: none;">
                        <div id="profile-details">
                            <h4 class="mt-3">Please edit carefully</h4>
                            <!--The PUT will be the accurate method according to law for update, but that not working.-->
                            <form action="EditProfile" method="POST" enctype="multipart/form-data" id="update_form">
                                <table class="table">
                                    <tbody>
                                        <!--  <tr>
                                            <th scope="row">Unique ID:</th>
                                            <td><%= user.getUser_id()%></td>
                                          </tr>-->
                                        <tr>
                                            <th scope="row">Username</th> 
                                            <td><input type="text" name="user_name" value="<%= user.getUser_name()%>" class="form-control"
                                                       id="edit-username" required></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">E-Mail</th> 
                                            <td><input type="email" name="email" value="<%= user.getE_mail()%>" class="form-control" 
                                                       id="edit-email" required></td>
                                        </tr>

                                        <tr>
                                            <!-- Below the image/* helps to accept all types of images. 
                                                 You can even define some certain types of images or other files this way.
                                                 accept="image/png, image/gif, image/jpeg.-->
                                            <th scope="row">New Profile pic:</th> 
                                            <td><input type="file" name="image" class="form-control"
                                                       accept="image/*" >
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Status</th> 
                                            <td>
                                                <textarea name="about" class="form-control" required><%= user.getAbout()%></textarea>                                            
                                            </td> 
                                        </tr>

                                        <tr>
                                            <th scope="row">Gender</th> 
                                            <td><%= user.getGender().toUpperCase()%></td>
                                            <!--td><input type="radio" id="gender" value="Male" name="user_gender"> Male  
                                                <input type="radio" id="gender" value="Female" name="user_gender">  Female  
                                                <input type="radio" id="gender" value="Others" name="user_gender">  Others 
                                                </td>-->

                                        </tr>
                                    </tbody>
                                </table> 
                                <div class="container">
                                    <div class="container text-center" id="loader" style="display: none;">         
                                        <span class=" fa fa-refresh fa-spin fa-3x"></span>
                                        <h4>Please wait...</h4>
                                        <br>
                                    </div>
                                    <button type="submit" class="btn  btn-outline-primary" id="save_btn">Save</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary btn-color" id="edit-profile-button">Edit</button>
            </div>
        </div>
    </div>
</div>

<!--Start POST Modal-->
<!-- Modal -->
<div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Provide details of posts.</h5>
                <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form method="POST" action="AddPostServlet" id="add-post-form">
                    <div class="form-group mt-2">
                        <select class="form-control " name="category" required>
                            <option selected disabled value="">---Select category---</option>
                            <%!
                                post_dao posting;
                                ArrayList<Category> List;
                            %>
                            <%
                                posting = new post_dao(connection.connect());
                                List = posting.getCategories();
                                for (Category cats : List) {
                                    out.print("<option value=" + cats.getCid() + ">" + cats.getCategory() + "</option>");
                                }
                            %>
                        </select>
                    </div>
                    <div class="form-group">
                        <textarea style="height: 30px;" class="form-control mt-3"  placeholder="Enter title..."
                                  name="title" id="post-title" required></textarea>
                    </div>
                    <div class="form-group">
                        <textarea style="height: 150px;" class="form-control mt-3" placeholder="Content here..."
                                  name="content" id="post-content" required></textarea>
                    </div>
                    <div class="form-group">
                        <textarea style="height: 150px;" class="form-control mt-3" placeholder="Program/Code (If Avilable)"
                                  name="program"></textarea>
                    </div>
                    <div class="form-group">
                        <!--<label for="pic" class="mt-2">Related image</label>-->
                        <input type="file" name="picture_" class="form-control" accept="image/*">
                    </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary btn-color" id="post_btn">Post</button>
                </form>
            </div>
        </div>
    </div>
</div>
<!--End of POST Modal-->

<!--Js and JQuerry-->
<%--<%@include file="/QuickAdd/jsBase_jQuery.jsp"%> includes excess imports makin page function akward--%>
<!--<script src="/js/base.js" type="text/javascript"></script> -->
<!--jQuery CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script>

                            $(document).ready(function () {
                                /**
                                 * Dropdown animation for Category Dropdown in nav
                                 */
                                // Add slideDown animation to Bootstrap dropdown when expanding.
                                $('.dropdown').on('show.bs.dropdown', function () {
                                    $(this).find('.dropdown-menu').first().stop(true, true).slideDown();
                                });

                                // Add slideUp animation to Bootstrap dropdown when collapsing.
                                $('.dropdown').on('hide.bs.dropdown', function () {
                                    $(this).find('.dropdown-menu').first().stop(true, true).slideUp();
                                });
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
                                    if (!validateFormFeild("add-post-form", "post-title") ||
                                            !validateFormFeild("add-post-form", "post-content")) {
                                        return;
                                    }
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
                                    if (!validateFormFeild("update_form", "edit-username") ||
                                            !validateFormFeild("update_form", "edit-email")) {
                                        return;
                                    }
                                    if (!noSpaceAllowed("update_form", "edit-username", "Space is not allowed in Username.") ||
                                            !noSpaceAllowed("update_form", "edit-email", "Space is not allowed in E-mail.")) {
                                        return;
                                    }

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

                            function noSpaceAllowed(formId, textfieldId, message) {
                                let x = document.forms[formId][textfieldId].value.trim();
                                if (x.toString().indexOf(" ") === -1) {
                                    return true;
                                } else {
                                    swal(message);
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
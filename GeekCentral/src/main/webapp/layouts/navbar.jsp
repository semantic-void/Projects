<%@page import="java.util.ArrayList"%>
<%--<%@page import="com.techblog.entities.Category"%>--%>
<%@page import="java.util.List"%>
<%--<%@page import="com.techblog.dao.post_dao"%>--%>
<%--<%@page import="com.techblog.helper.connection"%>--%><nav class="navbar navbar-expand-lg navbar-dark primary-background-nav">
    <div class="container-fluid">
        <a class="navbar-brand" href="/"> <span class="fa fa-bolt"></span> Tech-Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" 
                data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/"><span class="	fa fa-bank"></span> Home</a>
                </li>

                
                <li class="nav-item">
                    <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact us</a>
                </li>
                <li class="nav-item">
                    <a href="login" class="nav-link" href="#"><span class="fa fa-user-circle"></span> Login</a>
                </li>
                <li class="nav-item">
                    <a href="signup" class="nav-link" href="#"><span class="fa fa-user-plus"></span> Sign up</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-light btn-color" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<!--jQuery CDN-->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" 
integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
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
    });
</script>
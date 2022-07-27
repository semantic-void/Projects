
<%@page import="com.techblog.dao.user_dao"%>
<%@page import="com.techblog.entities.User"%>
<%@page import="com.techblog.dao.like_dao"%>
<%@page import="java.util.Stack"%>
<%@page import="com.techblog.entities.Posts"%>
<%@page import="com.techblog.dao.post_dao"%>
<%@page import="com.techblog.helper.connection"%>

<style>
    .like-btn, .comment-btn{
        pointer-events:none;
    }

    a.links-in-LoadPostForDash{
        color: inherit; 
        text-decoration: none;
    }
    .my-card-style{
        height: 9em;
        max-height: 9em;
    }
    .heading-text-limit{
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1; /* number of lines to show */
        line-clamp: 1; 
        -webkit-box-orient: vertical;
    }

    .pera-text-limit{
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3; /* number of lines to show */
        line-clamp: 3; 
        -webkit-box-orient: vertical;
    }

</style>
<div class="row">
    <script src="js/base.js" type="text/javascript"></script>
    <%
        post_dao p = new post_dao(connection.connect());
        String cid = request.getParameter("cid");
        Stack<Posts> stack = null;
        User userName = (User) session.getAttribute("user");
        /*     
        ..here cid==null is working but cid.equals(null) is not;
            even if write sout(cid.equals(null)) then this also haults the
        flow of code and dont show any output.
        
        You cannot use the dereference (dot, '.') operator to access instance 
        variables or call methods on an instance if that instance is null.
        Doing so will yield a NullPointerException() till jdk 6 but It is common practice to use
        something you know to be non-null for string comparison. For example,
        "something".equals(stringThatMayBeNull).
        
         */
        if (cid == null) {
            stack = p.getAllPosts();
        } else {
            stack = p.getAllPostsById(cid);
        }
        if (stack.size() == 0) {
            out.println("<h3 class='display-3 text-center'>Sorry nothing is availabe in this category yet...</h3>");
        }

        while (!stack.isEmpty()) {
            Posts post = stack.pop();
            like_dao like = new like_dao(connection.connect());
    %>

    <div class="col-md-4 ml-4 mb-4">
        <a class="links-in-LoadPostForDash my-card-style" href="ShowBlogPage?pid=<%=post.getPid()%>" class="cardAnchorFix" >
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="heading-text-limit"><%= post.getTitle()%></h5>
                    <p class="pera-text-limit"><%= post.getContent()%></p>  
                </div>
        </a>
        <!--Which looks better?-->
        <!--<div class="card-footer text-center primary-background-body"> this?-->
        <!--or-->
        <div class="card-footer primary-background-body"> <!--this?--> 
            <a href="ShowBlogPage?pid=<%=post.getPid()%>" class="btn btn-primary primary-background-nav">Go to post</a>
        </div>
    </div>
</div>
<%
    }
%>
</div>

<%@page import="com.techblog.dao.comment_dao"%>
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

    .heading-text-limit{
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 3; /* number of lines to show */
        line-clamp: 3; 
        -webkit-box-orient: vertical;
    }

    .pera-text-limit{
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 5; /* number of lines to show */
        line-clamp: 5; 
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

    <div class="col-md-6 mt-3">
        <a href="ShowBlogPage?pid=<%=post.getPid()%>" class="cardAnchorFix">
            <div class="card" style="width: 18rem;">
                <%            if (post.getRelatedPic().equals("post_default.png")) {
                %>
                <img class="card-img-top" src="pics/<%=post.getRelatedPic()%>" alt="Default image">
                <%   } else {%>
                <img class="card-img-top" src="pics/<%=post.getUser_id()%>/<%=post.getRelatedPic()%>" alt="<%=post.getRelatedPic()%>"> 
                <% }%>
                <div class="card-body">
                    <b class="heading-text-limit"><%= post.getTitle()%></b>
                    <p class="pera-text-limit"><%= post.getContent()%></p>  
                    <!--<pre><%= post.getCode()%></pre>-->
                </div>
        </a>
        <div class="card-footer text-center primary-background-body"> 

            <a href="#" onclick="doLike(<%=post.getPid()%>,<%=userName.getUser_id()%>)" class="btn btn-outline-light btn-sm like-btn">
                <span class="fa fa-thumbs-o-up like-counter"> <%=like.totalLikes(post.getPid())%></span></a>
            <a href="ShowBlogPage?pid=<%=post.getPid()%>" class="btn btn-outline-secondary btn-sm">Read more</a>
            <a href="#" class="btn btn-outline-light btn-sm comment-btn"><span class="fa fa-commenting-o"> <%=new comment_dao().getNumberOfCommnets(post.getPid())%></span></a>
        </div>
    </div>
</div>
<%
    }
%>
</div>
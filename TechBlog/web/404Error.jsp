<%-- 
    Document   : 404Error
    Created on : Apr 6, 2022, 2:38:59 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  isErrorPage="true"%>  
<!DOCTYPE html>
<html>
    <head>
         <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <title>404 Page not found </title>
         <%@include file="QuickAdd/cssBase.jsp" %>
         <link href="css/base.css" rel="stylesheet" type="text/css">
    </head>
    <body>
          <div class="container text-center">            
            <img src="images/system.png"
                 class="img-fluid mb-3 mt-5" height="720" width="350">
            <!--For using flat icon on web is must to add below commented attributes.--> 
            <div style="font-size: 10px;">Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> 
                from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
            <h3 class="display-3">404 No such page</h3>
            <h5 class="display-5">Sorry, there is no page like this, Please recheck URL...</h5>
            <% 
            if(exception!=null)
            out.print(exception.getMessage());
            %>
            <br>
            <a href="index" class="btn btn-outline-light btn-color btn-lg mt-3">Home</a>
        </div>
    </body>
</html>

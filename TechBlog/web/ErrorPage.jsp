<%-- 
    Document   : ErrorPage
    Created on : Nov 12, 2021, 3:07:44 PM
    Author     : Lenovo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  isErrorPage="true"%>  
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sorry! something went wrong</title>
        <%@include file="QuickAdd/cssBase.jsp" %>
        <link href="css/base.css" rel="stylesheet" type="text/css">
    </head>
    <body>
        <% if (response.getStatus() == 404) {%>
        <div class="container text-center">            
            <img src="images/system.png"
                 class="img-fluid mb-3 mt-5" height="720" width="350">
            <!--For using flat icon on web is must to add below commented attributes.--> 
            <div style="font-size: 10px;">Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> 
                from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
            <h3 class="display-3">404 No such page</h3>
            <h5 class="display-5">Sorry, there is no page like this, Please recheck URL...</h5>
            <%
                if (exception != null) {
                    out.print(exception.getMessage());
                }
            %>
            <br>
            <a href="index" class="btn btn-outline-light btn-color btn-lg mt-3">Home</a>
            
            <%} else if (response.getStatus() == 405) {%>
            <div class="container text-center">            
                <img src="images/system.png"
                     class="img-fluid mb-3 mt-5" height="720" width="350">
                <!--For using flat icon on web is must to add below commented attributes.--> 
                <div style="font-size: 10px;">Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> 
                    from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
                <h3 class="display-3">405 Don't try to mess up wide client code.</h3>
                <h5 class="display-5">Sorry, but you can't hack so easily.</h5>
                <%
                    if (exception != null) {
                        out.print(exception.getMessage());
                    }
                %>
                <br>
                <a href="index" class="btn btn-outline-light btn-color btn-lg mt-3">Home</a>


                <%} else {%>
                <div class="container text-center">            
                    <img src="images/system.png"
                         class="img-fluid mb-3 mt-5" height="720" width="350">
                    <!--For using flat icon on web is must to add below commented attributes.--> 
                    <div style="font-size: 10px;">Icons made by <a href="https://www.freepik.com" title="Freepik">Freepik</a> 
                        from <a href="https://www.flaticon.com/" title="Flaticon">www.flaticon.com</a></div>
                    <h3 class="display-3">Sorry ! Something went wrong . . .</h3>
                    <%
                        if (exception != null) {
                            out.print(exception.getMessage());
                        }
                    %>
                    <br>
                    <a href="index" class="btn btn-outline-light btn-color btn-lg mt-3">Home</a>
                </div>
                <%}%>
                </body>
                </html>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.sachin.GeekCentral.entity.Category"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link href="/css/styles.css" rel="stylesheet" type="text/css" />
    <style>
      a.myActive:visited {
        background-color: #c7a4ff;
        color: white;
      }
      .card {
        box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
        transition: 0.3s;
        width: 40%;
        border-radius: 5px;
      }
      .card:hover {
        box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2);
      }
      a.cardAnchorFix {
        text-decoration: none;
        color: inherit;
      }
    </style>
  </head>
  <body>
   <div>
   </div>
    <main>
      <div class="container">
        <div class="row mt-4">
          <!--first column-->
          <div class="col-md-3">
            <!--categories-->
            <div class="list-group">
              <a
                href="#"
                class="list-group-item list-group-item-action active primary-background-nav"
                style="border-color: white"
              >
                Categories
              </a>
              <a
                href="#"
                onclick="getPosts(this)"
                class="list-group-item list-group-item-action c-link"
              >
                All Posts
              </a>

              <!--  -->
              <% 
              for (Category category : (List<Category>) request.getAttribute("categories")) {
              %>
              <a
                href="#"
                onclick="getPostsById(<%= category.getId()%>, this)"
                class="list-group-item list-group-item-action c-link"
                ><%= category.getTitle()%></a
              >
              <% } %>
              <!--  -->
            
            </div>
          </div>

          <!--second column-->
          <div class="col-md-8">
            <!--posts-->
            <div class="container text-center" id="loader2">
              <i class="fa fa-refresh fa-4x fa-spin"></i>
              <h3 class="mt-2">Loading...</h3>
            </div>
            <!--Hold the dynamic data from LoadPage.jsp using ajax in this container-->
            <div class="container-fluid" id="post-continer"></div>
          </div>
        </div>
      </div>
    </main>

    <!--Sweet alert-->
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js" integrity="sha384-7+zCNj/IqJ95wo16oMtfsKbZ9ccEh31eOz1HGyDuCQ6wgnyJNSYdrPa03rtR1zdB" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js" integrity="sha384-QJHtvGhmr9XOIpI6YVutG+2QOK9T+ZnN4kzFN1RtK3zEFEIsxhlmWl5/YESvpZ13" crossorigin="anonymous"></script>

    <!--Loading post using ajax-->
    <script>
      function getPosts(element) {
        $('#loader2').show();
        $('#post-continer').hide();
        $('.c-link').removeClass('myActive');
        $.ajax({
          url: 'LoadPost.jsp',
          success: function (data, textStatus, jqXHR) {
            $('#loader2').hide();
            $('#post-continer').show();
            $('#post-continer').html(data);
            $(element).addClass('myActive');
          },
          error: function (data, textStatus, jqXHR) {
            $('#post-continer').html(data);
          },
        });
      }

      function getPostsById(catId, element) {
        $('#loader2').show();
        $('#post-continer').hide();
        $('.c-link').removeClass('myActive');
        $.ajax({
          url: 'LoadPost.jsp',
          data: { cid: catId },
          success: function (data, textStatus, jqXHR) {
            $('#loader2').hide();
            $('#post-continer').show();
            $('#post-continer').html(data);
            $(element).addClass('myActive');
          },
          error: function (data, textStatus, jqXHR) {
            $('#post-continer').html(data);
          },
        });
      }

      $(document).ready(function () {
        getPosts();
      });
    </script>
    

  </body>
</html>

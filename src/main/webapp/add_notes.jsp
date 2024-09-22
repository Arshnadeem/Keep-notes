<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Notes</title>
<%@include file="all_css_js.jsp" %>
</head>
<body>
<!-- navbar -->
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light navbar">
 
  </a>
  
  <!-- Navbar toggle button for mobile screens -->
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <!-- Collapsible navbar content -->
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="fa fa-home"></span>
</a>
      </li>
      
      <li class="nav-item active">
        <a class="nav-link" href="all_notes.jsp">List Notes <span class="fa fa-book"></span> </a>
      </li>
    </ul>

    <!-- Search form -->
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>
<br>
<!-- navbar ends -->
<!-- form -->
<!-- using post method data will not be visible in url
 --><h1>Add a new note:</h1>
   <form action="SaveNoteServlet" method="post" class="mt-4">
   
    <div class="form-group">Title
      <label for="title" class="sr-only">Title</label>
      <input name="title" required type="text" class="form-control" id="title" placeholder="Enter the Title here...">
      
    </div>
    
    <div class="form-group">Note
      <label for="content" ></label>
      <textarea name="content" required id="content" placeholder="Enter the Note here..." class="form-control" style="height:350px"></textarea>
    </div>
    <div class="container text-center">
    <button type="submit" class="btn btn-outline-primary text-center">Add</button>
    </div>
  </form>


</div>
</body>
</html>


















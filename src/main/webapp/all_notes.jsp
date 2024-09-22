<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Keeper:all notes</title>
<%@include file="all_css_js.jsp" %>
<%@page import="com.entities.*" %>
<%@page import="com.helper.*" %>
<%@page import="com.entities.Note" %>


</head>
<body>

<!-- navbar -->
<div class="container">
<nav class="navbar navbar-expand-lg navbar-light navbar">
  
  
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
        <a class="nav-link" href="add_notes.jsp">Add Note <span class="fa fa-pencil"></span></a>
      </li>
    </ul>

    <!-- Search form -->
    <form class="form-inline my-2 my-lg-0">
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search" id="noteSearch">
     
    </form>
  </div>
</nav>
<!-- navbar ends -->
<br>
<h1 class="text-uppercase">All notes:</h1>
<%

Session s = FactoryProvider.getFactory().openSession();
Query q = s.createQuery("from Note");
List<Note> list = q.list();

for(Note n: list){
	%>
	<div class="card mt-3" >
  <img src="img/notes.png" class="card-img-top m-4 " alt="..." style="max-width:80px">
  <div class="card-body px-5">
    <h5 class="card-title"><%=n.getTitle() %></h5>
    <p class="card-text"><%=n.getContent() %></p>
     
    
    <div class="container text-right mt-5">
    <a href="DeleteServlet?note_id=<%=n.getId() %>" class="btn btn-danger">Drop</a>
    <a href="Edit.jsp?note_id=<%=n.getId() %>" class="btn btn-primary">Edit</a>
    <p class="text-left"><b class="text-primary">Last Updates: <%=n.getAddedDate()%></b></p>
    </div>
  </div>
</div>
	
	<% 
}

s.close();
%>

<script>
$(document).ready(function(){
  // Listen for input in the search box
  $("#noteSearch").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    
    // Loop through all cards to filter based on title or content
    $(".card").filter(function() {
      $(this).toggle($(this).find(".card-title").text().toLowerCase().indexOf(value) > -1);
    });
  });
});
</script>

</body>
</html>











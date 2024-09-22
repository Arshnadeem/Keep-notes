<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.entities.Note" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit note:Keeper</title>
<%@include file="all_css_js.jsp" %>

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
        <a class="nav-link" href="index.jsp">Home <span class="fa fa-home"></span></a>
      </li>
    </ul>
  </div>
  
</nav>

<!-- navbar ends -->
	<%
	
	int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		  
		  Session s = FactoryProvider.getFactory().openSession();
		  Note n = (Note)s.get(Note.class , noteId);
	%>
	
	   <form action="UpdateServlet" method="post" class="mt-4">
   <input value="<%=n.getId()%>" name="noteId" type= "hidden"/>
    <div class="form-group">Title
      <label for="title" class="sr-only">Title</label>
      <input name="title" required type="text" class="form-control" id="title" placeholder="Enter the Title here..."
      value="<%=n.getTitle() %>">
      
    </div>
    
    <div class="form-group">Note
      <label for="content" ></label>
      <textarea name="content" required id="content" placeholder="Enter the Note here..." class="form-control" style="height:350px" >
      <%=n.getContent()%></textarea>
      
    </div>
    <div class="container text-center">
    <button type="submit" class="btn-custom navbar ">Save</button>
    </div>
  </form>

</div>
</body>
</html>
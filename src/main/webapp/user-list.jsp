<%@ page language="java" session = "true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page isELIgnored="false"%>
<%@ page import="jakarta.servlet.jsp.PageContext"%>
<%@ page import="jakarta.servlet.jsp.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <title>User Management Application</title>
</head>
<body>
	<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
	</ul>
 <center>
  <h1>User Management</h1>
        <h2>
         <a href="new">Add New User</a>
         &nbsp;&nbsp;&nbsp;
         <a href="list">List All Users</a>
         
        </h2>
 </center>
 <div class="row">

		<div class="container">
			<h3 class="text-center">List of Users</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New User</a>
			</div>
		<br>
    <div align="center">
        <table border="1" cellpadding="5">
           
          <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Surname</th>
                <th>Age</th>
                <th>Actions</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="user" items='${listUser}'>
                <tr>
                    <td><c:out value='${user.id}' /></td>
                    <td><c:out value='${user.name}' /></td>
                    <td><c:out value='${user.surname}' /></td>
                    <td><c:out value='${user.age}' /></td>
                    <td>
                     <a href="edit?id=<c:out value='${user.id}' />">Edit</a>
                     &nbsp;&nbsp;&nbsp;&nbsp;
                     <a href="delete?id=<c:out value='${user.id}' />">Delete</a>                     
                    </td>
                </tr>
            	</c:forEach>
            </tbody>
        </table>
        </div>
    </div> 
    </div>
</body>
</html>
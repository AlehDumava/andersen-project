<%@ page language="java" session = "true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page isELIgnored="false"%>
<%@ page import="jakarta.servlet.jsp.PageContext"%>
<%@ page import="jakarta.servlet.jsp.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #E0E0E0">
			
			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test='${user != null}'>
					<form action="update" method="post">
				</c:if>
				<c:if test='${user == null}'>
					<form action="insert" method="post">
				</c:if>

				<caption>
					<h2>
						<c:if test='${user != null}'>
            			Edit User
            		</c:if>
						<c:if test='${user == null}'>
            			Add New User
            		</c:if>
					</h2>
				</caption>

				<c:if test="${user != null}">
					<input type="hidden" name="id" value="<c:out value='${user.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Name</label> <input type="text"
						value="<c:out value='${user.name}' />" class="form-control"
						name="name" required = "required">
				</fieldset>

				<fieldset class="form-group">
					<label>Surname</label> <input type="text"
						value="<c:out value='${user.surname}' />" class="form-control"
						name="surname">
				</fieldset>

				<fieldset class="form-group">
					<label>Age</label> <input type="text"
						value="<c:out value='${user.age}' />" class="form-control"
						name="age">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
			</div>
		</div>
	</div>
</body>

</html>
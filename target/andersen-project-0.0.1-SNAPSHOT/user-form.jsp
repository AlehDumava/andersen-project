<%@ page language="java" session = "true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page isELIgnored="false"%>
<%@ page import="jakarta.servlet.jsp.PageContext"%>
<%@ page import="jakarta.servlet.jsp.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<div style="background: #E0E0E0; height: 55px; padding: 5px;">
  <div style="float: left">
     <h1>My Site</h1>
  </div>

  <div style="float: right; padding: 10px; text-align: right;">

     Hello <b>${loginedUser.userName}</b>
   <br/>
     Search <input name="search">
  </div>

</div>

<body>

<header>
		<nav class="navbar navbar-expand-md navbar-dark"
			style="background-color: #E0E0E0">
			<div>
				<a href="https://www.javaguides.net" class="navbar-brand"> User Management </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/list"
					class="nav-link">Users</a></li>
			</ul>
		</nav>
	</header>
	
	<br>
	
	<table border=1>
        <thead>
            <tr>
                <th>User Id</th>
                <th>Name</th>
                <th>Surame</th>
                <th>Age</th>
                <th colspan=2>Action</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach items="${users}" var="user">
                <tr>
                    <td><c:out value="${user.userid}" /></td>
                    <td><c:out value="${user.surname}" /></td>
                    <td><c:out value="${user.age}" /></td>
                    <td><a href="UserController?action=edit&userId=<c:out value="${user.userid}"/>">Update</a></td>
                    <td><a href="UserController?action=delete&userId=<c:out value="${user.userid}"/>">Delete</a></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="UserController?action=insert">Add User</a></p>



</body>
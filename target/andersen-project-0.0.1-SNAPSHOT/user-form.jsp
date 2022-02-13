<%@ page language="java" session = "true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page isELIgnored="false"%>
<%@ page import="jakarta.servlet.jsp.PageContext"%>
<%@ page import="jakarta.servlet.jsp.*"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<body>
	<br>
	<table border=1 cellpadding="5">
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
            <c:forEach items="${listUser}" var="user">
                <tr>
                    <td><c:out value="${user.userid}" /></td>
                    <td><c:out value="${user.name}" /></td>
                    <td><c:out value="${user.surname}" /></td>
                    <td><c:out value="${user.age}" /></td>
                    <td>
                    	<a href="edit?id=<c:out value="${user.id}"/>">Edit</a>
                    	&nbsp;&nbsp;&nbsp;&nbsp;
                    	<a href="delete?name=<c:out value="${user.name}"/>">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><a href="UserController?action=insert">Show User</a></p>
    <p><a href="UserController?action=insert">Insert User</a></p>
    <p><a href="UserController?action=insert">Update User</a></p>
    <p><a href="UserController?action=insert">Delete User</a></p>

</body>

</html>
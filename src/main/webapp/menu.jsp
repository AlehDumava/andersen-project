<%@ page language="java" session = "true" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page isELIgnored="false"%>


<!DOCTYPE html>
<html>


<div style="background: #E0E0E0; height: 55px; padding: 5px;">
  <div style="float: left">
     <h1>User Application</h1>
  </div>

  <div style="float: right; padding: 10px; text-align: right;">

     Hello <b>${loginedUser.userName}</b>
   <br/>
     Search <input name="search">
  </div>
</div>

	<body>
         <jsp:include page="user-form.jsp"></jsp:include>
         <h3>Home Page</h3>
   </body>
</html>
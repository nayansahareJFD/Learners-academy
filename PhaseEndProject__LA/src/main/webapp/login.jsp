<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body style='background-color: red;'>

<% String Name=request.getParameter("name");
   String pass= request.getParameter("pass");
   
   if(pass.equals("admin") && Name.equals("admin"))
   {
	   %>
	   <jsp:forward page="Home.jsp">
	                       <jsp:param value="<%=Name %>"  name="uname"/>
	   </jsp:forward>
   <% } else{ %>
 <h2>Wrong Username and Password</h2>
 
 <jsp:include page="index.jsp"></jsp:include>  
   
  <% }%> 
  
</body>  
  </html>
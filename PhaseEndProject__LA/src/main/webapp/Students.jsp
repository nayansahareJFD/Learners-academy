<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<%String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl= "jdbc:mysql://localhost:3306/";
String database = "learners_academy";
String userid= "root";
String password= "nationaldefence";

try{
	Class.forName(driver);
}catch (ClassNotFoundException e){
	e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>

<h2>LEARNEAR'S ACADEMY</h2>
<h3>STUDENTS</h3>
<table border="1">
<tr>
<td>First_Name</td>
<td>Last_Name</td>
<td>Age</td>
</tr>
<%
try{
connection= DriverManager.getConnection(connectionUrl+database,userid, password);
statement=connection.createStatement();
String sql= "select * from Students";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("First_name") %></td>
<td><%=resultSet.getString("Last_Name") %></td>
<td><%=resultSet.getInt("Age") %></td>


</tr>

<%
}
connection.close();
}catch (Exception e){
	e.printStackTrace();
}

%>

</table>
<form action="index.jsp" >  
<input type="submit" value="login"><br><br>
</form>
</center>
</body>
</html>
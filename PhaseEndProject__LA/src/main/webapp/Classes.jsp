<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
     pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<%--
<%@page import="java.sql.DriverManager"%>
   <%@page import="java.sql.ResultSet"%>
   <%@page import="java.sql.Statement"%>
   <%@page import="java.sql.Connection"%>
     --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
  <%
    String id = request.getParameter("userid");
   String driver = "com.mysql.jdbc.Driver";
    String connectionUrl = "jdbc:mysql://localhost:3306/";
    String database = "learners_academy";
     String userid = "root";
     String password = "nationaldefence";
     %>
     <% 
      try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
          <h2>LEARNEAR'S ACADEMY</h2>
               <h3>CLASSES</h3>
<table border="1">
<tr>
<td>Section</td>
<td>Subject</td>
<td>Teacher</td>
<td>Time</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from Classes";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Section") %></td>
<td><%=resultSet.getString("Subject") %></td>
<td><%=resultSet.getString("Teacher") %></td>
<td><%=resultSet.getString("Time") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>


<a href="section1maths.jsp">list of section 1 students</a>
<br>
<a href="section2science.jsp">list of section 2 students</a>
<br>
<br>
<br>
 <form action="index.jsp" >  
<input type="submit" value="login"><br><br>
</form>
</center>


</body>
</html>
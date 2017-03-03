<%@page import="java.sql.*"%>
<%
String driverName = "sun.jdbc.odbc.JdbcOdbcDriver";
String dbURL="jdbc:odbc:BBS";
Driver driver = (Driver) Class.forName(driverName).newInstance();
DriverManager.registerDriver(driver);
Connection conn =DriverManager.getConnection(dbURL);
Statement st=conn.createStatement();
%>
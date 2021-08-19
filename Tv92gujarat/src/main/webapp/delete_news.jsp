<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Util.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
String db="tv92gujrat";
String host="localhost";
Connection con = ConnectionUtil.getConnection(db, host);
String msg="";
PrintWriter pw=response.getWriter();

String id=request.getParameter("id");
System.out.println("hello"+id);
 
Statement st=con.createStatement();
int i=st.executeUpdate("DELETE FROM ms_new_inst WHERE `id`='"+id+"'");
if(i>0){
msg="Data Delete Succesfully...!!!";
pw.print(msg);
}else{
	msg="Error...!!!";
	response.sendRedirect("display.jsp?msg="+msg);
}


%>
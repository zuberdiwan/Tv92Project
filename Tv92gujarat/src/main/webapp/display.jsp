<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Util.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
    <%
    String db="tv92gujrat";
    String host="localhost";
    Connection con = ConnectionUtil.getConnection(db, host);
    
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Data Display</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.25/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/fixedheader/3.1.9/js/dataTables.fixedHeader.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.25/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/fixedheader/3.1.9/css/fixedHeader.dataTables.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
</head>
<body>
<div class="container">
<table id="example" class="display nowrap" style="width:100%">
        <thead>
            <tr>
                <th>Sr.</th>
                <th>Date</th>
                <th>Heading</th>
               <th>Action</th>
                
            </tr>
        </thead>
        <tbody>
        <%
        PreparedStatement ps=con.prepareStatement("SELECT * FROM ms_new_inst ORDER BY dt DESC");
        ResultSet rs=ps.executeQuery();
        while(rs.next()){
        %>
            <tr>
                <td><%=rs.getRow() %></td>
                <td><%=rs.getString("dt") %></td>
                <td><%=rs.getString("news_title") %></td>
              	<td style="text-align: center;">
              	<%-- <a href="delete_news.jsp?id=<%=rs.getInt(1)%>">
              	<i class="fa fa-trash" aria-hidden="true" style="font-size: 20px;
    color: red;cursor: pointer;"></i>
              	
              	</a> --%>
              	<a href="delete_news.jsp?&id=<%=rs.getInt(1)%>">
              	<i class="fa fa-trash" aria-hidden="true" style="font-size: 20px;
    color: red;cursor: pointer;"></i>
              	
              	</a>
              	</td>
                
            </tr>
           <%} %>
        </tbody>
    </table>
</div>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#example').DataTable( {
        fixedHeader: true,
        "columnDefs": [
            { "width": "5%", "targets": 0 },
            { "width": "10%", "targets": 1 },
            { "width": "80%", "targets": 2 },
            { "width": "5%", "targets": 3 }
          ]
    } );
} );
</script>


<script type="text/javascript">
<%
//Success message alert
if(request.getParameter("msg") != null){%>
		swal(
			'Success',
			'<%=request.getParameter("msg")%>',
			'success'
		)
<%}%>

<%
//Something Wrong message alert
if(request.getParameter("msg_err") != null){%>
		swal(
			'warning',
			'<%=request.getParameter("msg_err")%>',
			'warning'
		)
<%}%>
</script>
</html>
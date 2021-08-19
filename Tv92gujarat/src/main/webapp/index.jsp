<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Util.ConnectionUtil"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>NEWS-ENTRY</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
<style type="text/css">
.aa1{
font-size: 150px !important;
padding-left: 222px !important;
}
#success {
  background: green;
}
.head {
	background-color: #2E4053;
	height: 7vh;
	line-height: 7vh;
	font-size: 20px;
	color: white;
	font-size: 24px;
}

.btn-primary {
	color: #fff;
	background-color: #2E4053;
	border-color: #2e6da4;
}

.btn {
	padding: 8px 25px;
	width: 110px;
}

.container {
	border: 1px solid #2E4053;
	height: 500px;
}
.form-group {
	margin-bottom: 8px;
}
label {
    display: inline-block;
    max-width: 100%;
    margin-bottom: 5px;
    font-weight: 700;
    font-size: 16px;
}
@media only screen and (max-width: 600px) {
  body {
    background-color: white;
  }
}
</style>
</head>

<%
String db="tv92gujrat";
String host="localhost";
Connection con = ConnectionUtil.getConnection(db, host);
%>
<body class="hm-gradient">
	<div class="container-fluid">
		<!-- <div class="row he ad" align="center">GROUP MASTER</div><br> -->
		<div class="row head">
		<div class="col-sm-2">&nbsp;</div>
		<div class="col-sm-10">
		<label>NEWS ENTRY</label>
		</div>
			
		
		</div>
<br>
		<form autocomplete="off" name="myform" id="myform" action="News_Ins" method="post">

			<div class="col-sm-12">

				<div class="form-group row">
					<label for="groupnm" class="col-sm-1 col-form-label">News Title</label>
					<label class="col-sm-1">:</label>
					<div class="col-sm-10">
						<input type="text" tabindex="1" class="form-control form-control-sm" name="news_title" id="news_title" autofocus="autofocus">
					</div>
				</div>
				<div class="form-group row">
					<label for="groupnma" class="col-sm-1 col-form-label">Content</label>
					<label class="col-sm-1">:</label>
					<div class="col-sm-10">
						<textarea rows="10" cols="10" class="form-control form-control-sm" name="cont_txt" id="cont_txt"  tabindex="2"></textarea>
					</div>
				</div>

				<div class="form-group row">
					<label for="groupnma" class="col-sm-1 col-form-label">Video URL</label>
					<label class="col-sm-1">:</label>
					<div class="col-sm-10">
						<input type="text" type="text" tabindex="3" name="vid_url" id="vid_url" class="form-control form-control-sm">
					</div>
				</div>
				
				<div class="form-group row">
					<label for="groupnma" class="col-sm-1 col-form-label">Date</label>
					<label class="col-sm-1">:</label>
					<div class="col-sm-2">
						<input type="date" name="dt" id="dt"  class="form-control form-control-sm">
					</div>
					<div class="col-sm-8">&nbsp;</div>
				</div>



				<div>&nbsp;</div>
				<div class="form-group row">
					<label class="col-sm-2 col-form-label">&nbsp;</label>
					
					<div class="col-sm-10">
						
			<button type="reset" name="btn" class="btn btn-primary" value="New" id="New">NEW</button>
			<button type="submit" class="btn btn-primary" type="submit" name="btn" value="Save" id="Save" tabindex="4">SAVE</button>
			<a class="btn btn-primary" target="_blank" href="display.jsp">SEARCH</a>
					</div>
				</div>
			</div>
		</form>
		
		

		

	</div>
</body>

<script type="text/javascript">
var getdt = new Date().toJSON().slice(0,10).replace(/-/g,'-');
document.getElementById("dt").value=getdt;
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
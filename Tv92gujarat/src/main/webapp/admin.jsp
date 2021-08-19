<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TV92 ADMIN</title>
   <!-- Tailwind-CSS CDN  -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/1.4.6/tailwind.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.css">
  </head>
  <body class="bg-blue-500">
    <!-- Login Form -->
    <div class="container mx-auto p-2">
      <div class="max-w-sm mx-auto my-24 bg-white px-5 py-10 rounded shadow-xl">
        <div class="text-center mb-8">
          <h1 class="font-bold text-2xl font-bold">ADMIN-LOGIN</h1>
        </div>
        <form method="post" name="login" id="login" action="Login_Check">
          <div class="mt-5">
            <label for="username">Username or Email</label>
            <input
              type="text"
              id="username" name="username" class="block w-full p-2 border rounded border-gray-500"/>
          </div>
          <div class="mt-5">
            <label for="password">Password</label>
            <input type="password" id="password" name="password" class="block w-full p-2 border rounded border-gray-500" />
          </div>
          <div class="mt-10">
            <input
              type="submit" name="btn" value="Login" class="py-3 bg-green-500 hover:bg-green-600 rounded text-white text-center w-full"
            />
          </div>
        </form>
      </div>
    </div>
  </body>
 <script type="text/javascript">
 <%
//Something Wrong message alert
if(request.getParameter("msg") != null){%>
		swal(
			'LOGIN FAILED...!!!',
			'<%=request.getParameter("msg")%>',
			'error'
		)
<%}%>
 </script>
</html>
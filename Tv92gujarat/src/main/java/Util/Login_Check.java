package Util;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Servlet implementation class Login_Check
 */
@WebServlet("/Login_Check")
public class Login_Check extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_Check() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		String password=request.getParameter("password");
		String db="tv92gujrat";
		String host="localhost";
		Connection con = ConnectionUtil.getConnection(db, host);
		String msg="";

		String Qry="SELECT COUNT(id),`User_Name`,PASSWORD FROM `login` WHERE `User_Name`='"+username+"' AND PASSWORD='"+password+"'";
		try {
			PreparedStatement ps=con.prepareStatement(Qry);
			ResultSet rs=ps.executeQuery();
			rs.next();
			String counter=rs.getString(1);
			
			if(!counter.equals("0")){
				HttpSession session =request.getSession(true);
				session.setMaxInactiveInterval(300);//
				session.setAttribute("user_cd", counter);
				session.setAttribute("username", rs.getString("User_Name"));
				msg="Welcome"+rs.getString("User_Name");
				response.sendRedirect("admin-panel.jsp?msg="+msg);
			}else{
				msg="Login Failed...";
				response.sendRedirect("admin.jsp?msg="+msg);
			}
			
			
			
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	}



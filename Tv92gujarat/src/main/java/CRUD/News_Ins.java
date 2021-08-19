package CRUD;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Util.ConnectionUtil;

/**
 * Servlet implementation class News_Ins
 */
@WebServlet("/News_Ins")
public class News_Ins extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public News_Ins() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		  request.setCharacterEncoding("UTF-8");
		  response.setCharacterEncoding("UTF-8");
		String db="tv92gujrat";
		String host="localhost";
		Connection con = ConnectionUtil.getConnection(db, host);
		
		String news_title=request.getParameter("news_title");
		String cont_txt=request.getParameter("cont_txt");
		String vid_url=request.getParameter("vid_url");
		String dt=request.getParameter("dt");
		String btn=request.getParameter("btn");
		
		String msg="Record Succesfully Inserted...!!!";
		String msg_err="Error In Record Insert";
		if(btn.equals("Save")){
		String Qry="INSERT INTO `ms_new_inst` (`news_title`,`content`,`you_url`,dt) VALUES ('"+news_title+"','"+cont_txt+"','"+vid_url+"','"+dt+"') ;";	
		
		try {
			PreparedStatement ps=con.prepareStatement(Qry);
			int a=ps.executeUpdate();
			if(a >0){
				response.sendRedirect("index.jsp?msg="+msg);
			}else{
				response.sendRedirect("index.jsp?msg="+msg_err);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		}
		
	
	
	}

}

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.*;
import java.io.*;
import java.util.*;
import jakarta.servlet.*;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.sql.*;
import java.lang.*;
public class loginServlet extends HttpServlet{ 

public loginServlet() {
		super();
	}

public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	System.out.println("this is Ranjeet");
	
	 System.out.println("Connecting Oracle...Please wait...");
	  response.setContentType("text/html");
	  System.out.println("Logged in user is "+request.getParameter("username").toString());
	  
	  //PrintWriter out = response.getWriter();
	 
	  Connection conn = null;
	  String url = "jdbc:oracle:thin:@localhost:1521:XE";
	  String dbName = "XE";
	  String driver = "oracle.jdbc.OracleDriver";
	  String userName = "RANJEET"; 
	  String password = "RANJEET";
	 String uname="";
	 String upass="";
	 String strQuery= ""; 
	 String strQuery2= "";  
	 String role=""; 
	  Statement st=null;
	  Statement st2=null;
	  ResultSet rs=null;
	 ResultSet rs2=null;  
	HttpSession session = request.getSession();
	  try {
		  
	 Class.forName(driver);
	 
	  conn = DriverManager.getConnection(url,userName,password);
	  
	  if(request.getParameter("username")!=null &&
	     request.getParameter("username")!="" && request.getParameter("password")!=null &&
	     request.getParameter("password")!="")
	  {
		  
	  uname = request.getParameter("username").toString();
	  
	  upass = request.getParameter("password").toString();
	  
	   
	  strQuery="select USER_ID , FIRST_NAME , LAST_NAME ,PASSWORD,ROLE from MASTER_LOGIN where user_id='"+uname+"' and  password='"+upass+"' ";
	
	  st = conn.createStatement();
	  
	  rs = st.executeQuery(strQuery);
	  
	  int count=0;
	  
	  System.out.println("Logged in user is "+uname);
	  
	  while(rs.next())
	  {
		   System.out.println("Inside rs resultest");
	  session.setAttribute("username",rs.getString(2));
	  session.setAttribute("userrolename",rs.getString(5));
	  
	 System.out.println("rs.getString(5)..."+ rs.getString(5));
	 
	 count++;
	  
	  }
	   
	   
	  if  ( count > 0  && session.getAttribute("userrolename").equals("ADMIN"))
	  {
	System.out.println("In ROle..Admin");
	//request.setAttribute("resultset",rs2);
	RequestDispatcher view = request.getRequestDispatcher("welcomeAdmin.jsp");
	view.forward(request , response);
	   }
	else
	  {
	session.setAttribute("loginerror","Invalid combination of username and password");

	 response.sendRedirect("loginerror.jsp");
	  }
	  System.out.println("Connected to the database"); 
	  conn.close();
	  System.out.println("Disconnected from database");
	  } 
	}catch (Exception e) {
	  e.printStackTrace();
	  }
	  

}
public void init() throws ServletException {
		// Put your code here
	}

@Override  public void doGet(HttpServletRequest request, HttpServletResponse response)
   throws ServletException,IOException{
}
}
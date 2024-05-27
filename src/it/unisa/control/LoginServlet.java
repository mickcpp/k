package it.unisa.control;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.*;
import it.unisa.model.UserDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
			
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	UserDao usDao = new UserDao();
		
		try
		{	    
		     UserBean user = new UserBean();
		     
		     user = usDao.doRetrieve(request.getParameter("un"), toHash(request.getParameter("pw")));
			   		    
		    
		     String checkout = request.getParameter("checkout");
		     
		     if (user.isValid())
		     {
			        
		          HttpSession session = request.getSession(true);	    
		          session.setAttribute("currentSessionUser",user); 
		          if(checkout!=null)
		        	  response.sendRedirect(request.getContextPath() + "/account?page=Checkout.jsp");
		          
		          else
		        	  response.sendRedirect(request.getContextPath() + "/Home.jsp");
		     }
			        
		     else 
		          response.sendRedirect(request.getContextPath() +"/Login.jsp?action=error"); //error page 
		} 
				
				
		catch(SQLException e) {
			System.out.println("Error:" + e.getMessage());
		}
		  }
	
	
		public String toHash(String pass){
			
			String hashString = null;
			try{
				java.security.MessageDigest digest = java.security.MessageDigest.getInstance("SHA-512");
			    byte[] hash = digest.digest(pass.getBytes(StandardCharsets.UTF_8));
			    hashString = "";
			    for(int i=0; i<hash.length ; i++){
			        hashString += Integer.toHexString(
			                (hash[i] & 0xFF) | 0x100)
			                .toLowerCase().substring(1,3);
			    }
			} catch (java.security.NoSuchAlgorithmException e){
			    System.out.println(e);
			}
	
			return hashString;
		}
	}



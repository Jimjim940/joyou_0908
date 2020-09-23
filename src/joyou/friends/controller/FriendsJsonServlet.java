package joyou.friends.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;
import com.google.gson.JsonElement;


import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanDao;
import joyou.friends.dao.impl.FriendsDaoImpl;
import joyou.friends.model.FriendsBean;
import joyou.friends.service.FriendsService;
import joyou.friends.service.impl.FriendsServiceImpl;
import joyou.util.HibernateUtil;

@WebServlet("/Friends.Json")
@javax.servlet.annotation.MultipartConfig
public class FriendsJsonServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	
	public  FriendsJsonServlet() {
		super();
	}
   

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		
		 request.setCharacterEncoding("UTF-8");
		 	int memberId = 0;
		 	memberId = Integer.parseInt(request.getParameter("memberId").trim());
			response.setContentType("application/json; charset=utf-8");
			SessionFactory factory = HibernateUtil.getSessionFactory();
			Session session = factory.getCurrentSession();
			session.beginTransaction();
			 try(
			    		PrintWriter out = response.getWriter();
				    ) {
				    	request.setCharacterEncoding("UTF-8");
						FriendsService service = new FriendsServiceImpl();
						FriendsBean bb = service.getFriendTextOnly(memberId);
						String singleFriendJson = new Gson().toJson(bb); 
			            out.write(singleFriendJson);
					} 
	}

	
}

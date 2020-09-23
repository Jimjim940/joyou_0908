package joyou.friends.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;

import com.google.gson.Gson;


import joyou.Members.model.MembersBean;
import joyou.Members.model.MembersBeanDao;
import joyou.friends.dao.impl.FriendsDaoImpl;
import joyou.friends.model.FriendsBean;
import joyou.friends.service.FriendsService;
import joyou.friends.service.impl.FriendsServiceImpl;
import joyou.util.HibernateUtil;


@WebServlet("/FriendsaAll.json")
public class FriendsAllIdService extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private Session session;
	
	
	

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		session.beginTransaction();
	
		
		try(
				PrintWriter out = response.getWriter();
			) {
				FriendsService service = new FriendsServiceImpl();
				List<FriendsBean> list = service.getAllFriendsJSON();
				String categoriesJson = new Gson().toJson(list); 
	            out.write(categoriesJson);
	            System.out.println(categoriesJson);
			} 
		
	}
	
	
}

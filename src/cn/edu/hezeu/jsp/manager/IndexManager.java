package cn.edu.hezeu.jsp.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.hezeu.jsp.Service.UserService;
import cn.edu.hezeu.jsp.Service.Impl.UserServiceImpl;
import cn.edu.hezeu.jsp.bean.Posts;
import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.bean.U;
 
public class IndexManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public IndexManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UserService userservice = new UserServiceImpl();
		
		List<Posts> faties = userservice.getAllPosts("index-fatie");
		List<Posts> tiwens = userservice.getAllPosts("index-tiwen");
		List<Tags> allTags = userservice.getAllTags();
		request.setAttribute("fatie", faties);
		request.setAttribute("tiwen", tiwens);
		request.setAttribute("tag", allTags);
		request.getRequestDispatcher("index-2.jsp").forward(request, response);
	}

}

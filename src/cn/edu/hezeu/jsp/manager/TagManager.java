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

 
public class TagManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public TagManager() {
        super();
    }

	 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String tagid =  request.getParameter("id");
		UserService userservice = new UserServiceImpl();
		List<Posts> faties = userservice.getAllPostsByTid(tagid);
		request.setAttribute("fatie", faties);
		request.getRequestDispatcher("postlist.jsp").forward(request, response);
	}

}

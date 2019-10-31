package cn.edu.hezeu.jsp.manager;

import java.awt.event.ActionEvent;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.hezeu.jsp.Service.UserService;
import cn.edu.hezeu.jsp.Service.Impl.UserServiceImpl;
import cn.edu.hezeu.jsp.bean.Comment;
import cn.edu.hezeu.jsp.bean.Posts;
import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.bean.U;

public class PostMannager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 
    public PostMannager() {
        super();
    }

 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}

	 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String type = request.getParameter("type");
		String pid  = request.getParameter("pid");
		String action =request.getParameter("action");
		UserService userservice = new UserServiceImpl();
		if (type!=null && !type.equals("")) {
			List<Posts> faties = userservice.getAllPosts(type);
			request.setAttribute("fatie", faties);
			request.getRequestDispatcher("postlist.jsp").forward(request, response);
		}

		if (pid!=null && !pid.equals("")) {
			Posts onePostById = userservice.getOnePostById(Integer.parseInt(pid));
			List<Tags> allTags = userservice.getAllTags();
			List<Comment> allCommentsByPid = userservice.getAllCommentsByPid(pid);
			for (Comment comment : allCommentsByPid) {
				U user = userservice.getOneUserById(Integer.parseInt(comment.getUid()));
				comment.setUser(user );
			}
			request.setAttribute("post", onePostById);
			request.setAttribute("tag", allTags);
			request.setAttribute("comments", allCommentsByPid);
			request.getRequestDispatcher("post.jsp").forward(request, response);
		}
		
		if (action!=null && !action.equals("")) {
			Posts post = new Posts();
			String title =request.getParameter("title");
			String context =request.getParameter("context");
			String tagString =request.getParameter("tag");
			String type1 =request.getParameter("fenlei");
			post.setContext(context);
			post.setTitleString(title);
			post.setType(Integer.parseInt(type1));
			post.setTagString(tagString);
			userservice.savePost(post);
			request.getRequestDispatcher("tag?id="+tagString).forward(request, response);
		}
		
	}

}

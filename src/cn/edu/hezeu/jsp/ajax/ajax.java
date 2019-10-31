package cn.edu.hezeu.jsp.ajax;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.edu.hezeu.jsp.Service.UserService;
import cn.edu.hezeu.jsp.Service.Impl.UserServiceImpl;
import cn.edu.hezeu.jsp.bean.Comment;
import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.bean.U;

public class ajax extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		UserService stu = new UserServiceImpl();
		U user = new U();
		String action = request.getParameter("action");
		UserService userservice = new UserServiceImpl();
		if (action.equals("tags")) {
			String ret = "";
			List<Tags> allTags = userservice.getAllTags();
			int i = 0;
			for (Tags tags : allTags) {
				i++;
				String name = tags.getName();
				if (i==allTags.size()) {
					ret += name ;
				}else{
					ret += name + "-";
				}
			}
			out.println(ret);
		} else if(action.equals("comment")){
			String pid = request.getParameter("pid");
			String uid = request.getParameter("uid");
			String context = request.getParameter("context");
			context= URLDecoder.decode(context);
			if (pid!=null && !pid.equals("")&&context!=null && !context.equals("") &&uid!=null && !uid.equals("")) {
				Comment comment = new Comment();
				comment.setContext(context);
				comment.setPid(Integer.parseInt(pid));
				comment.setUid(uid);
				boolean addComment = userservice.addComment(comment);
				if (addComment) {
					out.println("ok");
					return;
				}
			}
			out.println("fail");
		}else if (action.equals("comment-delete")) {
			String cid = request.getParameter("cid");
			if (cid!=null && !cid.equals("")) {
				boolean addComment = userservice.deleteComment(cid);
				if (addComment) {
					out.println("ok");
					return;
				}
			}
			out.println("fail");
		}else {
			user.setId(Integer.parseInt(request.getParameter("id")));
			if (stu.exist(user)) {
				out.println("该账号已经存在");
			} else {
				out.println("该学号可以用");
			}
		}
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		doGet(request, response);
	}

}

package cn.edu.hezeu.jsp.manager;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.edu.hezeu.jsp.Service.UserService;
import cn.edu.hezeu.jsp.Service.Impl.UserServiceImpl;
import cn.edu.hezeu.jsp.bean.Posts;
import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.bean.U;

public class UserManager extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		UserService userservice = new UserServiceImpl();
		String operation = request.getParameter("operation");
		String identity = request.getParameter("role");

		int uid = Integer.parseInt(request.getParameter("id"));
		if (operation.equals("login")) {
			U user = new U();
			user.setId(uid);
			user.setPassword(request.getParameter("password"));

			String codeByFront = request.getParameter("Code");
			String codeBySession = (String) session.getAttribute("Code");

			boolean ret = codeByFront.equals(codeBySession);
			if (codeByFront.equals(codeBySession)) {
				if (identity.equals("manager")) {
				
					
					U exist = userservice.checkUser(user);
					if (exist!=null) {
						response.sendRedirect("yanzheng.jsp");
						session.setAttribute("loginSign", exist);
					} else {
						out.println("<script languague='javascript'>alert('��¼ʧ��');location='login.jsp';</script>");
						}
					
				} else if (identity.equals("user")) {
					U exist = userservice.checkUser(user);
					if (exist!=null) {
						session.setAttribute("loginSign", exist);
						out.println("<script languague='javascript'>alert('��½�ɹ�');location='index';</script>");
					} else {
						out.println("<script languague='javascript'>alert('��¼ʧ��');location='login.jsp';</script>");
					}
				}
			} else {
				out.println("<script languague='javascript'>alert('��֤�벻��ȷ');location='login.jsp';</script>");
			}
		}
		if(operation.equals("yanzheng")){
			String yanzheng = request.getParameter("yanzheng");
			if(yanzheng.equals("12345")){
				out.println("<script languague='javascript'>alert('��½�ɹ�');location='showUser';</script>");
				}else{
					System.out.println("����Ա�������");
					out.println("<script languague='javascript'>alert('����Ա������� ');location='login.jsp';</script>");
				}
		}
		if (operation.equals("register")) {

			U user = new U();
			boolean exist = false;
			List<U> userList = userservice.getAllUser();
			for (U list : userList) {
				if (list.getId() == uid) {
					exist = true;
				}
			}
			if (exist == false) {
				if (!(request.getParameter("id").trim().equals("")
						&& request.getParameter("pwd1").trim().equals("") && request
						.getParameter("pwd2").trim().equals(""))) {

					if (request.getParameter("pwd1").equals(request.getParameter("pwd2"))
							&& !request.getParameter("pwd1").trim().equals("")) {
						user.setId(uid);
						user.setPassword(request.getParameter("pwd1"));
						user.setRole(request.getParameter("role"));
						int x = userservice.addUser(user);
						if (x > 0) {
							out.println("<script languague='javascript'>alert('ע��ɹ�');location='login.jsp';</script>");
						} else {
							out.println("<script languague='javascript'>alert('ע��ʧ��');location='register.jsp';</script>");
						}
					} else {
						System.out.println("������������벻һ��");
						out.println("<script languague='javascript'>alert('������������벻һ��');location='register.jsp';</script>");
					}
				} else {
					out.println("<script languague='javascript'>alert('��������ݲ���Ϊ��');location='register.jsp';</script>");
				}

			} else {
				out.println("<script languague='javascript'>alert('�û����Ѵ���');location='register.jsp';</script>");
			}
		}

		if ("add".equals(operation)) {
			U user = new U();
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setRealname(request.getParameter("realname"));
			user.setRole(request.getParameter("role"));
			user.setTelephone(Long.parseLong(request.getParameter("telephone")));
			user.setId(uid);
			user.setSex(request.getParameter("sex"));
			int x = userservice.addUser(user);
			if (x > 0) {
				out.println("<script languague='javascript'>alert('��ӳɹ�');location='showUser';</script>");
			} else {
				out.println("<script languague='javascript'>alert('���ʧ��');location='showUser';</script>");
			}
		}
		if ("delete".equals(operation)) {
			int id = uid;

			int x = userservice.deleteUser(id);
			if (x > 0) {
				out.println("<script languague='javascript'>alert('ɾ���ɹ�');location='showUser';</script>");
			} else {
				out.println("<script languague='javascript'>alert('ɾ��ʧ��');location='showUser';</script>");
			}
		}
		if ("modify".equals(operation)) {
			int id = uid;
			U user = userservice.getOneUserById(id);
			request.setAttribute("user", user);
			request.getRequestDispatcher("modify.jsp").forward(request,
					response);

		}
		if ("update".equals(operation)) {
			U user = new U();
			user.setUsername(request.getParameter("username"));
			user.setPassword(request.getParameter("password"));
			user.setId(uid);
			user.setRealname(request.getParameter("realname"));
			user.setRole(request.getParameter("role"));
			user.setSex(request.getParameter("sex"));
			user.setTelephone(Long.parseLong(request.getParameter("telephone")));
			int y = userservice.updateUser(user);
			if (y > 0) {
				out.println("<script languague='javascript'>alert('�޸ĳɹ�');location='showUser';</script>");
			} else {
				out.println("<script languague='javascript'>alert('�޸�ʧ��');location='showUser';</script>");
			}
		}
		if ("see".equals(operation)) {
			int id = uid;
			U oneuser = userservice.getOneUserById(id);
			session.setAttribute("user", oneuser);
			request.getRequestDispatcher("single.jsp").forward(request, response);
		}
		if (operation.equals("retrieve")) {
			U user = new U();
			user.setId(uid);
			user.setTelephone(Long.parseLong(request.getParameter("telephone")));
			user.setRealname(request.getParameter("realname"));
			request.setAttribute("user", user);
			if (!(userservice.retrieve(user) == null)) {
				request.getRequestDispatcher("modifypwd.jsp").forward(request,
						response);
			} else {
				out.println("<script languague='javascript'>alert('���û�������');location='register.jsp';</script>");
			}
		}
		if (operation.equals("modifypwd")) {
			if (request.getParameter("newpwd1").equals(
					request.getParameter("newpwd2"))) {
				int x = userservice.uppwd(request.getParameter("newpwd1"),
						uid,
						request.getParameter("realname"),
						Long.parseLong(request.getParameter("telephone")));
				if (x > 0) {
					out.println("<script languague='javascript'>alert('�޸ĳɹ�');location='login.jsp';</script>");
				}
			} else {
				out.println("<script languague='javascript'>alert('������������벻һ��');location='retrieve.jsp';</script>");
			}
		}
		if(operation.equals("search")){
			String search = request.getParameter("s");
			List<Posts> posts = userservice.search(search);
			List<Tags> allTags = userservice.getAllTags();
			request.setAttribute("fatie", posts);
			request.setAttribute("tag", allTags);
			request.getRequestDispatcher("zhanshi.jsp").forward(request, response);
			
		}

	}

}

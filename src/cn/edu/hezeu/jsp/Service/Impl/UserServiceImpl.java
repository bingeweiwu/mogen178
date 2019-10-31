package cn.edu.hezeu.jsp.Service.Impl;

import java.util.List;

import cn.edu.hezeu.jsp.Dao.UserDao;
import cn.edu.hezeu.jsp.Dao.Impl.UserDaoImpl;
import cn.edu.hezeu.jsp.Service.UserService;
import cn.edu.hezeu.jsp.bean.Comment;
import cn.edu.hezeu.jsp.bean.Posts;
import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.bean.U;

public class UserServiceImpl implements UserService {
	UserDao userdao  = new UserDaoImpl();

	public List<U> getAllUser() {
		
		return userdao.getAllUser();
	}

	public U getOneUserById(int id) {
		
		return userdao.getOneUserById(id);
	}

	public int addUser(U user) {
		
		return userdao.addUser(user);
	}

	public int updateUser(U user) {
		
		return userdao.updateUser(user);
	}

	public int deleteUser(int id) {
		
		return userdao.deleteUser(id);
	}

	public U checkUser(U user) {
		U checkUser = userdao.checkUser(user);
		return  checkUser;
	}

	public boolean exist(U user) {
		
		return userdao.exist(user);
	}

	public U retrieve(U user) {
		
		return userdao.retrieve(user);
	}

	public int uppwd(String pwd,int id, String realname, long telephone) {
		
		return userdao.uppwd(pwd,id, realname, telephone);
	}

	public List<Tags> getAllTags() {
		List<Tags> allTags = userdao.getAllTags();
		return allTags;
	}

	public List<Posts> getAllPosts(String action) {
		 List<Posts> allPosts = userdao.getAllPosts(action);
		return allPosts;
	}

	public Posts getOnePostById(int id) {
		Posts onePostById = userdao.getOnePostById(id);
		return onePostById;
	}

	public int addUser(Posts post) {
		int addUser = userdao.addUser(post);
		return addUser;
	}

	public List<Posts> getAllPostsByTid(String tid) {
		 List<Posts> allPosts = userdao.getAllPostsByTid(tid);
		return allPosts;
	}

	public boolean savePost(Posts post) {
		int savePost = userdao.savePost(post);
		if (savePost>0) {
			return true;
		}
		return false;
	}

	public List<Comment> getAllCommentsByPid(String pid) {
		List<Comment> allCommentsByPid = userdao.getAllCommentsByPid(pid);
		return allCommentsByPid;
	}

	public boolean addComment(Comment comment) {
		int addComment = userdao.addComment(comment);
		if (addComment>0) {
			return true;
		}
		return false;
	}

	public boolean deleteComment(String cid) {
		int addComment = userdao.deleteComment(cid);
		if (addComment>0) {
			return true;
		}
		return false;
	}

public List<Posts> search(String s) {
		// TODO Auto-generated method stub
		
		return userdao.search(s);
	}
}

package cn.edu.hezeu.jsp.Service;

import java.util.List;

import cn.edu.hezeu.jsp.bean.Comment;
import cn.edu.hezeu.jsp.bean.Posts;
import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.bean.U;

public interface UserService {
	public U checkUser(U user);
	public List<U> getAllUser();
	public U getOneUserById(int id);
	public int addUser(U user);
	public int updateUser(U user);
	public int deleteUser(int id);
	public boolean exist(U user);
	public U retrieve(U user);
	public int uppwd(String pwd,int id, String realname, long telephone);
	
	public List<Tags> getAllTags();
	
	
	public List<Posts> getAllPosts(String action);
	public List<Posts> getAllPostsByTid(String tid);
	public Posts getOnePostById(int id) ;
	public int addUser(Posts post);
	
	
	public boolean savePost(Posts post);
	
	public List<Comment> getAllCommentsByPid(String pid);
	public boolean addComment(Comment comment);
	
	public boolean deleteComment(String cid);
	
	public List<Posts> search(String s);
	
}

package cn.edu.hezeu.jsp.Dao;

import java.util.List;

import cn.edu.hezeu.jsp.bean.Comment;
import cn.edu.hezeu.jsp.bean.Posts;
import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.bean.U;

public interface UserDao {
	public U checkUser(U user);

	public List<U> getAllUser();

	public U getOneUserById(int id);

	public int addUser(U user);

	public int updateUser(U user);

	public int deleteUser(int id);

	public boolean exist(U user);

	public U retrieve(U user);

	public int uppwd(String pwd, int id, String realname, long telephone);

	public List<Tags> getAllTags();

	public List<Posts> getAllPosts(String action);

	public Posts getOnePostById(int id);

	public int addUser(Posts post);

	public List<Posts> getAllPostsByTid(String tid);

	public int savePost(Posts post);

	public List<Comment> getAllCommentsByPid(String pid);

	public int addComment(Comment comment);

	public int deleteComment(String cid);

	public List<Posts> search(String s);
}

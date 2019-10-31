package cn.edu.hezeu.jsp.Dao.Impl;

import java.util.ArrayList;
import java.util.List;

import cn.edu.hezeu.jsp.Dao.UserDao;
import cn.edu.hezeu.jsp.bean.Comment;
import cn.edu.hezeu.jsp.bean.Posts;
import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.bean.U;
import cn.edu.hezeu.jsp.pojo.CommentRowMapper;
import cn.edu.hezeu.jsp.pojo.PostRowMapper;
import cn.edu.hezeu.jsp.pojo.TagRowMapper;
import cn.edu.hezeu.jsp.pojo.UserRowMapper;
import cn.edu.hezeu.jsp.utils.JdbcUtil;

public class UserDaoImpl implements UserDao {

	public List<U> getAllUser() {

		String sql = "select * from userinfo ";
		List<Object> obList = JdbcUtil.getObjects(sql, null,
				new UserRowMapper());
		List<U> userList = new ArrayList();
		for (Object obj : obList) {
			userList.add((U) obj);
		}
		return userList;
	}

	public U getOneUserById(int id) {

		String sql = "select * from userinfo where id=?";
		Object[] obj = { id };
		U user = (U) JdbcUtil.getOneObject(sql, obj, new UserRowMapper());
		return user;
	}

	public int addUser(U user) {

		String sql = "insert into userinfo (username,password,realname,telephone,sex,role,id) values (?,?,?,?,?,?,?)";
		Object[] obj = { user.getUsername(), user.getPassword(),
				user.getRealname(), user.getTelephone(), user.getSex(),
				user.getRole(), user.getId() };

		return JdbcUtil.executeUpdate(sql, obj);
	}

	public int updateUser(U user) {

		String sql = "update userinfo set username=?,password=?,realname=?,telephone=?,sex=?,role=?,id=? where id =? ";
		Object[] obj = { user.getUsername(), user.getPassword(),
				user.getRealname(), user.getTelephone(), user.getSex(),
				user.getRole(), user.getId(), user.getId() };
		return JdbcUtil.executeUpdate(sql, obj);
	}

	public int deleteUser(int id) {

		String sql = "delete from userinfo where id = ?";
		Object[] obj = { id };
		return JdbcUtil.executeUpdate(sql, obj);
	}

	public U checkUser(U user) {

		String sql = "select * from userinfo where id=? and password=?";
		Object[] obj = { user.getId(), user.getPassword() };
		Object result = JdbcUtil.getOneObject(sql, obj, new UserRowMapper());
		U ret = (U) result;
		return ret;
	}

	public boolean exist(U user) {

		String sql = "select id  from userinfo where id = ?";
		Object[] obj = { user.getId() };
		Object ob = JdbcUtil.getOneObject(sql, obj, new UserRowMapper());
		if (ob != null) {
			return true;
		} else {
			return false;
		}
	}

	public U retrieve(U user) {

		String sql = "select * from userinfo where id = ? and telephone  =? and realname=?";
		Object[] obj = { user.getId(), user.getTelephone(), user.getRealname() };
		return (U) JdbcUtil.getOneObject(sql, obj, new UserRowMapper());
	}

	public int uppwd(String pwd, int id, String realname, long telephone) {

		String sql = "update userinfo set password=? where id =? and realname=? and telephone=?";
		Object[] obj = { pwd, id, realname, telephone };
		return JdbcUtil.executeUpdate(sql, obj);
	}

	public List<Tags> getAllTags() {
		String sql = "select * from tags";
		List<Object> obList = JdbcUtil
				.getObjects(sql, null, new TagRowMapper());
		List<Tags> tagList = new ArrayList();
		for (Object obj : obList) {
			tagList.add((Tags) obj);
		}
		return tagList;
	}

	public List<Posts> getAllPosts(String action) {
		String sql = "";
		if (action.equals("index-fatie")) {
			sql = "select * from posts where type = 1 order by id desc limit 5";
		} else if (action.equals("index-tiwen")) {
			sql = "select * from posts where type = 2 order by id desc limit 5";
		} else if (action.equals("fatie")) {
			sql = "select * from posts  where type = 1 order by id desc ";
		} else if (action.equals("tiwen")) {
			sql = "select * from posts  where type = 2 order by id desc";
		}
		List<Object> obList = JdbcUtil.getObjects(sql, null,
				new PostRowMapper());
		List<Posts> posts = new ArrayList<Posts>();
		for (Object obj : obList) {
			posts.add((Posts) obj);
		}
		return posts;
	}

	public Posts getOnePostById(int id) {
		String sql = "select * from posts where id=?";
		Object[] obj = { id };
		Posts post = (Posts) JdbcUtil.getOneObject(sql, obj,
				new PostRowMapper());
		return post;
	}

	public int addUser(Posts post) {
		String sql = "insert into posts (tag,content,title) values (?,?,?)";
		Object[] obj = { post.getTagString(), post.getContext(),
				post.getTitleString() };
		return JdbcUtil.executeUpdate(sql, obj);
	}

	public List<Posts> getAllPostsByTid(String tid) {
		String sql = "select posts.*  from posts,tags where tags.id=posts.tag and tags.id =? order by posts.id desc";
		Object[] obj = { tid };
		List<Object> obList = JdbcUtil
				.getObjects(sql, obj, new PostRowMapper());
		List<Posts> posts = new ArrayList<Posts>();
		for (Object o : obList) {
			posts.add((Posts) o);
		}
		return posts;
	}

	public int savePost(Posts post) {
		String sql = "insert into posts (tag,content,title,type) values (?,?,?,?)";
		Object[] obj = { post.getTagString(), post.getContext(),
				post.getTitleString(), post.getType() };
		return JdbcUtil.executeUpdate(sql, obj);
	}

	public List<Comment> getAllCommentsByPid(String pid) {
		String sql = "select * from comments where pid = ?";
		Object[] obj = { pid };
		List<Object> objects = JdbcUtil.getObjects(sql, obj,
				new CommentRowMapper());
		List<Comment> comments = new ArrayList<Comment>();
		for (Object o : objects) {
			comments.add((Comment) o);
		}

		return comments;
	}

	public int addComment(Comment comment) {
		String sql = "insert into comments (pid,context,uid) values (?,?,?)";
		Object[] obj = { comment.getPid(), comment.getContext(),
				comment.getUid() };
		return JdbcUtil.executeUpdate(sql, obj);
	}

	public int deleteComment(String cid) {
		String sql = "delete from comments where id = ?";
		Object[] obj = { cid };
		return JdbcUtil.executeUpdate(sql, obj);
	}

/*	public Posts search(String s) {
		// TODO Auto-generated method stub
		String sql = "select * from tableName where column like %" + s + "%";
		String sql1 = "select * from posts where title like '%"+ "s"+"%'";
		System.out.println(s);
		Object[] obj = { s };
		return (Posts) JdbcUtil.getOneObject1(sql, new PostRowMapper());
	}*/
	
	public List<Posts> search(String s){
		String sql="select * from posts where title like ?";
		//List(Posts) postli1= new ArrayList(); 
		
		
		List<Object> obList = JdbcUtil.getObjects1(sql,new Object[]{s },
				new PostRowMapper());
		List<Posts> posts = new ArrayList<Posts>();
		for (Object obj : obList) {
			posts.add((Posts) obj);
		}
		
		
		/*List<Posts> postList = new ArrayList<Posts>();
		List<Object> oblist = JdbcUtil.getObjects1(sql, new Object[]{s}, new PostRowMapper());
		for(Object obj:oblist){
			postList.add((Posts)obj);
		}*/
		return posts;
	}

}

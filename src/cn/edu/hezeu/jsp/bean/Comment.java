package cn.edu.hezeu.jsp.bean;

public class Comment {

	
	private  int id ;
	private int pid;
	private String context;
	private String uid;
	private U user;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getPid() {
		return pid;
	}
	public void setPid(int pid) {
		this.pid = pid;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public U getUser() {
		return user;
	}
	public void setUser(U user) {
		this.user = user;
	}
}

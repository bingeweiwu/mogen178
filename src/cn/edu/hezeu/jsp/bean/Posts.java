package cn.edu.hezeu.jsp.bean;

public class Posts {

	
	private int id;
	private String tagString;
	private String context;
	private String titleString;
	private int type;
	private String date;
	 
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTagString() {
		return tagString;
	}
	public void setTagString(String tagString) {
		this.tagString = tagString;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	public String getTitleString() {
		return titleString;
	}
	public void setTitleString(String titleString) {
		this.titleString = titleString;
	}
	@Override
	public String toString() {
		return "Posts [id=" + id + ", tagString=" + tagString + ", context=" + context + ", titleString=" + titleString + ", type=" + type + ", date=" + date + "]";
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
	
}

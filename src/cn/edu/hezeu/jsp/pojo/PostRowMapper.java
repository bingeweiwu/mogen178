package cn.edu.hezeu.jsp.pojo;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.hezeu.jsp.bean.Posts;
import cn.edu.hezeu.jsp.utils.RowMapper;

public class PostRowMapper implements RowMapper {

	public Object mapRow(ResultSet rs) {
		Posts tag = new Posts();
		try {
			tag.setTagString(rs.getString("tag"));
			tag.setTitleString(rs.getString("title"));
			tag.setContext(rs.getString("content"));
			tag.setId(rs.getInt("id"));
			tag.setType(rs.getInt("type"));
			tag.setDate(rs.getString("itime"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tag;
	}

}

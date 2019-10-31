package cn.edu.hezeu.jsp.pojo;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.hezeu.jsp.bean.Comment;
import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.utils.RowMapper;

public class CommentRowMapper implements RowMapper {

	public Object mapRow(ResultSet rs) {
		Comment c = new Comment();
		try {
			c.setContext(rs.getString("context"));
			c.setId(rs.getInt("id"));
			c.setPid(rs.getInt("pid"));
			c.setUid(rs.getString("uid"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return c;
	}

}

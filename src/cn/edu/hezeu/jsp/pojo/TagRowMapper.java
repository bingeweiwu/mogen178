package cn.edu.hezeu.jsp.pojo;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.hezeu.jsp.bean.Tags;
import cn.edu.hezeu.jsp.utils.RowMapper;

public class TagRowMapper implements RowMapper {

	public Object mapRow(ResultSet rs) {
		Tags tag = new Tags();
		try {
			tag.setName(rs.getString("tag"));
			tag.setId(rs.getInt("id"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tag;
	}

}

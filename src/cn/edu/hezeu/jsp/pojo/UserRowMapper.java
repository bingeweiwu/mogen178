package cn.edu.hezeu.jsp.pojo;

import java.sql.ResultSet;
import java.sql.SQLException;

import cn.edu.hezeu.jsp.bean.U;
import cn.edu.hezeu.jsp.utils.RowMapper;

public class UserRowMapper implements RowMapper {

	public Object mapRow(ResultSet rs) {
		// TODO Auto-generated method stub
		U user = new U();
		try {
			user.setUsername(rs.getString("username"));
			user.setPassword(rs.getString("password"));
			user.setRealname(rs.getString("realname"));
			user.setRole(rs.getString("role"));
			user.setSex(rs.getString("sex"));
			user.setTelephone(rs.getLong("telephone"));
			user.setId(rs.getInt("id"));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

}

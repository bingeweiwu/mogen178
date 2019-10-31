package cn.edu.hezeu.jsp.utils;

import java.sql.ResultSet;

public interface RowMapper {
	public Object mapRow(ResultSet rs);
}

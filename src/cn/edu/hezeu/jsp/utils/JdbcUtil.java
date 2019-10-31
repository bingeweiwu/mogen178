package cn.edu.hezeu.jsp.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;

import cn.edu.hezeu.jsp.bean.Posts;

/**
 * 获取数据库连接和关闭数据库连接
 * 添加了增删改的操作
 * 作者：杨俊峰
 */
public final class JdbcUtil {	
	
	private static DataSource dataSource = null;
	static{
		try {
			dataSource =BasicDataSourceFactory.createDataSource(ReadConfig.getInstance().getProperty()) ;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static Connection getConnection(){
		Connection conn =null;
		try {
			conn = dataSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	/*static{
		try {
			//注册驱动
			Class.forName(ReadConfig.getInstance().getValue("driver"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection(){
		Connection conn = null;
		try {
			//获取连接
			String url = ReadConfig.getInstance().getValue("url");
			String userName= ReadConfig.getInstance().getValue("userName");
			String password = ReadConfig.getInstance().getValue("password");
			conn = DriverManager.getConnection(url, userName,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}*/
	
	
	/**使用Statement接口完成增删改操作，可能会有SQL注入的问题
	 * executeUpdate 返回值是一个整数，指示受影响的行数（即更新计数）
	 * */ 
	public static int executeUpdate(String sql){
	    	Connection conn = JdbcUtil.getConnection();
			Statement st = null;
			int updateResult = 0;
			//执行SQL
			try {
				st = conn.createStatement();
				updateResult = st.executeUpdate(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				JdbcUtil.close(null, st, conn);
			}
			return updateResult;
	}	
	/**使用PreparedStatement接口完成查找操作；所有结果集以List<Object>返回；没有有SQL注入的问题
	 *   executeQuery 用于产生单个结果集的语句
	 * */   
	public static List<Object> getObjects(String sql,Object[] params,RowMapper rowMapper){
		Connection conn = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		Object obj = null;
		List<Object> objList = null;
		try {
			conn = JdbcUtil.getConnection();
			ptst = conn.prepareStatement(sql);
			if(params != null){
				for(int i=0;i<params.length;i++){
					ptst.setObject(i+1, params[i]);
				}
			}
			rs = ptst.executeQuery();
			objList = new ArrayList<Object>();
			while(rs.next()){
				obj = rowMapper.mapRow(rs);
				objList.add(obj);
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			JdbcUtil.close(rs, ptst, conn);
		}		
		return objList;
	}
	
	
	/**使用PreparedStatement接口完成查找操作；如果结果集有值则把第一条封装对象返回，否则返回null；没有SQL注入的问题*/
	public static Object getOneObject(String sql,Object[] params,RowMapper rowMapper){
		Connection conn = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		Object obj = null;
		try {
			conn = JdbcUtil.getConnection();
			ptst = conn.prepareStatement(sql);
			if(params != null){
				for(int i=0;i<params.length;i++){
					ptst.setObject(i+1, params[i]);
				}
			}
			rs = ptst.executeQuery();
			if(rs.next()){
				obj = rowMapper.mapRow(rs);
			}			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			JdbcUtil.close(rs, ptst, conn);
		}		
		return obj;
	}
	
	
	/**使用PreparedStatement接口完成查找操作；如果结果集有值则把第一条封装对象返回，否则返回null；没有SQL注入的问题*/
	/*public static Object getOneObject1(String sql,RowMapper rowMapper){
		Connection conn = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		Object obj = null;
		try {
			conn = JdbcUtil.getConnection();
			ptst = conn.prepareStatement(sql);
			if(params != null){
				for(int i=0;i<params.length;i++){
					ptst.setObject(i+1, params[i]);
				}
				ptst.setObject(1, "%"+params[0]+"%");
			}
			System.out.println(sql);
			rs = ptst.executeQuery();
			if(rs.next()){
				obj = rowMapper.mapRow(rs);
			}			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			JdbcUtil.close(rs, ptst, conn);
		}		
		return obj;
	}*/
	
	/**使用PreparedStatement接口完成查找操作；所有结果集以List<Object>返回；没有有SQL注入的问题*/   
	public static List<Object> getObjects1(String sql,Object[] params,RowMapper rowMapper){
		Connection conn = null;
		PreparedStatement ptst = null;
		ResultSet rs = null;
		Object obj = null;
		List<Object> objList = null;
		try {
			conn = JdbcUtil.getConnection();
			ptst = conn.prepareStatement(sql);
			if(params != null){
				ptst.setObject(1, "%"+params[0]+"%");
			}
			rs = ptst.executeQuery();
			objList = new ArrayList<Object>();
			while(rs.next()){
				obj = rowMapper.mapRow(rs);
				objList.add(obj);
			}			
		} catch (SQLException e1) {
			e1.printStackTrace();
		} finally{
			JdbcUtil.close(rs, ptst, conn);
		}
		return objList;
	}

	
	
	/**使用PreparedStatement接口完成增删改操作，没有SQL注入的问题*/    
	public static int executeUpdate(String sql,Object[] params){
	    	Connection conn = JdbcUtil.getConnection();
			PreparedStatement ptst = null;
			int updateResult = 0;
			try {
				ptst = conn.prepareStatement(sql);
				if(params != null){
					for(int i=0;i<params.length;i++){
						ptst.setObject(i+1, params[i]);
					}
				}
				updateResult = ptst.executeUpdate();
			} catch (SQLException e1) {
				e1.printStackTrace();
			} finally{
				JdbcUtil.close(null, ptst, conn);
			}		
			return updateResult;
	}	
	public static void close(ResultSet rs,Statement st,Connection conn){
		try {
			if(rs != null)
			   rs.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try {
				if(st != null)
				   st.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally{
				try {
					if(conn != null)
					    conn.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}		
		}		
	}
 }

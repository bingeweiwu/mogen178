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
 * ��ȡ���ݿ����Ӻ͹ر����ݿ�����
 * �������ɾ�ĵĲ���
 * ���ߣ����
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
			//ע������
			Class.forName(ReadConfig.getInstance().getValue("driver"));
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	public static Connection getConnection(){
		Connection conn = null;
		try {
			//��ȡ����
			String url = ReadConfig.getInstance().getValue("url");
			String userName= ReadConfig.getInstance().getValue("userName");
			String password = ReadConfig.getInstance().getValue("password");
			conn = DriverManager.getConnection(url, userName,password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}*/
	
	
	/**ʹ��Statement�ӿ������ɾ�Ĳ��������ܻ���SQLע�������
	 * executeUpdate ����ֵ��һ��������ָʾ��Ӱ��������������¼�����
	 * */ 
	public static int executeUpdate(String sql){
	    	Connection conn = JdbcUtil.getConnection();
			Statement st = null;
			int updateResult = 0;
			//ִ��SQL
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
	/**ʹ��PreparedStatement�ӿ���ɲ��Ҳ��������н������List<Object>���أ�û����SQLע�������
	 *   executeQuery ���ڲ�����������������
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
	
	
	/**ʹ��PreparedStatement�ӿ���ɲ��Ҳ���������������ֵ��ѵ�һ����װ���󷵻أ����򷵻�null��û��SQLע�������*/
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
	
	
	/**ʹ��PreparedStatement�ӿ���ɲ��Ҳ���������������ֵ��ѵ�һ����װ���󷵻أ����򷵻�null��û��SQLע�������*/
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
	
	/**ʹ��PreparedStatement�ӿ���ɲ��Ҳ��������н������List<Object>���أ�û����SQLע�������*/   
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

	
	
	/**ʹ��PreparedStatement�ӿ������ɾ�Ĳ�����û��SQLע�������*/    
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

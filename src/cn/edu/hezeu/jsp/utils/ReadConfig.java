package cn.edu.hezeu.jsp.utils;

import java.io.IOException;
import java.util.Properties;

public class ReadConfig {
	private static ReadConfig readconfig = null;
	private Properties property = new Properties();
	private String filepath = "cn/edu/hezeu/jsp/utils/dbconfig.properties";

	private ReadConfig() {
		readConfig();
	}

	private void readConfig() {
		try {
			property.load(this.getClass().getClassLoader()
					.getResourceAsStream(filepath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public static ReadConfig getInstance() {
		if (readconfig == null) {
			synchronized (ReadConfig.class) {
				if (readconfig == null)
					readconfig = new ReadConfig();
			}
		}
		return readconfig;
	}

	public String getValue(String key) {
		return property.get(key).toString() ;
	}

	public Properties getProperty() {
		return property;
	}

	public void setProperty(Properties property) {
		this.property = property;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ReadConfig db = ReadConfig.getInstance();
		System.out.println(ReadConfig.getInstance().getValue("userName"));
	}
}

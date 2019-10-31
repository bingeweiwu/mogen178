package cn.edu.hezeu.jsp.utils;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class RandomUtil {
	public static String getConfirmCode(int n) {
		int s;
		String str = "";
		for (int i = 0; i < n; i++) {
			s = new Random().nextInt(9);//
			char c = (char) (int) (Math.random() * 26 + 97);//
			str = str + s + c;
		}
		return str;
	}

	
	public static String getDateFormat() {
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyyÄêMMÔÂddÈÕ");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		
		return sdf1.format(new Date());

	}

	public static void main(String[] args) {
		RandomUtil random = new RandomUtil();
		random.getDateFormat();
		System.out.println(random.getDateFormat());
	}

}

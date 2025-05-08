package kr.or.ddoit.util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


public class MybatisUtil {
	
	private static SqlSessionFactory sessionFactory; // 세션을 관리해 줌
	static	{
		Charset charset = Charset.forName("UTF-8");
		Resources.setCharset(charset);
		
		try {
			Reader rd = Resources.getResourceAsReader("config/mybatis-config.xml");
			sessionFactory = new SqlSessionFactoryBuilder().build(rd);
			
			rd.close();
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public static SqlSession getInstance() {  
		return sessionFactory.openSession();   // 자동 커밋이 안 된다. 따라서 MybatisDao에서 괄호에 true를 넣어 줌 // insert가 여러 개 될 때 사용한다.
	}
	
	public static SqlSession getInstance(boolean autoCommit)	{
		return sessionFactory.openSession(autoCommit);
	}
	
	
}

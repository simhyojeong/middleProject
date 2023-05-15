package util;

import java.io.IOException;
import java.io.Reader;
import java.nio.charset.Charset;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;


/*
 * SqlSession 객체를 제공하는 팩토리 클래스
 */
public class MyBatisUtil {
	private static SqlSessionFactory sessionFactory;
	
	static {
		
		try {
			// 1-1. xml설정파일 읽어오기
			Charset charset = Charset.forName("UTF-8"); // 설정파일 인코딩 정보 설정
			Resources.setCharset(charset);
			Reader rd = Resources.getResourceAsReader("mybatis-config.xml");

			// 1.2. Reader객체를 이용하여 SqlSessionFactory 객체 생성
			sessionFactory = new SqlSessionFactoryBuilder().build(rd);

			// Reader 객체 닫기
			rd.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	/**
	 * SqlSession 객체를 제공하는 팩토리 메서드
	 * 기본값 : autoCommit false
	 * @return
	 */
	public static SqlSession getInstance(boolean autoCommit) {
		return sessionFactory.openSession(autoCommit);
	}
	
}

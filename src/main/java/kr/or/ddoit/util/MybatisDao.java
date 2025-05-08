package kr.or.ddoit.util;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class MybatisDao {


	public <T> List<T> selectList(String statement) { // <> 제네릭 ; 메소드의 타입을 지정
		SqlSession session = MybatisUtil.getInstance(true); // true를 작성하지 않으면 commit되지 않기 때문에 반드시 작성해야 함.

		List<T> list = null;

		try {
			list = session.selectList(statement); // statement를 넘겨주면 list가 나온다.
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return list;

	}

	public <T> List<T> selectList(String statement, Object param) {
		
		SqlSession session = MybatisUtil.getInstance(true); // true를 작성하지 않으면 commit되지 않기 때문에 반드시 작성해야 함.

		List<T> list = null;

		try {
			list = session.selectList(statement, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return list;
	}
	
	public <T> T selectOne(String statement) {
		SqlSession session = MybatisUtil.getInstance(true); // true를 작성하지 않으면 commit되지 않기 때문에 반드시 작성해야 함.
		T obj = null;
		try {
			obj = session.selectOne(statement);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return obj;
	}

	public <T> T selectOne(String statement, Object param) {
		SqlSession session = MybatisUtil.getInstance(true); // true를 작성하지 않으면 commit되지 않기 때문에 반드시 작성해야 함.
		T obj = null;
		try {
			obj = session.selectOne(statement, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return obj;
	}

	public int update(String statement) {
		SqlSession session = MybatisUtil.getInstance(true); // true를 작성하지 않으면 commit되지 않기 때문에 반드시 작성해야 함.
		int num = 0;
		try {
			num = session.update(statement);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return num;
	}
	
	public int update(String statement, Object param) {
		SqlSession session = MybatisUtil.getInstance(true); // true를 작성하지 않으면 commit되지 않기 때문에 반드시 작성해야 함.
		int num = 0;
		try {
			num = session.update(statement, param);
		} catch (Exception e) {
			e.printStackTrace();
		}
		session.close();
		return num;
	}
	public int insert(String statement, Object param) {
		SqlSession session = MybatisUtil.getInstance(true);
		int num = 0;
		try {
			num = session.insert(statement, param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return num;
	}
}

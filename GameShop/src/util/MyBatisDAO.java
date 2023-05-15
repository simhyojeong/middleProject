package util;

import java.util.List;

import org.apache.ibatis.exceptions.PersistenceException;
import org.apache.ibatis.session.SqlSession;


public class MyBatisDAO {

	public <T> T selectOne(String statement) {

		SqlSession session = MyBatisUtil.getInstance(false);

		T obj = null;

		try {
			obj = session.selectOne(statement);

		} catch (PersistenceException e) {
			throw new RuntimeException("데이터 조회 작업 중 예외 발생", e);
		} finally {
			session.close();
		}
		return obj;
	}
	
	public <T> T selectOne(String statement, Object parameter) {

		SqlSession session = MyBatisUtil.getInstance(false);

		T obj = null;

		try {
			obj = session.selectOne(statement, parameter);

		} catch (PersistenceException e) {
			throw new RuntimeException("데이터 조회 작업 중 예외 발생", e);
		} finally {
			session.close();
		}
		return obj;
	}
	
	public <T> List<T> selectList(String statement) {

		SqlSession session = MyBatisUtil.getInstance(false);

		List<T> list = null;

		try {
			list = session.selectList(statement);

		} catch (PersistenceException e) {
			throw new RuntimeException("데이터 목록조회 작업 중 예외 발생", e);
		} finally {
			session.close();
		}
		return list;
	}
	
	public <T> List<T> selectList(String statement, Object parameter) {

		SqlSession session = MyBatisUtil.getInstance(false);

		List<T> list = null;

		try {
			list = session.selectList(statement, parameter);

		} catch (PersistenceException e) {
			throw new RuntimeException("데이터 목록조회 작업 중 예외 발생", e);
		} finally {
			session.close();
		}
		return list;
	}

	public int insert(String statement, Object parameter) {
		SqlSession session = MyBatisUtil.getInstance(false);

		int cnt = 0;

		try {
			cnt = session.insert(statement, parameter);
			if (cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException e) {
			session.rollback();
			throw new RuntimeException("데이터 등록 작업 중 예외 발생", e);
		} finally {
			session.close();
		}

		return cnt;
	}

	public int update(String statement, Object parameter) {
		SqlSession session = MyBatisUtil.getInstance(false);

		int cnt = 0;

		try {
			cnt = session.update(statement, parameter);
			if (cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException e) {
			session.rollback();
			throw new RuntimeException("데이터 수정 작업 중 예외 발생", e);
		} finally {
			session.close();
		}

		return cnt;
	}

	public int delete(String statement, Object parameter) {
		SqlSession session = MyBatisUtil.getInstance(false);

		int cnt = 0;

		try {
			cnt = session.delete(statement, parameter);
			if (cnt > 0) {
				session.commit();
			}
		} catch (PersistenceException e) {
			session.rollback();
			throw new RuntimeException("데이터 삭제 작업 중 예외 발생", e);
		} finally {
			session.close();
		}

		return cnt;
	}
}

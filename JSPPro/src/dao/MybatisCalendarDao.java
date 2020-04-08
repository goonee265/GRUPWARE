package dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import model.CalendarDataBean;
import mybatis.AbstractRepository;

public class MybatisCalendarDao extends AbstractRepository {

	private final String namespace = "mybatis.Calendar";
	
	// 싱글톤 사용
	private static MybatisCalendarDao instance = new MybatisCalendarDao();

	public static MybatisCalendarDao getInstance() {
		return instance;
	}
	
	public void addSchd(CalendarDataBean article) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			    String statement = namespace + ".addSchd";
					sqlSession.insert(statement, article);
					sqlSession.commit();
			
		} finally {
			sqlSession.close();
		}
	}
	

	
	
	public List<CalendarDataBean> getSchd(int empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		
		try {
			String statement = namespace + ".getSchd";
			return sqlSession.selectList(statement, empno);			
			
		} finally {
			sqlSession.close();
		}
	}
}
	
package dao;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.BoardDataBean;
import model.CalendarDataBean;
import model.WorkDayCheckDataBean;
import mybatis.AbstractRepository;

public class MybatisWorkDayCheckDao extends AbstractRepository {

	private final String namespace = "mybatis.WorkDayCheck";
	
	// 싱글톤 사용
	private static MybatisWorkDayCheckDao instance = new MybatisWorkDayCheckDao();

	public static MybatisWorkDayCheckDao getInstance() {
		return instance;
	}
	
	public void insertTime(int empno, Timestamp workdate) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Map map = new HashMap();
		map.put("empno", empno);
	    map.put("workdate", workdate);
		
		try {
			String statement = namespace + ".insertTime";
			sqlSession.insert(statement, map);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	

	public WorkDayCheckDataBean getArticle(int empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		WorkDayCheckDataBean article = null;
	
		try {
			article = sqlSession.selectOne(namespace+".getArticle", empno);			
			
		
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return article;	
	}
	
	
	
	public List<WorkDayCheckDataBean> getDate(int empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getDate";
			return sqlSession.selectList(statement, empno);	
			
		} finally {
			sqlSession.close();
		}
	
	}
	
	
	
}
	
	
	
	
	
	
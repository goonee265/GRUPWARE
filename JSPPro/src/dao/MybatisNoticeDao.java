package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.NoticeDataBean;
import mybatis.AbstractRepository;

public class MybatisNoticeDao extends AbstractRepository {
	private final String namespace = "mybatis.Notice";

	// 싱글톤 사용
	private static MybatisNoticeDao instance = new MybatisNoticeDao();

	public static MybatisNoticeDao getInstance() {
		return instance;
	}

	public int getArticleCount() {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticleCount";
			return sqlSession.selectOne(statement);
		} finally {
			sqlSession.close();
		}
	}

	public List<NoticeDataBean> getArticles(int startRow, int endRow) {
		startRow = startRow - 1;
		endRow = endRow - startRow;

		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticles";
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}

	}

	public NoticeDataBean getArticle(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		NoticeDataBean article = null;

		try {
			article = sqlSession.selectOne(namespace + ".getArticle", num);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return article;
	}

	public void insertArticle(NoticeDataBean article) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		Map map = new HashMap();
		int num = article.getNum();
		int number = 1;

		try {
			number = sqlSession.selectOne(namespace + ".insert_max");

			article.setNum(number);

			String statement = namespace + ".insert";
			sqlSession.insert(statement, article);
			sqlSession.commit();

		} finally {
			sqlSession.close();
		}

	}

	public void deleteArticle(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			sqlSession.delete(namespace + ".delete", num);
			sqlSession.commit();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}
}

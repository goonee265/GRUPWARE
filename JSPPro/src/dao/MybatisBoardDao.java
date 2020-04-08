package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import model.BoardDataBean;
import mybatis.AbstractRepository;

public class MybatisBoardDao extends AbstractRepository {
	private final String namespace = "mybatis.Board";
	private static MybatisBoardDao instance = new MybatisBoardDao();

	public static MybatisBoardDao getInstance() {
		return instance;
	}

	private MybatisBoardDao() {
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

	public int getmyArticleCount(int empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {

			String statement = namespace + ".getmyArticleCount";
			return sqlSession.selectOne(statement, empno);
		} finally {
			sqlSession.close();
		}
	}

	public List<BoardDataBean> getArticles(int startRow, int endRow) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		startRow = startRow - 1;
		endRow = endRow - startRow;

		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		try {

			String statement = namespace + ".getArticles";
			return sqlSession.selectList(statement, map);

		} finally {
			sqlSession.close();
		}
	}

	public BoardDataBean getArticle(int num) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		BoardDataBean article = null;

		try {
			String statement = namespace + ".readcount";
			sqlSession.update(statement, num);
			sqlSession.commit();

			article = sqlSession.selectOne(namespace + ".getArticle", num);

		} finally {
			sqlSession.close();
		}
		return article;
	}

	public void insertArticle(BoardDataBean article) {

		SqlSession sqlSession = getSqlSessionFactory().openSession();

		Map map = new HashMap();
		int empno = article.getEmpno();
		int num = article.getNum();// 글번호 가져옴
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		int number = 0;
		try {

			String statement = namespace + ".insert_max";
			number = sqlSession.selectOne(statement);
			System.out.println("number:" + number);

			if (num != 0) {
				map.put("ref", ref);
				map.put("re_step", re_step);

				statement = namespace + ".updateReply";
				sqlSession.update(statement, map);
				sqlSession.commit();

				re_step = re_step + 1;
				re_level = re_level + 1;

			} else {
				ref = number;
			}
			statement = namespace + ".insert";

			article.setNum(number);
			article.setRef(ref);
			sqlSession.insert(statement, article);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public BoardDataBean getUpdateArticle(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		BoardDataBean article = null;

		try {
			String statement = namespace + ".getArticle";
			article = sqlSession.selectOne(statement, num);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return article;
	}

	public void updateArticle(BoardDataBean article) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String sql = "";

		try {
			String statement2 = namespace + ".update";
			sqlSession.update(statement2, article);
			sqlSession.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public void deleteArticle(int num) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {
			String statement = namespace + ".delete";
			sqlSession.delete(statement, num);
			sqlSession.commit();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

	public String getArticleName(int empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String name = "";

		try {
			String statement = namespace + ".getArticleName";
			name = sqlSession.selectOne(statement, empno);

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return name;
	}

}

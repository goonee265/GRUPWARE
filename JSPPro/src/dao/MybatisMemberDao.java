package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.BoardDataBean;
import model.MemberDataBean;
import mybatis.AbstractRepository;

public class MybatisMemberDao extends AbstractRepository {
	private final String namespace = "mybatis.Member";

	// 싱글톤 사용
	private static MybatisMemberDao instance = new MybatisMemberDao();

	public static MybatisMemberDao getInstance() {
		return instance;
	}

	/*
	 * public static Connection getConnection() throws Exception { Connection
	 * con = null; try { String jdbcUrl = "jdbc:mysql://localhost:3306/project";
	 * String dbId = "scott"; String dbPass = "1111";
	 * Class.forName("com.mysql.jdbc.Driver"); con =
	 * DriverManager.getConnection(jdbcUrl, dbId, dbPass); }
	 * 
	 * catch(Exception e) { e.printStackTrace(); } return con; }
	 */

	public void insertMember(MemberDataBean member) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".insertMember";
			sqlSession.insert(statement, member);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

	}

	public MemberDataBean getMember(String empno) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		MemberDataBean member = null;
		try {

			member = sqlSession.selectOne(namespace + ".getMember", empno);

		} finally {
			sqlSession.close();
		}

		return member;
	}

	public int confirmEmpno(int empno) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int x = -1;
		int number = 1;
		try {
			number = sqlSession.selectOne(namespace + ".confirmEmpno", empno);
			if (number != 0) {
				x = 1;
			}

			else {
				x = -1;
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return x;
	}

	public MemberDataBean confirmPasswd(int empno) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		MemberDataBean member = null;
		String dbpasswd = "";
		int number = 1;
		try {

			dbpasswd = sqlSession.selectOne(namespace + ".selectPasswd", empno);

			if (dbpasswd != null) {

				member = sqlSession.selectOne(namespace + ".selectPwq", empno);
				member.setPassword(dbpasswd);
			}

		} finally {
			sqlSession.close();
		}

		return member;

	}

	public int confirmLogin(int empno, String password) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String dbpasswd = "";
		MemberDataBean member = null;
		int x = -1;
		try {

			dbpasswd = sqlSession.selectOne(namespace + ".selectPasswd", empno);

			if (dbpasswd.equals(password)) {

				x = 1;

			} else {

				x = 0;
			}

		} finally {

		}
		return x;
	}

	public MemberDataBean getDept(String deptno) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		MemberDataBean member = null;
		try {

			member = sqlSession.selectOne(namespace + ".getDept", deptno);

		} finally {
			sqlSession.close();
		}

		return member;
	}

	public void updateMember(MemberDataBean member) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String dbpassword = "";
		int empno = member.getEmpno();
		try {

			dbpassword = sqlSession.selectOne(namespace + ".selectPasswd", empno);

			if (dbpassword != null) {

				sqlSession.update(namespace + ".updateMember", member);
				sqlSession.commit();

			}
		} finally {
			sqlSession.close();
		}

	}

	public void deleteMember(int empno) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		try {

			sqlSession.delete(namespace + ".deleteMember", empno);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}

	}

	// 상사 사원번호를 가져오는 메소드
	public int getSuperior(int empno) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		int superior = 0;

		try {
			superior = sqlSession.selectOne(namespace + ".getSuperior", empno);

		} finally {
			sqlSession.close();
		}
		return superior;
	}

	public List<BoardDataBean> getArticles(int startRow, int endRow, int empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();

		endRow = endRow - startRow;

		Map map = new HashMap();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("empno", empno);

		try {

			String statement = namespace + ".getArticles";
			return sqlSession.selectList(statement, map);

		} finally {
			sqlSession.close();
		}
	}
}

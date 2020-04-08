package dao;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import model.ApprovalDataBean;
import mybatis.AbstractRepository;

public class MybatisApprovalDao extends AbstractRepository {
	private final String namespace = "mybatis.Approval";

	// 싱글톤 사용
	private static MybatisApprovalDao instance = new MybatisApprovalDao();

	public static MybatisApprovalDao getInstance() {
		return instance;
	}

	// approval안의 글 숫자 가져오는 함수
	public int getArticleCount(String empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticleCount";
			return sqlSession.selectOne(statement, empno);
		} finally {
			sqlSession.close();
		}
	}

	// 게시판에 데이터 가져오기
	public List<ApprovalDataBean> getArticles(int startRow, int endRow, String empno) {
		List<ApprovalDataBean> articleList = null;

		Map map = new HashMap();

		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("empno", empno);
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticles";
			return sqlSession.selectList(statement, map);
		} finally {
			sqlSession.close();
		}
	}

	public String[] getConfirmers(String empno, int num) {
		String[] articleList = new String[10];

		Map map = new HashMap();
		map.put("empno", empno);
		map.put("num", num);

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getConfirmers";
			List<String> li = sqlSession.selectList(statement, map);
			String[] sarr = (String[]) li.toArray();
			return sarr;
		} finally {
			sqlSession.close();
		}
	}

	// 이름을 가져오는 메소드
	public String getArticleName(int empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticleName";
			return sqlSession.selectOne(statement, empno);
		} finally {
			sqlSession.close();
		}
	}

	// 데이터 넣기
	public void insertArticle(ApprovalDataBean article) {
		int num = 1;
		String confirmData="";
		String superior=getSuperiorempno(Integer.toString(article.getEmpno()));
		confirmData=article.getEmpno()+"/"+superior;

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			num = sqlSession.selectOne(namespace + ".insert_max");
			article.setNum(num);
			article.setConfirm(confirmData);
			String statement = namespace + ".insertArticle";
			sqlSession.insert(statement, article);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public String getFirstConfirm(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getFirstConfirm";
			return sqlSession.selectOne(statement, num);
		} finally {
			sqlSession.close();
		}
	}

	public List getNextConfirm1(int empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getNextConfirm1";
			return sqlSession.selectList(statement, empno);
		} finally {
			sqlSession.close();
		}
	}

	public String getNextConfirm2(int empno, int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		Map map = new HashMap();
		map.put("empno", empno);
		map.put("num", num);
		try {
			String statement = namespace + ".getNextConfirm2";
			return sqlSession.selectOne(statement, map);
		} finally {
			sqlSession.close();
		}

	}

	public ApprovalDataBean getArticle(int num) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getArticle";
			return sqlSession.selectOne(statement, num);
		} finally {
			sqlSession.close();
		}
	}

	public void checkArticle(ApprovalDataBean article) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		String superior = ""; // 결제자의 상관을 저장 변수
		String confirmdata = ""; // 결제 데이터를 가져와서 저장할 변수
		String sql = "";
		
		int num=article.getNum();
		confirmdata = article.getConfirm();
		superior = getSuperiorempno(article.getCheckEmpno());
		
		if(superior==null){
			superior="X";
		}
	
		article.setConfirm(confirmdata + "/" + superior);		
		
		try {			
			String statement = namespace + ".checkArticle";
			sqlSession.update(statement, article);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	// 상급자 사번을 가져오는 함수
	public String getSuperiorempno(String empno) {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getSuperiorempno";
			return sqlSession.selectOne(statement, empno);
		} finally {
			sqlSession.close();
		}
	}

	// 전결버튼을 누르면 일어나는 일
	public void checkEndArticle(ApprovalDataBean article) throws Exception {

		String confirmdata = article.getConfirm();; // 결제 데이터를 가져와서 저장할 변수
		confirmdata = confirmdata+"/X";
		article.setConfirm(confirmdata);
		int num=article.getNum();
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".checkEndArticle";
			sqlSession.update(statement, article);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	// 수정 버튼을 누르면 그글의 정보를 가져오는 메소드
	public ApprovalDataBean getUpdateArticle(int num) {
		ApprovalDataBean article = new ApprovalDataBean();
		article.setName(getArticleName(article.getEmpno()));
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getUpdateArticle";
			return sqlSession.selectOne(statement, num);
		} finally {
			sqlSession.close();
		}
	}

	// 수정 누르면 수정되는 메소드
	public void draftUpdateArticle(ApprovalDataBean article) throws Exception {
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".draftUpdateArticle";
			sqlSession.update(statement, article);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public void deleteArticle(int num) throws Exception {
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			sqlSession.delete(namespace+".deleteArticle", num);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}

	public void returnArticle(ApprovalDataBean article) throws Exception {
		String confirmdata = article.getConfirm();; // 결제 데이터를 가져와서 저장할 변수
		confirmdata = confirmdata+"/O";
		article.setConfirm(confirmdata);
		int num=article.getNum();
		
		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".returnArticle";
			sqlSession.update(statement, article);
			sqlSession.commit();
		} finally {
			sqlSession.close();
		}
	}
	
	public String[] getConfirmers2(String empno, int num) {
		String[] articleList = new String[10];

		Map map = new HashMap();
		map.put("empno", empno);
		map.put("num", num);
		
		System.out.println("empno : "+empno);
		System.out.println("num : "+num);

		SqlSession sqlSession = getSqlSessionFactory().openSession();
		try {
			String statement = namespace + ".getConfirmers2";
			String test = sqlSession.selectOne(statement, map);
			System.out.println("test: " +test);
			String[] test2;
			test2=test.split("/");
			
			for(int i=0; i<test2.length; i++){
				System.out.println(test2[i]);
			}
			
			return test2;
		} finally {
			sqlSession.close();
		}
	}
}

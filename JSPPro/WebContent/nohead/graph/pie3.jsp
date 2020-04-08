<%@ page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="org.json.JSONObject"%>
<%
	//커넥션 선언
	Connection con = null;
	try {
		//드라이버 호출, 커넥션 연결
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		con = DriverManager.getConnection("jdbc:mysql://localhost:3306/project", "scott", "1111");

		//ResultSet : 쿼리문에 대한 반환값
		ResultSet rs = null;

		//DB에서 뽑아온 데이터(JSON) 을 담을 객체. 후에 responseObj에 담기는 값
		List barlist = new LinkedList();

		String query = "SELECT * FROM category";
		PreparedStatement pstm = con.prepareStatement(query);

		rs = pstm.executeQuery();

		//ajax에 반환할 JSON 생성
		JSONObject responseObj = new JSONObject();
		JSONObject barObj = null;

		//소수점 2번째 이하로 자름
		DecimalFormat f1 = new DecimalFormat("");
		//rs의 다음값이 존재할 경우
		while (rs.next()) {
			String category = rs.getString("category");
			int c2018_11 = rs.getInt("C2018_11");
			int c2018_12 = rs.getInt("c2018_12");
			int c2019_01 = rs.getInt("c2019_01");
			int c2019_02 = rs.getInt("c2019_02");
			int c2019_03 = rs.getInt("c2019_03");
			int c2019_04 = rs.getInt("c2019_04");
			int c2019_05 = rs.getInt("c2019_05");
			int c2019_06 = rs.getInt("c2019_06");
			int c2019_07 = rs.getInt("c2019_07");
			int c2019_08 = rs.getInt("c2019_08");
			int c2019_09 = rs.getInt("c2019_09");
			int c2019_10 = rs.getInt("c2019_10");
			int c2019_11 = rs.getInt("c2019_11");
			
			barObj = new JSONObject();
			barObj.put("category", category);
			
			barObj.put("c2018_11", c2018_11);
			barObj.put("c2018_12", c2018_12);
			barObj.put("c2019_01", c2019_01);
			barObj.put("c2019_02", c2019_02);
			barObj.put("c2019_03", c2019_03);
			barObj.put("c2019_04", c2019_04);
			barObj.put("c2019_05", c2019_05);
			barObj.put("c2019_06", c2019_06);
			barObj.put("c2019_07", c2019_07);
			barObj.put("c2019_08", c2019_08);
			barObj.put("c2019_09", c2019_09);
			barObj.put("c2019_10", c2019_10);
			barObj.put("c2019_11", c2019_11);
			
			
			//barObj.put("dress", dress);
			

			barlist.add(barObj);
		}

		responseObj.put("barlist", barlist);
		out.print(responseObj.toString());

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		if (con != null) {
			try {
				con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
%>
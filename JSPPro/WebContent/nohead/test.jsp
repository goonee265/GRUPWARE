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

      String query = "SELECT * FROM media where year = ?";
      PreparedStatement pstm = con.prepareStatement(query);
      String showyear = request.getParameter("year");
      
      pstm.setString(1, showyear);
      rs = pstm.executeQuery();

      //ajax에 반환할 JSON 생성
      JSONObject responseObj = new JSONObject();
      JSONObject barObj = null;

      //소수점 2번째 이하로 자름
      DecimalFormat f1 = new DecimalFormat("");
      //rs의 다음값이 존재할 경우
      while (rs.next()) {
         String year = rs.getString("year");
         int tv = rs.getInt("tv");
         int cabletv = rs.getInt("cabletv");
         int radio = rs.getInt("radio");
         int newspaper = rs.getInt("newspaper");
         int internet = rs.getInt("internet");
         int mobile = rs.getInt("mobile");
         int outdoor = rs.getInt("outdoor");
         barObj = new JSONObject();
         barObj.put("year", year);
         barObj.put("tv", tv);
         barObj.put("cabletv", cabletv);
         barObj.put("radio", radio);
         barObj.put("newspaper", newspaper);
         barObj.put("internet", internet);
         barObj.put("mobile", mobile);
         barObj.put("outdoor", outdoor);
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

<%response.sendRedirect("test2.jsp");%>
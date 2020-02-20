<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String idValue = request.getParameter("id");
	int id = Integer.parseInt(idValue);
	
	Connection conn = null;
	PreparedStatement itemPstmt = null;
	PreparedStatement detailPstmt = null;
	int res = -1;
	
	try {
		
		String url = "jdbc:mysql://localhost:3306/chap14?"
					+ "useUnicode=true&characterEncoding=utf8";
		String user = "root";
		String pass= "rootroot";
		// 2. connection 연결
		conn = DriverManager.getConnection(url, user, pass);
		conn.setAutoCommit(false); //db에 값 변경을 막음 
		
		String sql1 = "insert into item values(?,?)";
		itemPstmt = conn.prepareStatement(sql1);
		itemPstmt.setInt(1, id);
		itemPstmt.setString(2, "상품"+id);
		itemPstmt.executeUpdate();
		
		// 트렌젝션 테스트를 위해서 의도적으로 예외 발생
		if(request.getParameter("error") != null){
			throw new Exception("의도적으로 익셉션를 발생함");
		}
		
		String sql2 = "insert into item_detail values(?,?)";
		detailPstmt = conn.prepareStatement(sql2);
		detailPstmt.setInt(1, id);
		detailPstmt.setString(2, "상품 상세 설명 "+id);
		detailPstmt.executeUpdate();
		
		// 익셉션 없이 잘 처리 될 경우 커밋
		conn.commit();
		res = 0;
	} catch (Exception e){
		conn.rollback();
		e.printStackTrace();
	} finally {
		if(detailPstmt != null){ detailPstmt.close(); }
		if(itemPstmt != null){ itemPstmt.close(); }
		if(conn != null){ conn.close(); }
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		if(res < 0) {
			out.println("익셉션이 발생하였습니다.");
		} else {
			out.println("데이터가 성공적으로 삽입완료");
		}
	%>
</body>
</html>
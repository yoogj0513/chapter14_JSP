<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<jsp:useBean id="member" class="test.Member"/>
<jsp:setProperty property="*" name="member"/>
<%
	//1. driver loading
	//Class.forName("com.mysql.jdbc.Driver");

	Connection conn = null;
	PreparedStatement pstmt = null;
	int res = -1;
	
	try {
		String url = "jdbc:mysql://localhost:3306/chap14?"
					+ "useUnicode=true&characterEncoding=utf8";
		String user = "root";
		String pass= "rootroot";
		// 2. connection 연결
		conn = DriverManager.getConnection(url, user, pass);
		
		//3. pstmt 생성
		String sql = "insert into member values(?,?,?,?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, member.getMemberid());
		pstmt.setString(2, member.getPassword());
		pstmt.setString(3, member.getName());
		pstmt.setString(4, member.getEmail());
		
		res = pstmt.executeUpdate();
		pageContext.setAttribute("res", res);
	} finally {
		if(pstmt != null){
			pstmt.close();
		}
		if(conn != null){
			conn.close();
		}
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${res > 0 }">
		<h1>삽입에 성공하였습니다.</h1>
	</c:if>
	<c:if test="${res < 0 }">
		<h1>삽입에 실패하였습니다.</h1>
	</c:if>
	
	<a href="list.jsp">리스트로 이동</a>
</body>
</html>
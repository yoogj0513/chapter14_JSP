<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
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
	/* String memberid = request.getParameter("memberid");
	String name = request.getParameter("name"); */
	
	// 1. driver loading (드라이버 로딩) DB마다 다름 - MySQL 작성됨
	//Class.forName("com.mysql.jdbc.Driver");
	
	//커넥션
	Connection conn = null;
	Statement stmt = null;
	int res = -1;
	
	try {
		String url = "jdbc:mysql://localhost:3306/chap14?"
					+ "useUnicode=true&characterEncoding=utf8";
		String user = "root";
		String pass= "rootroot";
		// 2. connection 연결
		conn = DriverManager.getConnection(url, user, pass);
		
		// 3. statement 객체 생성
		stmt = conn.createStatement();
		
		// 4. query 실행
		String sql = "update member set name='"+member.getName()+"' where memberid='"+member.getMemberid()+"'";
		res = stmt.executeUpdate(sql);
		pageContext.setAttribute("res", res); //개발자가 필요에 의해서 넣는 값
		
	} finally {
		// 5. stmt 닫음
		if(stmt != null) {
			stmt.close();
		}
		
		// 6. connection 닫음
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
	<%-- <%
		if(res > 0) {
			out.println("<h1>성공하였습니다.</h1>");
		} else {
			out.println("<h1>실패하였습니다.</h1>");
		}
	%> --%>
	
	<c:if test="${res > 0 }">
		<h1>${member.memberid }의 이름을 ${member.name }으로 변경에 성공하였습니다.</h1>
	</c:if>
	<c:if test="${res < 0 }">
		<h1>${member.memberid }의 이름 변경에 실패하였습니다.</h1>
	</c:if>
	
	<a href="list.jsp">리스트로 이동</a>
</body>
</html>
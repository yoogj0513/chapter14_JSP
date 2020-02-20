<%@page import="test.Member"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try {
		String url = "jdbc:mysql://localhost:3306/chap14?"
				+ "useUnicode=true&characterEncoding=utf8";
		String user = "root";
		String pass= "rootroot";
		// 2. connection 연결
		conn = DriverManager.getConnection(url, user, pass);
		
		String sql = "select memberid, password, name, email from member";
		pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		ArrayList<Member> list = new ArrayList<>();
		while(rs.next()){
			Member m = new Member(rs.getString("memberid"),
								  rs.getString("password"),
								  rs.getString("name"),
								  rs.getString("email"));
			list.add(m);
		}
		pageContext.setAttribute("list", list);
		
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
<style>
	table {
		border-collapse: collapse;
	}
	
	td {
		border: 1px solid #000;
		padding: 5px;
	}
</style>
</head>
<body>
	<table>
		<tr>
			<td>아이디</td>
			<td>비밀번호</td>
			<td>이름</td>
			<td>이메일</td>
		</tr>
		<c:forEach var="list" items="${list }">
			<tr>
				<td>${list.memberid }</td>
				<td>${list.password }</td>
				<td>${list.name }</td>
				<td>${list.email }</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<a href="insertForm.jsp">추가 페이지로 이동</a><br>
	<a href="updateForm.jsp">이름 수정 페이지로 이동</a>
</body>
</html>
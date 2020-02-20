<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	label {
		width: 60px;
		float: left;
	}
</style>
</head>
<body>
	<form action="insertResult.jsp" method="post">
		<fieldset>
			<legend>수정</legend>
			<p>
			<label>아이디</label>
			<input type="text" name="memberid"/>
			</p>
			<p>
				<label>암호</label>
				<input type="password" name="password"/>
			</p>
			<p>
				<label>이름</label>
				<input type="text" name="name"/>
			</p>
			<p>
				<label>이메일</label>
				<input type="text" name="email"/>
			</p>
			<p>
				<input type="submit" value="삽입"/>
			</p>
		</fieldset>
	</form>
</body>
</html>
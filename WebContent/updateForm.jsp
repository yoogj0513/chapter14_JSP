<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	label {
		width: 50px;
		display: inline-block;
		
	}
</style>
</head>
<body>

	<form action="updateResult.jsp" method="post">
		<p>
			<label>아이디</label>
			<input type="text" name="memberid"/>
		</p>
		<p>
			<label>이름</label>
			<input type="text" name="name"/>
		</p>
		<p>		
			<input type="submit" value="변경"/>
		</p>		
	</form>

</body>
</html>
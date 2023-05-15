<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String msg = (String) session.getAttribute("msg");
session.removeAttribute("msg"); //꺼내온 메세지 속성 제거하기
System.out.println(msg);
%>
<!DOCTYPE html>
<html>
<meta charset="utf-8" />
<!-- jQuery 사용 명시 -->
<head>
<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
<title>계정 찾기 페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../css/login.css">
<link href="https://fonts.googleapis.com/css?family=Nanum+Brush+Script" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<style>
#id_form {
	font-size: 1.3em;
	width: 50%;
	width: 400px;
	background: #rgb(12, 12, 12);
	padding: 30px 60px;
}

#pwd_form {
	font-size: 1.3em;
	width: 50%;
	width: 400px;
	background: #rgb(12, 12, 12);
	padding: 20px 60px;
}

#login-form {
	
}

h3 {
	color: #FFFFFF;
	text-align: center;
}

.flex-container {
	display: flex;
	margin: 5px;
	border: 1px solid lightgray;
	border-radius: 10px;
	background-color: aliceblue;
	font-size: 24px;
}
</style>
<script>
<%if (msg != null) {%>
	alert("<%=msg%>");
<%}%>
</script>
<body>
	
	
	<div class="login-form" style="width: auto;">
		<div id="flex-item loginer">
			<div class="flex-item header">
				<div class="logo">
					<img src="../images/beans_logo.png" alt="">
				</div>
				<br>
				<div>
					<h3>아이디 및 비밀번호 찾기</h3>
				</div>
			</div>
			<br> <br>
			<fieldset style="border-color: #037BEE;">
				<legend style="color: #037BEE;">
					<span style="color: #FFFFFF;">&nbsp;Find Your ID&nbsp;</span>
				</legend>
				<form id="id_form" action="./searchId.do" method="POST">
					<div class="textbox">
						<input type="text" placeholder="Name" name="memName" required> <span class="check-message hidden">* 내용을 입력해주세요</span>
						<!--서버에서 아이디 찾기인지 비번찾기 인지 구별하기 위한 속성-->
					</div>
					<div class="textbox">
						<input type="text" placeholder="Phone (010-0000-0000)" pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}" name="memPh" required> <span class="check-message hidden">* 내용을 입력해주세요</span>
					</div>
					<div class="textbox">
						<input type="submit" value="아이디 찾기">
					</div>
				</form>
			</fieldset>
			<br>
			<fieldset style="border-color: #DC3544;">
				<legend>
					<span style="color: #FFFFFF;">&nbsp;Find Your Password&nbsp;</span>
				</legend>
				<form id="pwd_form" action="./searchPw.do" method="POST">
					<div class="textbox">
						<input type="text" placeholder="ID" name="memId" required> <span class="check-message hidden">* 내용을 입력해주세요</span>
						<!--서버에서 아이디 찾기인지 비번찾기 인지 구별하기 위한 속성-->
					</div>
					<div class="textbox">
						<input type="text" placeholder="Phone (010-0000-0000)" name="memPh" required pattern="[0-9]{3}-[0-9]{4}-[0-9]{4}"> <span class="check-message hidden">* 내용을 입력해주세요</span>
					</div>
					<div class="textbox">
						<input type="text" placeholder="e-mail (xxxx@xx.com)" name="memMail" required pattern="[a-zA-Z0-9]+@[a-zA-Z0-9]+(\.[a-z]{2,3})"> <span class="check-message hidden">* 내용을 입력해주세요</span>
					</div>
					<div class="textbox">
						<input type="submit" value="비밀번호 찾기">
					</div>
				</form>
			</fieldset>
		</div>
	</div>
	<script>
		

		
	</script>
</body>
</html>

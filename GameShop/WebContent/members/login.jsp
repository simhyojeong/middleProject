<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String msg = (String) session.getAttribute("msg");
	session.removeAttribute("msg"); //꺼내온 메세지 속성 제거하기
%>
<html>


<meta charset="UTF-8">
<head>
<title>로그인</title>
</head>
<script>
<%
	if (msg != null) {
%>
	alert("<%=msg%>");
<%
	}
%>

</script>
<!-- 참고 https://eungook.medium.com/recaptcha-v2-%ED%95%9C-%EB%B2%88-%EC%8D%A8%EB%B3%B4%EA%B8%B0-cc1964476456 -->
<script src="https://www.google.com/recaptcha/api.js" async defer></script>
<link rel="stylesheet" href="../css/login.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Hind&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>

</head>
<body>
 <div class="login-form">
      <div class="logo"><a href="/main.do"><img src="../images/beans_logo.png" alt=""></a></div>

      <div class="social-media">
        <button class="fb"><img src="../images/fb.png" alt=""></button>
        <button class="google"><img src="../images/google.png" alt=""></button>
        <button class="ps"><img src="../images/ps.png" alt=""></button>
        <button class="xbox"><img src="../images/xbox.png" alt=""></button>
        <button class="switch"><img src="../images/switch.png" alt=""></button>
      </div>

      <h6>Sign In</h6>

      <form action="/members/validation.do" method="POST" onsubmit="return onSubmit();">
        <div class="textbox">
          <input type="text" placeholder="ID" name="login_id" required>
          <span class="check-message hidden">* 내용을 입력해주세요</span>
        </div>

        <div class="textbox">
          <input type="password" placeholder="Password" name="login_pw" required>
          <span class="check-message hidden">* 내용을 입력해주세요</span>
        </div>

        <div class="options">
          <label class="remember-me">
<!--             <span class="checkbox">
              <input type="checkbox">
              <span class="checked"></span>
            </span>
            Remember me -->
          </label>

          <a href="/members/searchId.do" tabindex="-1">아이디/비밀번호를 잊으셨나요?</a>
        </div>
        <br>
          <div class="g-recaptcha"
			  data-sitekey="6LdANMgjAAAAAHmf_gk1_0B0UIB4Izo6VKldkEDc"></div>
        <input type="submit" value="Login" class="login-btn" onclick="">
        <div class="privacy-link">
          <a href="/faq/listFaq.do">Privacy Policy</a>
        </div>
      </form>

      <div class="dont-have-account">
        계정이 없으신가요?
        <a href="/members/join.do"> &nbsp;회원가입</a>
      </div>
    </div>
		
	
	<script>
		function onSubmit() {
			if (grecaptcha.getResponse().length == 0) {
				alert('reCAPTCHA를 확인해 주세요.');
				return false;
			}
			
			return true;
		}
		
		$(".textbox input").focusout(function(){
        if($(this).val() == ""){
          $(this).siblings().removeClass("hidden");
          $(this).css("background","#554343");
        }else{
          $(this).siblings().addClass("hidden");
          $(this).css("background","#484848");
        }
      });

      $(".textbox input").keyup(function(){
        var inputs = $(".textbox input");
        if(inputs[0].value != "" && inputs[1].value){
          $(".login-btn").attr("disabled",false);
          $(".login-btn").addClass("active");
        }else{
          $(".login-btn").attr("disabled",true);
          $(".login-btn").removeClass("active");
        }
      });
	</script>
</body>
</html>
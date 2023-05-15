<%@page import="members.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
   //    MemberVO loginMember = (MemberVO)session.getAttribute("mv");
MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");

String msg = session.getAttribute("msg") == null ? "" : (String)session.getAttribute("msg");
session.removeAttribute("msg");


System.out.println("등록 메세지 확인>> " + msg);


%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="../css/updateForm.css">

<link rel="stylesheet"
   href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
   src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>



<meta name="viewport" content="width=device-width, initial-scale=1">
<link
   href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
   rel="stylesheet">
   <link rel="stylesheet" href="../css/mypageHeader.css">
<script
   src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

<title>마이페이지</title>
</head>

<body>

	<header id="header-container-fluid">
		<jsp:include page="../main/header.jsp" />
	</header>
	
		<div id="container">
		<div class="tabs">
			<div class="tab-2">
				<label for="tab2-1" style="padding: 32px 0px;"><a
					id="mypageId" href="/members/updateMember.jsp">회원정보</a></label> <input
					id="tab2-1" name="tabs-two" type="radio" checked="checked">
			</div>
			<div class="tab-2">
				<label for="tab2-2" style="padding: 32px 0px;"><a
					id="mypageId" href="/order/purchaseRecord.do">구매내역</a></label> <input
					id="tab2-2" name="tabs-two" type="radio">
			</div>
			<div class="tab-2">
				<label for="tab2-3" style="padding: 32px 0px;"><a
					id="mypageId" href="/members/MyReview.do">리뷰내역</a></label> <input
					id="tab2-3" name="tabs-two" type="radio" >
			</div>
		</div>
	</div>

			
   <form action="./updateMember.do" method="post">

      <div class="whole" style="color: #0C0C0C;">
         <div class="top" style="padding-left: 280px;">
            <div class="modify">
               <h3 style=" font-size: 36px;">회원정보수정</h3>
               <p style="margin:40px 0px; color:#ddd; margin: auto;">계정 정보를 확인할 수 있습니다.</p>
            </div>
         </div>
         <div class="middle" style="font-size: 14px;  border: 2px solid #037bee;">

            <label for="id" class="id">*아이디</label> <input type="text"
               id="mem_id" name="mem_id"
               style="color: #037bee; border-radius: 4px;"
               value="<%=loginMember.getMemId()%>" disabled>
            <hr style="color: #FFFFFF;">
            <br> <label for="pass2" class="password2">새 비밀번호</label> <input
               type="password" id="mem_pass1" name="memPw" placeholder="새 비밀번호를 입력"
               style="color: #f4f4f4;border-radius: 4px;"
               required pattern="[a-z0-9]{7,}"> <span
               style="color: #f1f1f1; font-size: 12px; padding-left: 10px;"> *(영문/숫자포함 8자리)</span>
            <hr style="color: #FFFFFF;">
            <br> <label for="pass22" class="password22" >새 비밀번호 확인</label> <input
               type="password"
               style="color: #f4f4f4; border: none; border-radius: 4px;" placeholder="새 비밀번호 확인 "
               required pattern="[a-z0-9]{7,}">
            <hr style="color: #FFFFFF;">
            <br> <label for="name" class="name">*이름</label> <input
               type="text" id="mem_name" name="memName"
               style="color: #037bee; border-radius: 4px;"
               value="<%=loginMember.getMemName()%>" required pattern="[가-힣]{2,8}"
               disabled>
            <hr style="color: #FFFFFF;">
            <br> <label for="Hp" class="PH">휴대전화</label> <input type="text"
               style="color: #f4f4f4;border-radius: 4px;"
               placeholder="010-0000-0000" id="mem_PH" name="memPh"
               value="<%=loginMember.getMemPh()%>"
               pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}">
            <hr style="color: #FFFFFF;">
            <br > <label for="mail" class="mail">이메일</label> <input
               type="text"
               style=" color: #f4f4f4;border-radius: 4px;"
               id="mem_mail" name="memMail" value="<%=loginMember.getMemMail()%>"
               required pattern=[0-9a-zA-Z]+@[0-9a-zA-Z]+(\.[a-z]+){1,2}>
            <hr style="color: #FFFFFF;">
            <br> <label for="mail" class="mail">생년월일</label> <input
               type="date"
               style="color: #f4f4f4; border-radius: 4px;"
               id="MEM_BIRTH" name="memBirth"
               value="<%=loginMember.getMemBirth()%>" required>

         </div>
         <br> <br>



         <div class="bottom">
            <button class="moButton" type="submit" id="modify" name="modify"
               style="background-color: #3a3a3a; border:none; border-radius: 10px; color: #ffffff; padding-left: 8px; padding-right: 8px;">
               <a>회원정보수정</a>
            </button>


            <button
               class="MuiButtonBase-root MuiButton-root MuiButton-contained MuiButton-containedPrimary jss12 MuiButton-disableElevation Mui-disabled jss8 MuiButton-fullWidth Mui-disabled"
               tabindex="-1" type="submit" id="cancle"
               style="background-color: #037bee; border-radius: 10px; border:none;">
               <a href="../main.do" onclick="cancle" class="a-cancel"
                  style="color: #ffffff;  text-decoration-line: none;">취소</a>
            </button>
         </div>

         <br> 
         
   </form>
   <hr style="color: #FFFFFF;">



   <div class="container">
      <h6 class="d">계정삭제</h6>
      <p style="color: gray; font-size: 14px; margin: 0;">계정 삭제 요청을 클릭하여 모든 개인 정보, 구매 내역,
         게임 진행 상황, 인게임 콘텐츠, 언리얼 프로젝트 및 빈즈게임즈 지갑 계정을 포함한<br>
         빈즈게임즈 계정을 영구 삭제하는 절차를 시작합니다. 빈즈게임즈 계정이 삭제되고 나면, 지갑 잔액 역시 영구
         삭제됩니다.
      </p>





      <div class="container" style="padding-left:900px; margin: 0;">
<!--          <p>Click on the button to open the modal.</p> -->

         <button type="button" class="btn btn-outline-danger" data-bs-toggle="modal"
            data-bs-target="#myModal" style="border: none;">회원 탈퇴</button>
      </div>
      

      <%
         if (request.getParameter("error") != null) {
      %>
      <h4>
         <font color="red">입력하신 정보가 일치하지 않습니다</font>
      </h4>
      <%
         }
      %>




      <!-- The Modal -->
      <div class="modal" id="myModal">
         <div class="modal-dialog">
            <div class="modal-content">

               <!-- Modal Header -->
               <div class="modal-header">
                  <h4 class="modal-title">회원 탈퇴</h4>
                  <button type="button" class="btn-close btn-close-white"
                     data-bs-dismiss="modal"></button>
               </div>

               <!-- Modal body -->
               <div class="modal-body" style="text-align: center;">정말로 계정을 삭제 하시겠습니까?</div>

               <!-- Modal footer -->

               <div class="modal-footer">
<!--                   <button type="button" class="btn btn-danger" id="submitButton" -->
<!--                      data-bs-dismiss="modal">탈퇴</button> -->
               <a href="/members/logout.do" class="btn btn-danger" onfocus="blur()" id="submitButton">탈퇴</a>
               </div>

            </div>
         </div>
      </div>

<script>
//◆ 회원삭제 정보 변경 버튼
$('#submitButton').on('click', function(){
   
   alert("회원탈퇴가 완료되었습니다.")

       $.ajax({
         type: 'post',
         url: '/quitMemberController.do',
         data: {memId : "<%=loginMember.getMemId()%>"},
//          success: function(res){
//             alert(res);
//             locaton.href="/login.do";
//          },
         
         dataType: 'json'
      }); 
});


<%if(msg.equals("성공")) { %>
alert('회원정보 수정되었습니다.');
<% } %>



</script>
   
   
   
   </div>




</body>
</html>
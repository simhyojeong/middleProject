<%@page import="questions.answer.vo.AnswerVO"%>
<%@page import="members.member.vo.MemberVO"%>
<%@page import="questions.question.vo.QuestionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	QuestionVO qv = (QuestionVO)request.getAttribute("qv");
	AnswerVO ansv = (AnswerVO)request.getAttribute("ansv");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Q&A 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!--   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
  
  <link rel="stylesheet" href="../css/summernote/summernote-lite.css">
<style>

#ansCont:focus {
background: #121212;
}


#qnaADVContainer {
	padding-left: 15%;
	padding-right: 15%;
	background-color: rgb(12, 12, 12);
}
h1,hr {
	color: #ffffff;
}
#ADviewBody { /* 상세보기 바디 색     !!!썸머노트 뜨는곳이 검게 들어가서 글씨가 안보임*/
	background-color: rgb(12, 12, 12);
}
#writersetting {
	display: inline-block;
	width: 40%;
}
#datesetting {
	display: inline-block;
	width: 40%;
	padding-left: 10%;
}
.form-label { /* 제목,작성자,작성일,내용 글자색 */
	color: #ffffff;
}
#title.form-control, #writer.form-control, #date.form-control,#content.form-control { /*  제목,작성자,작성일 답변,답변일 값 배경,글자색 */
	background-color: #202020;
	color: #ffffff;
	border: none;
}
#anscontent.form-control {
	background-color: #202020;
	color: #ffffff;
	border: none;
}
</style>
</head>
<body id="qnaADVContainer" class="sb-nav-fixed">
<header id="header-container-fluid">
		<jsp:include page="../main/header.jsp" />
	</header>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/summernote/summernote-lite.js"></script>
  <script src="../js/summernote/summernote-ko-KR.js"></script>
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">상세보기</h1>
		<%
		if(qv.getQesId().equals(ansv.getQesId())){
		%>
		<div id="ADviewBody" class="card mb-4">
			<div class="card-body">
				<form>
					<div class="mb-3">
					<%
					if(qv.getQesTitle().contains("[신고]")){
						%>
						<label for="title" class="form-label">제목</label> <input
							type="text" class="form-control" id="title" name="qesTitle" style="color: rgb(255, 204, 51);"
							value="<%=qv.getQesTitle() %>" disabled>
					</div><hr>
					<%
					}else{
					%>
						<label for="title" class="form-label">제목</label> <input
							type="text" class="form-control" id="title" name="qesTitle"
							value="<%=qv.getQesTitle() %>" disabled>
					</div><hr>
					<%
					}
					%>
					<div id="writersetting" class="mb-3">
						<label for="writer" class="form-label">작성자</label> 
						<input type="text" class="form-control" id="writer" name="qesWriter"
							value="<%=qv.getMemName() %>" disabled>
					</div>
					<div id="datesetting" class="mb-3">
						<label for="regDate" class="form-label">작성일</label> 
						<input type="text" class="form-control" id="date" name="qesDate"
							value="<%=qv.getQesDate() %>" disabled>
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label>
						<textarea id="summernote" class="form-control" id="content" name="qescont"
							disabled><%=qv.getQesCont() %></textarea>
					</div>
					<a href="/adminQuestion/list.do" class="btn btn-outline-secondary" style="color: #ffffff">목록</a>
					<a href="/adminQuestion/delete.do?qesId=<%=qv.getQesId() %>" class="btn btn-outline-danger"
						onclick="return confirm('삭제하시겠습니까?')">질문 삭제</a>
				</form>
			</div>
		</div>
		
		<div id="ADviewBody" class="card mb-4">
			<div class="card-body">
				<form action="/answer/update.do" method="post">
				<input type="hidden" name="qesId" value="<%=qv.getQesId() %>">
				<div class="mb-3">
						<label for="answer" class="form-label">답변</label>
						
						<textarea class="form-control" id="anscontent" name="ansCont" 
						 required><%=ansv.getAnsCont() %></textarea>
					</div>
				<div class="mb-3">
						<label for="regDate" class="form-label">작성일</label> 
						<input type="text" class="form-control" id="date" name="ansDate"
							value="<%=ansv.getAnsDate() %>" disabled>
					</div>
					<button class="btn btn-outline-warning">수정</button>
					<a href="/answer/delete.do?qesId=<%=ansv.getQesId() %>" class="btn btn-outline-danger"
						onclick="return confirm('삭제하시겠습니까?')">답변 삭제</a>
				</form>
			</div>
		</div>
		<%
			}else{
		%>
		<div id="ADviewBody" class="card mb-4">
			<div class="card-body">
				<form>
					<div class="mb-3">
					<%
					if(qv.getQesTitle().contains("[신고]")){
						%>
						<label for="title" class="form-label">제목</label> <input
							type="text" class="form-control" id="title" name="qesTitle" style="color: rgb(255, 204, 51);"
							value="<%=qv.getQesTitle() %>" disabled>
					</div><hr>
					<%
					}else{
					%>
						<label for="title" class="form-label">제목</label> <input
							type="text" class="form-control" id="title" name="qesTitle"
							value="<%=qv.getQesTitle() %>" disabled>
					</div><hr>
					<%
					}
					%>
					<div id="writersetting" class="mb-3">
						<label for="writer" class="form-label">작성자</label> 
						<input type="text" class="form-control" id="writer" name="qesWriter"
							value="<%=qv.getMemName() %>" disabled>
					</div>
					<div id="datesetting" class="mb-3">
						<label for="regDate" class="form-label">작성일</label> 
						<input type="text" class="form-control" id="date" name="qesDate"
							value="<%=qv.getQesDate() %>" disabled>
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label>
						<textarea id="summernote" class="form-control" id="content" name="qescont"
							disabled><%=qv.getQesCont() %></textarea>
					</div>
					<a href="/adminQuestion/list.do" class="btn btn-outline-secondary" style="color: #ffffff">목록</a>
					
 					<a href="#" id="answerBtn" class="btn btn-outline-primary">답변</a>
 					<a href="//adminQuestion/delete.do?qesId=<%=qv.getQesId() %>" class="btn btn-outline-danger"
						onclick="return confirm('삭제하시겠습니까?')">질문 삭제</a>
				</form>
			</div>
		</div>
		<div id = 'disp' ></div>		

		<%
			}
		%>
	</div>
	</main>
	<script>
	let str = '<div id="ADviewBody" class="card mb-4">';
	str +=	'<div class="card-body">';
	str += '<form method="post">';
	str +=	'	<div class="mb-3 mt-3">';
	str +=	'		<label for="content" class="form-label">답변</label>';
	str +=	'		<textarea class="form-control" id="contentWrite" name="ansCont" style="background:#121212;color:white; border:none;" required></textarea></div>';
	str +=	'<div class="mb-3">';
	str +=	'<input type="text" class="form-control" id="num" name="qesId" value="<%=qv.getQesId() %>" hidden></div>';
	str +=	'<a href="/adminQuestion/detail.do?qesId=<%=qv.getQesId() %>" class="btn btn-outline-danger">취소</a>';
	str +=	'<button class="btn btn-outline-primary">등록</button></form></div></div>';
	
		$('#answerBtn').on('click',function(){
			
			$('#disp').html(str);
			
		});
        $('#summernote').summernote({
            tabsize: 2,
            height: 300
          });
  </script>
</body>
</html>
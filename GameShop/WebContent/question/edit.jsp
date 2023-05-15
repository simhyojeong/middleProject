<%@page import="questions.question.vo.QuestionVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	QuestionVO qv = (QuestionVO)request.getAttribute("qv");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Q&A 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!--   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
<!--   <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet"> -->
<style>

.note-editing-area, .note-status-output, .note-statusbar {
	background: #ddd !important;
}

.note-editable {
color: #121212;
}

#qnaEContainer {
	padding-left: 15%;
	padding-right: 15%;
	background-color: rgb(12, 12, 12);
}
h1,hr {
	color: #ffffff;
}
#editBody { /* 상세보기 바디 색  !!!썸머노트 뜨는곳이 검게 들어가서 글씨가 안보임 수정창은 괜찮음*/
	background-color: rgb(12, 12, 12);
}
.form-label { /* 제목,내용 글자색 */
	color: #ffffff;
}
</style>
</head>
<body id="qnaEContainer" class="sb-nav-fixed">
<header id="header-container-fluid">
		<jsp:include page="../main/header.jsp" />
</header>
  <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<form action="/question/update.do" method="post">
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">회원정보 수정</h1>
		<div id="editBody" class="card mb-4">
			<div class="card-body">
				<form method="post">
					<div class="mb-3 mt-3">
<!-- 						<label for="num" class="form-label">글번호</label>  -->
						<input type="text" class="form-control" id="num" name="qesId" value="<%=qv.getQesId() %>" hidden>
					</div>
					<div class="mb-3">
						<label for="title" class="form-label">제목</label> <input
							type="text" class="form-control" id="title" name="qesTitle" style="background: #ddd; color: #121212;"
							value="<%=qv.getQesTitle() %>" required>
					</div>
					<div class="mb-3">
						<label for="content" class="form-label">내용</label>
						<textarea id="summernote" class="form-control" id="content" name="qesCont" required><%=qv.getQesCont() %></textarea>
					</div>
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="writer" class="form-label">작성자</label> <input -->
<!-- 							type="text" class="form-control" id="writer" name="writer" -->
<%-- 							value="<%=qv.getMemId() %>" disabled> --%>
<!-- 					</div> -->
<!-- 					<div class="mb-3"> -->
<!-- 						<label for="regDate" class="form-label">날짜</label> <input -->
<!-- 							type="text" class="form-control" id="regDate" name="regDate" -->
<%-- 							value="<%=qv.getQesDate() %>" disabled> --%>
<!-- 					</div> -->
					<a href="/question/detail.do?qesId=<%=qv.getQesId() %>" class="btn btn-outline-secondary" style="color: #ffffff">이전</a>
					<button class="btn btn-outline-warning">수정</button>
				</form>
			</div>
		</div>
	</div>
	</main>
	<script>
        $('#summernote').summernote({
            placeholder: '',
            tabsize: 2,
            height: 300,
            toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			  fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72']
          });
  </script>
</body>
</html>
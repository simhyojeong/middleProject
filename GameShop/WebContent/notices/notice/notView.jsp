<%@page import="notice.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	NoticeVO nv = (NoticeVO)request.getAttribute("nv");
	String admin = (String) session.getAttribute("loginAdmin");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>공지사항</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!--   <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->
  
  <link rel="stylesheet" href="../css/summernote/summernote-lite.css">
<style>
#notVContainer { /* 전체범위 크기,색*/
	padding-left: 15%;
	padding-right: 15%;
	background-color: rgb(12, 12, 12);
}
h1,hr {
	color: #ffffff;
}
#viewBody { /* 상세보기 바디 색     !!!썸머노트 뜨는곳이 검게 들어가서 글씨가 안보임*/
	background-color: rgb(12, 12, 12);
}
#writersetting { /* 작성자랑 날짜 같이띄우기 */
	display: inline-block;
	width: 40%;
}
#datesetting { /* 작성자랑 날짜 같이띄우기 */
 	display: inline-block; 
 	width: 40%; 
 	padding-left: 10%; 
} 
.form-label { /* 제목,작성자,작성일,내용 글자색 */
	color: #ffffff;
}
#title.form-control, #writer.form-control, #date.form-control { /*  제목,작성자,작성일 값 배경,글자색 */
	background-color: #202020;
	color: #ffffff;
	border: none;
}
/* #content.form-control { */
/* 	background-color: #ffffff; */
/* } */
</style>
</head>
<body id="notVContainer" class="sb-nav-fixed">
<header id="header-container-fluid">
		<jsp:include page="../../main/header.jsp" />
	</header>
 <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="../js/summernote/summernote-lite.js"></script>
  <script src="../js/summernote/summernote-ko-KR.js"></script>
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">공지사항</h1>
		<div id="viewBody" class="card mb-4">
			<div class="card-body">
				<form>
<!-- 					<div class="mb-3 mt-3"> -->
<!-- 						<label for="num" class="form-label">글번호</label>  -->
<%-- 						<input type="text" class="form-control" id="num" name="notId" value="<%=nv.getNotId() %>" hidden> --%>
<!-- 					</div> -->
					<div class="mb-3">
						<label for="title" class="form-label">제목</label> <input
							type="text" class="form-control" id="title" name="notTitle"
							value="<%=nv.getNotTitle() %>" readonly>
					</div><hr>
					<div id="writersetting" class="mb-3">
						<label for="writer" class="form-label">작성자</label> 
						<input type="text" class="form-control" id="writer" name="notWriter"
							value="admin" disabled>
					</div>
					<div id="datesetting" class="mb-3">
						<label for="regDate" class="form-label">작성일</label> 
						<input type="text" class="form-control" id="date" name="notDate"
							value="<%=nv.getNotDate() %>" disabled>
					</div>
					<div class="mb-3"><hr>
						<label for="content" class="form-label">내용</label>
						<textarea id="summernote" class="form-control" id="content" name="notCont"
							disabled><%=nv.getNotCont() %></textarea>
					</div>
					<a href="/notice/list.do" class="btn btn-outline-secondary" style="color: #ffffff">목록</a>
					<%
					if(admin != null){
				%>
					<a href="/notice/update.do?notId=<%=nv.getNotId() %>" class="btn btn-outline-warning">수정</a>
					<a href="/notice/delete.do?notId=<%=nv.getNotId() %>" class="btn btn-outline-danger"
						onclick="return confirm('삭제하시겠습니까?')">삭제</a>
				<%	
					}else{
						
					}
				%>
				</form>
			</div>
		</div>
	</div>
	</main>
	<script>
        $('#summernote').summernote({
            tabsize: 2,
            height: 800
          });
  </script>
</body>
</html>
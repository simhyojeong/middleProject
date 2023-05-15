<%@page import="questions.answer.vo.AnswerVO"%>
<%@page import="members.member.vo.MemberVO"%>
<%@page import="questions.question.vo.QuestionVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<AnswerVO> ansList = (List<AnswerVO>)request.getAttribute("ansList");
	List<QuestionVO> qesList = (List<QuestionVO>)request.getAttribute("qesList");
	MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
	List<QuestionVO> list = (List<QuestionVO>)request.getAttribute("list");

	int qesSize = qesList.size();
	int currentPage = request.getParameter("page") == null ? 1 : Integer.parseInt(request.getParameter("page"));

	String msg = session.getAttribute("msg") == null ?
			"" : (String)session.getAttribute("msg");
	session.removeAttribute("msg");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>Q&A 관리</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<!--    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>  -->
<style>
#ADqnaContainer {
	padding-left: 15%;
	padding-right: 15%;
	background-color: rgb(12, 12, 12);
}
#ADlistBody { /* 테이블 전체 배경색, 글씨 크기 */
 	background-color: rgb(12, 12, 12);
 	font-size: 1.6rem;
}
#ADlistHN, #ADlistHW, #ADlistHD{ /* 헤더에 글씨색 중앙정렬 배경색 */
	color: #ffffff;
	background-color: #d32f2f;
	text-align: center;
}
#ADlistHT { /* 헤더에 제목 글씨,배경 색만 */
	color: #ffffff;
	background-color: #d32f2f;
	text-align: center;
}
#listTitle { /* 테이블 제목값 색 */
  	color: #ffffff;  
}
#pagenum { /* 페이징 번호prev,next 배경색, 테두리 안보이게 */
	background: rgb(12, 12, 12);
 	border:none; 
}
h1 {
	color: #ffffff;
}
#qnaId {
 width: 10%;
 text-align: center;
}
#qnaTitle {
 width: 53%;
}
#qnaWriter {
 width: 12%;
 text-align: center;
}
#qnaDate {
 width: 25%;
 text-align: center;
}
#anschk {  /* 답변등록 체크  */
	color: #d32f2f;
}
#qnatable{
/*  	background-color: #121212; */
}
/*  .pager{  */
/*       float: center;    */
/*  } */
#pagelist{
     display: flex;  
     justify-content: center;   
}
</style>
</head>
<body id="ADqnaContainer" class="sb-nav-fixed">
	<header id="header-container-fluid">
		<jsp:include page="../main/header.jsp" />
	</header>
	<main class="mt-5 pt-5">
	<div class="container-fluid px-4">
		<h1 class="mt-4">Q&A</h1>

		<div id="ADlistBody" class="card mb-4">
			<div class="card-header">
<!-- 				<a class="btn btn-primary float-end" href="/question/insert.do"> <i class="fas fa-table me-1"></i> -->
<!-- 					<i class="fas fa-edit"></i> 글 작성 -->
<!-- 				</a> -->
			</div>
			
			<div class="card-body">
				<table class="table table-hover table-dark table-striped">
					<thead>
						<tr>
							<th id="ADlistHN">글번호</th>
							<th id="ADlistHT">제목</th>
							<th id="ADlistHW">작성자</th>
							<th id="ADlistHD">작성일</th>
						</tr>
					</thead>
					<tbody>
				
<%
					int count = qesSize - (currentPage-1)*15;
					if(list != null) {
					for(int i=0; i<list.size(); i++){
				%>
						<tr>
<%-- 							<td><%=qesList.get(i).getQesId() %></td> --%>
							<td id="qnaId"><%=count %></td>
							<%
							if(list.get(i).getQesTitle().contains("[신고]")){
							%>
							<td id="qnaTitle"><a id="listTitle" href="/adminQuestion/detail.do?qesId=<%=list.get(i).getQesId() %>" style="color: rgb(255, 204, 51);"><%=list.get(i).getQesTitle() %></a>
								<%
								if(ansList != null){
									for(int j=0; j<ansList.size(); j++){
										if(list.get(i).getQesId().equals(ansList.get(j).getQesId())){
											break;
										}else if(j+1 == ansList.size()){ // 값비교하는 if끝
											%>
												<a id="anschk" href="/adminQuestion/detail.do?qesId=<%=list.get(i).getQesId() %>"> ▶ 답변미등록</a>
											<%
										}
									} //  j for문끝
								} // anslist if문끝
							%>
							</td>
							<%
							}else{
							%>
							<td id="qnaTitle"><a id="listTitle" href="/adminQuestion/detail.do?qesId=<%=list.get(i).getQesId() %>"><%=list.get(i).getQesTitle() %></a>
								<%
								if(ansList != null){
									for(int j=0; j<ansList.size(); j++){
										if(list.get(i).getQesId().equals(ansList.get(j).getQesId())){
											break;
										}else if(j+1 == ansList.size()){ // 값비교하는 if끝
											%>
												<a id="anschk" href="/adminQuestion/detail.do?qesId=<%=list.get(i).getQesId() %>"> ▶ 답변미등록</a>
											<%
										}
									} //  j for문끝
								} // anslist if문끝
							%>
							</td>
							<%
							}
							%>
							<td id="qnaWriter"><%=list.get(i).getMemName() %></td>
							<td id="qnaDate"><%=list.get(i).getQesDate() %></td>
						</tr>
				<%
				count--;
			} //for end
					
		}else{
			
		}
    %>
    
					</tbody>
				</table>
					<!--페이지 영역 -->
            <div id="pagelist">
                  
               <ul class="pager">
                  <li class = "prev"><a id="pagenum" href="#" style="color: #d32f2f">Prev</a></li>
               </ul>
               
               <!--pagination -->
               <ul class="pagination pager">
               <%
                  int sPage= (int)request.getAttribute("sPage");
                  int ePage= (int)request.getAttribute("ePage");
                  int cPage= (int)request.getAttribute("cPage");
                  
                  for(int i=sPage; i <=ePage; i++){
                     //선택된 페이지 번호 활성화 하기
                     if(i == cPage){
               %>
                  <li class="active"><a id="pagenum" href="#"><%=i %></a></li>
               <%
                     }else{
               %>
                  <li><a id="pagenum" href="#" style="color: #d32f2f"><%=i %></a></li>
               <% 
                     }//if else end 
                  }//for end
               %>
               </ul>
            
               <ul class="pager">
                  <li class="next"><a id="pagenum" href="#" style="color: #d32f2f">Next</a></li>
               </ul>
            </div>
            <!--페이지 영역 -->
			</div>
		</div>
	</div>
	</main>
<script>
//페이지 번호 클릭 이벤트>> 다음으로 넘어가는 
$('.pagination li').on('click',function(){
//    alert($(this).text());
   location.href = "/adminQuestion/list.do?page=" + $(this).text();
// main이라는 페이지로 보내준다는것? 
});

//이전/다음 버튼 클릭 이벤트 
let currentPage = ""; 
$('.next').on('click',function(){
   //현재 페이지 == 전체 페이지 수 비교하고 같지 않을 때 
   //+1 한 현재페이지 정보를 Main(페이지처리)서블릿으로 전달 
   if(<%=request.getAttribute("cPage")%> ==  <%=request.getAttribute("ttPage")%>){
      currentPage = <%=request.getAttribute("cPage")%>;
   }else{
      //currentPage +1 ~~~~ > 서블릿으로 전달하기 
      currentPage = <%=request.getAttribute("cPage")%> +1;
   }
   location.href = "/adminQuestion/list.do?page=" + currentPage;   
});

$('.prev').on('click',function(){
   //현재페이지 ==1 과 비교하고,
   // 같지 않을 때 -1 한 현재페이지 정보를 Main(페이지처리) 서블릿으로 전달
   if(<%=request.getAttribute("cPage")%> ==  <%=request.getAttribute("sPage")%>){
      currentPage = <%=request.getAttribute("cPage")%>;
   }else{
      //currentPage +1 ~~~~ > 서블릿으로 전달하기 
      currentPage = <%=request.getAttribute("cPage")%> -1;
   }
   location.href = "/adminQuestion/list.do?page=" + currentPage;   
});
</script>	
</body>
</html> 
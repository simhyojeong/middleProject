<%@page import="members.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<MemberVO> memList = (List<MemberVO>) request.getAttribute("memList");
List<MemberVO> list = (List<MemberVO>) request.getAttribute("list");

List<MemberVO> modifiedMv = (List<MemberVO>) request.getAttribute("modifiedMv");

 int res = (Integer)request.getAttribute("res");


String msg = session.getAttribute("msg") == null ? "" : (String) session.getAttribute("msg");
session.removeAttribute("msg");
%>

<!DOCTYPE html>
<html lang="en">
<head>

<!-- 추가 -->
<meta name="viewport" content="width=device-width, initial-scale=1">



<title>회원목록조회</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="../css/gameListAdmin.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.1/dist/jquery.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="../css/memberAdminList.css">

<style>
table {
	width: 100%;
	border-top: 1px solid #444444;
	border-collapse: collapse;
	boerder-padding: 10px;
	
}

th, td {
	border-bottom: 1px solid #444444;
	padding: 10px;
	text-align: center;
	margin: auto;
}

th {
	background-color: #202020;
	color: #FFFFFF;
	font-family: Brutal, sans-serif;
	font-size: 15px;
	font-weight: 400;
	border-bottom: 2px solid #DC3545;
	margin: auto;
	text-align: center;
}

td {
	background-color: #121212;
	color: #FFFFFF;
	font-family: Brutal, sans-serif;
	font-size: 13px;
	font-weight: 400;
}

h3 {
	color: #DDDDDD;
	font-family: Brutal, sans-serif;
	font-size: 25px;
	font-weight: 400;
}

.column middle {
	width: 600px;
	height: 500px;
}

#myInput {
	background-image: url('/css/searchicon.png');
	background-position: 10px 10px;
	background-repeat: no-repeat;
	width: 150px;
	font-size: 12px;
	padding: 5px 5px 5px 5px;
	border: 1px solid #FFFFFF;
	margin-bottom: 12px;
	display: inline-block;
	background-color: white;
    color: black;
    border: 2px solid #e7e7e7;
    
	
	
}
.searchbox{
 padding-left: 80px;
 margin-right: 135px;

}

#myTable {
	border-collapse: collapse;
	width: 75%;
	border: 1px solid #ddd;
	font-size: 18px;
}

#myTable th, #myTable td {
	padding: 12px;
	font-size: 14px;
}

#myTable tr {
	border-bottom: 1px solid #ddd;
}

#myTable tr.header, #myTable tr:hover {
	background-color: #f1f1f1;
}

h3 {
	text-align: center;
}

#th_content{
    text-align: center;
}

</style>
</head>


<body id="memberAdminList-body">


	<!-- 헤더부분 -->
	<header id="header-container-fluid">
		<jsp:include page="/main/header.jsp" />
	</header>


<!-- 	<h3>회원목록 조회</h3> -->

	<div class="container-fluid">
	<div class="row">
			<div class="column side">
				<div class="col-lg-3 col-md-3 col-sm-3 sidebar-section hidden-xs">
					<br> <br> <br> <br> <br> <br>
					<div class="container sidebar-container" style="margin-left: 15px">
						<div class="navigation-section"
							style="width: 230px; padding-left: 30px;">
							<!-- 회원 정보 변경 버튼 -->
							<button class="setting col-sm-12 col-md-12 personal-info active"
								 id="btn0" style="width:198px; height: 53.5px; font-size:11.76px;">
								회원 관리<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 password" id="btn1" style="width:198px; height: 53.5px; font-size:11.76px;">
								게임 관리<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 password " id="btn2" style="width:198px; height: 53.5px; font-size:11.76px;">
								게임 추가<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 password " id="btn3" style="width:198px; height: 53.5px; font-size:11.76px;">
								무료 게임 설정<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 password " id="btn4" style="width:198px; height: 53.5px; font-size:11.76px;">
								리뷰 관리<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
							<button class="setting col-sm-12 col-md-12 password " id="btn5" style="width:198px; height: 53.5px; font-size:11.76px;">
								코드 발급<i
									class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
							</button>
						</div>
					</div>
				</div>
			</div>

   <div class="column middle">
   <div class="title_container" style="padding-left: 65px;">
			<p style="font-size:32px; margin:80px 0px 30px 0px; color:#ddd;">회원목록</p>
			<p style="margin:16px 0px; color:#999;">모든 회원의 정보를 조회할 수 있습니다.</p>
			</div>				
					<div class="searchbox" style="margin: auto; justify-content: flex-end;">
						<input type="text" id="myInput" onkeyup="myFunction()" 
							placeholder="아이디 검색" title="Type in a name"
							style="border-radius: 10px; border-color: #DC3545; background-color: #121212; color: #ddd;">
					</div>
   <div class="gamecodemiddle col-md-9 col-lg-9 col-sm-9 main-section">	
   
	<div class="container">



		<!-- 검색 -->



		<table id="myTable" style="margin-left:30px;">
			<thead>
				<tr class="header" >

					<th id="th_content" style="cursor: pointer;"onclick="sortTable(0)">Id</th>
					<th id="th_content" style="cursor: pointer;"onclick="sortTable(1)">이름</th>
					<th id="th_content" style="cursor: pointer;"onclick="sortTable(2)">전화번호</th>
					<th id="th_content" style="cursor: pointer;"onclick="sortTable(3)">이메일</th>
					<th id="th_content" style="cursor: pointer;"onclick="sortTable(4)">생일</th>
					<th id="th_content" style="cursor: pointer;"onclick="sortTable(5) ">탈퇴여부</th>
					<th id="th_content" style="cursor: pointer;">활성화</th> 
				</tr>
</thead>
<tbody id="tbody">
				<%
				if (list !=null) { for (int i=0; i < list.size(); i++) { 
				%>
			

			<tr>
				<td><%=list.get(i).getMemId()%></td>
				<td><%=list.get(i).getMemName()%></td>
				<td><%=list.get(i).getMemPh()%></td>
				<td><%=list.get(i).getMemMail()%></td>
				<td>
				<fmt:parseDate value="<%=list.get(i).getMemBirth()%>" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
				<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
				</td>
				<td><%=list.get(i).getMemQuit()%></td>
					<td><div class="btn_modify" style="margin: auto;">


						<!-- 수정 버튼 -->
						
						<button type="button" class="btn btn-link" id="submitButton" style="text-decoration: underline; 
							font-family: Brutal, sans-serif; font-size: 10px; font-weight: 400; color: #DC3545;" name="memId" onclick="location.href='./memberAdminList.do?memId=<%=list.get(i).getMemId()%>'">활성화</button>
					</div></td>
					
			</tr>


			<%
            } //for end
        } else {
        %>
			<tr>
				<td colspan="6">가입된 회원이 없습니다.</td>
			</tr>
			<%
            }
        %>
			</tbody>
		</table>

		<!--페이지 영역 -->
		<div id="pagelist" style= "padding-left: 330px; margin-top: 20px;">

			<ul class="pagination">
				<li class="prev"><a id="pagenum" href="#" style="border: none; background: none;  color:#d32f2f;">Prev</a></li>
			</ul>

			<!--pagination -->
			<ul class="pagination pager">
				<%
							    int sPage = (int) request.getAttribute("sPage");
								int ePage = (int) request.getAttribute("ePage");
								int cPage = (int) request.getAttribute("cPage");

								for (int i = sPage; i <= ePage; i++) {
									//선택된 페이지 번호 활성화 하기
									if (i == cPage) {
				%>
				<li class="page-item"><a class="page-link" href="#" id="pageNum" style="border: none; background: none; color: white; "><%=i%></a></li>
				<%
					} else {
								%>
				<li><a id="pagenum" href="#" style="border: none; background: none; color: #d32f2f;"><%=i%></a></li>
				<%
						} //if else end 
					} //for end
				%>
			</ul>

			<ul class="pagination">
				<li class="next" style="color: #DC3545"><a href="#" style="border: none; background: none;  color:#d32f2f;" >Next</a></li>
			</ul>
		</div>

	   </div>
	 </div>
	 
	 </div> <!-- 컬럼미들 -->
	</div>
  </div>
	<!-- container끝 -->






	<!-- middle -->

	
	
	
	<script>
	
	
	// sort 정렬부분
    function sortTable(n) {
	        var table, rows, switching, i, x, y, shouldSwitch, dir, switchCount = 0;
	        table = document.getElementById("myTable");
	        switching = true;
	        dir = "asc";
	
	        while (switching) {
	          switching = false;
	          rows = table.getElementsByTagName("TR");
               //rows = table.rows;	
	          
	          for (i = 1; i < (rows.length - 1); i++) {
	            shouldSwitch = false;
	            x = rows[i].getElementsByTagName("TD")[n];
	            y = rows[i + 1].getElementsByTagName("TD")[n];
	
	            if (dir == "asc") {
	              if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
	                shouldSwitch = true;
	                break;
	              }
	            } else if (dir == "desc") {
	              if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
	                shouldSwitch = true;
	                break;
	              }
	            }
	          }
	
	          if (shouldSwitch) {
	            rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
	            switching = true;
	            switchCount++;
	          } else {
	            if (switchCount == 0 && dir == "asc") {
	              dir = "desc";
	              switching = true;
	            }
	          }
	        }
   	 }

	
	
	
	 
	 

	 
	
	//페이징
		$(document).ready(
		function() {
		$("#myInput").on("keyup",
		function() {

	    var value = $(this).val().toLowerCase();
	    $("#myTable tr").filter(
	    function() {
	    $(this).toggle(
		$(this).text().toLowerCase().indexOf(value) > -1)
        });
    });
		
		
});
	
	
	

		//페이지 번호 클릭 이벤트>> 다음으로 넘어가는 
		$('.pagination li').on('click',function(){
//		    alert($(this).text());
		   location.href = "/memberAdminList.do?page=" + $(this).text();
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
		   location.href = "/memberAdminList.do?page=" + currentPage;   
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
		   location.href = "/memberAdminList.do?page=" + currentPage;   
		});

		
		

		
		
	</script>


	<script>
  
	
	
	
	
	
   function myFunction() {
	       var input, filter, table, tr, td, i, txtValue;
       input = document.getElementById("myInput");
       filter = input.value.toUpperCase();
       table = document.getElementById("tbody");
       tr = table.getElementsByTagName("tr");
       for (i = 0; i < tr.length; i++) {
         td = tr[i].getElementsByTagName("td")[0];
         if (td) {
           txtValue = td.textContent || td.innerText;
           if (txtValue.toUpperCase().indexOf(filter) > -1) {
             tr[i].style.display = "";
           } else {
             tr[i].style.display = "none";
           }
         }
      
         
        // for (i = 0; i< th.length; i++) {} )
     }
 }
  





</script>
  
  
  <script>
		document.querySelector("#btn0").addEventListener("click", function() {
			window.location.href = "/memberAdminListController.do";
		});
		document.querySelector("#btn1").addEventListener("click", function() {
			window.location.href = "/GameListAdmin.do";
		});
		document.querySelector("#btn2").addEventListener("click", function() {
			window.location.href = "/InsertGame.do";
		});
		document.querySelector("#btn3").addEventListener("click", function() {
			window.location.href = "/DiscountAdmin.do";
		});
		document.querySelector("#btn4").addEventListener("click", function() {
			window.location.href ="/AdminReview.do";
		});
		document.querySelector("#btn5").addEventListener("click", function() {
			window.location.href = "/ListCode.do";
		});
		
		document.querySelector("#cancel").addEventListener("click",function(){
			document.querySelector("#start").value = "";
			document.querySelector("#end").value = "";
		});
	</script>

</body>
</html>

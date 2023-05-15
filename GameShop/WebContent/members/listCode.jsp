<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="members.member.vo.GameCodeVO"%>
<%@page import="java.util.List"%>
	
<%
	List<GameCodeVO> codeList = (List<GameCodeVO>)request.getAttribute("codeList");
	List<GameCodeVO> gameNameList = (List<GameCodeVO>)request.getAttribute("gameNameList");
	List<GameCodeVO> codeOrderStatus = (List<GameCodeVO>)request.getAttribute("codeOrderStatus");
	
	String msg = session.getAttribute("getMsg") == null ? "" : (String)session.getAttribute("getMsg");
	session.removeAttribute("getMsg");
	
	
	String InsertMsg = session.getAttribute("msg") == null ? "" : (String)session.getAttribute("msg");
	session.removeAttribute("msg");
	
	System.out.println("등록 메세지 확인>> " + InsertMsg);
%>	

	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>게임코드발급</title>
    <!--font-awesome 4.70-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <!-- 제이쿼리 -->
<!--     <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script> -->
<!-- 	<script src="../js/jquery-3.6.0.min.js"></script> -->
	<script src="../js/jquery-3.6.2.min.js"></script>
    <!-- 부트스트랩 -->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.1/css/bootstrap-select.css" />
	<!-- CSS 파일 -->
	<link rel="stylesheet" href="../css/adminGameCode.css">
	<link rel="stylesheet" href="../css/gameListAdmin.css">
</head>


<body id="gameCode-body">

<header id="header-container-fluid">
	<jsp:include page="/main/header.jsp" />
</header>
	
<div class="container-fluid">
<div class="row">	
   <div class="column side">
	<div class="col-lg-3 col-md-3 col-sm-3 sidebar-section hidden-xs" >
		<br> <br> <br> <br> <br> <br>
		<div class="container sidebar-container" style="margin-left: 15px">
			<div class="navigation-section" style="width:230px; padding-left: 30px; ">
				<!-- 회원 정보 변경 버튼 -->
				<button class="setting col-sm-12 col-md-12 password" id="btn0" style="width:198px; height: 53.5px; font-size:11.76px;">
					회원 관리<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password" id="btn1" style="width:198px; height: 53.5px; font-size:11.76px;">
					게임 관리<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn2" style="width:198px; height: 53.5px; font-size:11.76px;">
					게임 추가<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn3" style="width:198px; height: 53.5px; font-size:11.76px;">
					무료 게임 설정<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 password " id="btn4" style="width:198px; height: 53.5px; font-size:11.76px;">
					리뷰 관리<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
				<button class="setting col-sm-12 col-md-12 personal-info active " id="btn5" style="width:198px; height: 53.5px; font-size:11.76px;">
					코드 발급<i class="glyphicon glyphicon glyphicon-menu-right pull-right visible-xs custom-chevron"></i>
				</button>
			</div>
		</div>
	</div>
  </div>
	


 <div class="column middle">
   <div class="gamecodemiddle col-md-9 col-lg-9 col-sm-9 main-section">	
	<div class="purchase-container-out">
	    <div class="purchase-container-in">
	        <div class="title-container"> 
	            <p class="title" id="gamecode-title">게임코드발급</p>
	        </div>

	        <div class="result-container">
	            <div class="table-container">
	             <form action='ListCode.do' method='post' id='insert-form'>
	             							
				  <div id="searchbox-div"><input id="gameCode-searchBox" type="text" placeholder="검색" onkeyup="searchGo()"></div>		
	              <br/>
	              <table id="codeTable">  
	                <thead id="gamelist-thead">
	                    <tr>
	                        <th class="table-header-date" style="cursor: pointer;" onclick="sortTable(0)">게임명</th>
	                        <th class="table-header" id="header-th1" style="cursor: pointer;"  onclick="sortTable(1)">게임코드</th>
	                        <th class="table-duplicationChk" style="width : 100px;"onclick="sortTable(2)"></th>
	                        <th class="table-header" id="table-header-used" style="cursor: pointer;" onclick="sortTable(3)">사용여부</th>
	                        <th class="table-header-bill">삭제</th>
							<th class="bill-icon-plus"> 
								<i class="fa fa-plus-circle fa-lg" aria-hidden="true" id="icon-modal" style= " cursor: pointer"  onclick="addRow()" ></i>
							</th>
<!-- 							<th class="bill-icon-minus"> -->
<!-- 								<i class="fa fa-minus-circle fa-lg" aria-hidden="true" id="icon-modal2" style= " cursor: pointer"  onClick="delCheck()" ></i> -->
<!-- 							</th> -->
							<th class="bill-icon-check">
<!-- 									onclick="document.getElementById('insert-form').submit();" 버튼타입이 아니라 submit 에이젝스 작동x-->
								<i class="fa fa-check-circle fa-lg" aria-hidden="true" id="button-insertRow" style="cursor : pointer" 
									></i>
<!-- 								<i class="fa fa-check-circle fa-lg" aria-hidden="true" id="button-insertRow" style="cursor : pointer" onclick="insertRow()"></i> -->
							</th>

						</tr>
	                </thead>
	                <tbody> 
	                
	                
	             <%   
	                int codeSize = codeList.size();
	             	if(codeSize > 0) {
	             		for(int i=0; i < codeSize; i++) {
	             			
	             %>
	               
	                	<tr>
	                        <td class="table-data"> 
							<%=codeList.get(i).getGameName()%>
							<span id="hide-gameId"> <%=codeList.get(i).getGameId()%> </span>
							
							</td>
	                        <td class="table-data" id="data-td2"> <span style="color: rgb(254, 224, 57);"><%=codeList.get(i).getGameCode()%></span></td>
	
	                        <td class="table-duplication-chk"></td> <!-- 게임코드중복빈칸셀td -->
	                        
	                        <td class="table-data-code">
							<%=codeList.get(i).getCodeUse()%>
							</td>
								<td class="bill-icon-minus"> <i class="fa fa-minus-circle fa-lg" aria-hidden="true" style= "cursor: pointer" onclick="location.href='./ListCode.do?gameCode=<%=codeList.get(i).getGameCode()%>'"></i></td>
<!-- 							체크박스 <td class="box-check"><input type='checkbox' class='chkbox'> -->
	                        
	                    </tr>
	             <%    
    	        	     	} // for end
           			}else { // if end    
	             %>       
	            		<tr>
	            			<td colspan="4">게임코드가 존재하지 않습니다.</td>
	                    </tr>
	             <%
           			} // else end
	             %>       
	             
	            
	                </tbody>
	              </table>
	             </form>
	            </div>
	        </div>
	    </div>
	  </div>
	</div>
  </div> <!-- coloum-middle 끝 -->
       <div class="column side"></div>
  </div>
 </div>
 </body>

<!--모달 내용-->
<!-- <div class="modal-bg" onClick="javascript:modalClose();" > -->

<!--     <div class="modal-wrap-container"  onClick="javascript:modalClose();" > -->
<!--         asdasdasd모달모달입니다 ㅁㄴㅇ -->
<!--     </div> -->


<!-- </div> -->

<script>

<%if(msg.equals("성공")) { %>
	alert('삭제되었습니다.');
<% } %>


<%if(InsertMsg.equals("성공")) { %>
alert('등록되었습니다.');
<% } %>

function searchGo() {
    var input, filter, table, tr, td, i, txtValue;
    input = document.getElementById("gameCode-searchBox");
    filter = input.value.toUpperCase();
    table = document.getElementById("codeTable");
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
    
  }
}



// 아래 행 추가
 function addRow() {

	const readyTable = document.getElementById('codeTable');
	var newRow = readyTable.insertRow();

	
	// 게임명
	var gameName = newRow.insertCell();
	gameName.innerHTML = "<select class='select-gametitle' name='gameName'><%int codeSize2 = gameNameList.size();if(codeSize2 > 0) {for(int j=0; j < codeSize2; j++) {%><option> <%=gameNameList.get(j).getGameName()%> </option><%}}%>";
	
	// 게임코드
	var gameCode = newRow.insertCell();
	gameCode.innerHTML = "<input type='text' id='row_gameCode' name='gameCode' size='10'/>";
	
	// 코드중복
	var gameCodeChk = newRow.insertCell();
	gameCodeChk.setAttribute("id","row_gameCodeChk");
// 	gameCodeChk.innerHTML = "<input type='text' id='row_gameCodeChk' value=''/>";
	
	// 사용여부
	var status = newRow.insertCell();
	status.innerHTML = "<input type='text' id='row_gameStatus' name='codeUse' size='10' value='x' readonly/>";

// 	// 체크박스
// 	var buttons = newRow.insertCell();
// 	buttons.innerHTML = "<input type='checkbox' id='chkbox' name='chkbox'>";
		
	// 추가 + 삭제버튼
	var buttons = newRow.insertCell();
	buttons.setAttribute("class", "insertCellMinus");
	buttons.innerHTML = "<i class='fa fa-minus-circle fa-lg' aria-hidden='true' style= 'cursor: pointer;' onclick='deleteRow(-1)'></i>";
// 	buttons.innerHTML = "<i class='fa fa-check-circle fa-lg' aria-hidden='true' id='button-insertRow' style='cursor : pointer' onclick='insertRow()'></i> <i class='fa fa-minus-circle fa-lg' aria-hidden='true' id='icon-modal3' style= 'cursor: pointer' onclick='deleteRow(-1)'></i>";
// 	buttons.innerHTML = "<i class='fa fa-check-circle fa-lg' id='row_gameButtons' aria-hidden='true' style='cursor : pointer'></i> <i class='fa fa-minus-circle fa-lg' aria-hidden='true' id='icon-modal' style= 'cursor: pointer' onclick='deleteRow(-1)'></i> </form>";
	// buttons.innerHTML = "<input type='text' id='row_gameButtons' size='10' value=''/>";
	
		
} // addRow()


// 마지막 행 삭제
function deleteRow(rownum) {
	const readyTable = document.getElementById('codeTable');
	var cancelRow = readyTable.deleteRow(rownum);
}


// 체크박스 행 삭제
function delCheck() {
    var table = document.getElementById('codeTable'); 
    for(var i=1; i <table.rows.length; i++) {
      var chkbox = table.rows[i].cells[3].childNodes[0].checked;
  
      if(chkbox) { 
        table.deleteRow(i);
        i--;

      }
    }
  }


  // 게임코드 중복체크
		// 동적요소여서 binding방식으로는 작동하지 않음. 다른 방식으로 해야함. 그리고 (document)로 확인한번 더해주기
		$(document).on('keyup','#row_gameCode', function () {
				
				//게임코드값 가져오기
				let v_codeVal = $('#row_gameCode').val(); // 게임코드란에 입력되는 값
				console.log('jquery작동중!', $('#row_gameCode').val());

				//공백제거
				if (v_codeVal.trim().length == 0)
					return;

				$.ajax({
					type: 'post',
					url: '/members/codeCheck.jsp',
					data: {
						gameCode : v_codeVal
					},
					success: function (aaa) {
						if (aaa.rst == "ok") {
							$('#row_gameCodeChk').html(aaa.msg).css('color', 'green'); // 값 넣을 컬럼 
						} else {
							$('#row_gameCodeChk').html(aaa.msg).css('color', 'red');
						}
					},
					error: function (xhr) {
						alert("상태:" + xhr.status);
					},
					dataType: 'json'
				})
				
				console.log('jquery끝나감!')
				
			});

// 			$('#insert-form').on('submit', function () {
			// 버튼.submit에만 적용되고 i.submit은 적용안됨! 그래서 on click으로 바꾸고 if절로 구분했다. 
			$('#button-insertRow').on('click', function () {
				
// 				console.log("인서트 서브밋.>>>>>", $('#row_gameCodeChk').text());
				
				if ($('#row_gameCodeChk').text() == '사용불가') {
					alert("이미 존재하는 게임코드입니다. 변경해주세요.");
					return false;
				} 
// 				return true;
				$('#insert-form').submit();
			});
			

			
			
// sort 정렬부분
      function sortTable(n) {
	        var table, rows, switching, i, x, y, shouldSwitch, dir, switchCount = 0;
	        table = document.getElementById("codeTable");
	        switching = true;
	        dir = "asc";
	
	        while (switching) {
	          switching = false;
	          rows = table.getElementsByTagName("TR");
	
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


	
          
      
      

		document.querySelector("#btn0").addEventListener("click", function() {
			window.location.href = "/memberAdminList.do";
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
			window.location.href = "/AdminReview.do";
		});
		document.querySelector("#btn5").addEventListener("click", function() {
			window.location.href = "/ListCode.do";
		});
		
</script>

</body>

</html>	
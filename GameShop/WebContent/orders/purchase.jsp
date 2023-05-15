<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="orders.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	List<OrderVO> orderList = (List<OrderVO>) request.getAttribute("orderList");
	
// 	int orderListSize = orderList.size();
	int orderSize = orderList.size();
	
%>	
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매</title>
    <!--font-awesome 4.70-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" integrity="sha512-5A8nwdMOWrSz20fDsjczgUidUBR8liPYU+WymTZP1lmY9G6Oc7HlZv156XqnsgNUzTyMefFTcsFH/tnJE/+xBg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
    
	<!--  스타일 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
    <link rel="stylesheet" href="../css/mypageHeader.css">
    <link rel="stylesheet" href="../css/purchase.css">
	<!-- 날짜라이브러리 -->
<!-- 	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js" integrity="sha512-3kMAxw/DoCOkS6yQGfQsRY1FWknTEzdiz8DOwWoqf+eGRN45AmjS2Lggql50nCe9Q6m5su5dDZylflBY2YjABQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
</head>



<body id="purchase-body">

		<header id="header-container-fluid">
				<jsp:include page="../main/header.jsp" />
		</header>
		
		<div id="container">
		<div class="tabs">
		  <div class="tab-2">
		    <label for="tab2-1"><a id="mypageId" href="/members/updateMember.jsp">회원정보</a></label>
		    <input id="tab2-1" name="tabs-two" type="radio" >
		  </div>
		  <div class="tab-2">
		    <label for="tab2-2"><a id="mypageId" href="/order/purchaseRecord.do">구매내역</a></label>
		    <input id="tab2-2" name="tabs-two" type="radio" checked="checked">
		  </div>
		  <div class="tab-2">
		    <label for="tab2-3"><a id="mypageId" href="/members/MyReview.do">리뷰내역</a></label>
		    <input id="tab2-3" name="tabs-two" type="radio">
		  </div>
		</div>
		</div>


<div class="container-fluid">
  <div class="row">
  	<!-- side1 -->
    <div class="col-sm-1">
	</div>
	
	<!-- middle -->
<div id="purchase-middle"  style="margin-left:13%; margin-top:1%;">
	<div class="col-sm-10"> 
	<div class="purchase-container-out">
	    <div class="purchase-container-in">
	        <div class="title-container"> 
	            <p class="title" id="purchase-title">구매내역</p>
	            <p class="purchase-detail">계정 결제 세부사항을 확인할 수 있습니다. <!-- <span onClick="location.href='#'" style="cursor:pointer; color: #4496e4;">빈즈게임즈 환불정책</span> --></p>
	        </div>
	        <div class="result-container">
<!-- 	            <div class="filter-container"> -->
<!-- 	                <div class="select-div"> -->
<!-- 	                <select class="purchase-select"> -->
<!-- 	                    <option id="opt1"> 최신순 </option> -->
<!-- 	                    <option id="opt2"> 오래된순 </option> -->
<!-- 	                    <option id="opt3"> 게임명순 </option> -->
<!-- 	                    <option id="opt4"> 가격순 </option> -->
	                   
<!-- 	                </select> -->
<!-- 	                </div> -->
<!-- 	            </div>  -->
	            <div class="table-container">
	              <table id="purchaseTable">  
	                <thead>
					  <%
					  	if ( orderSize > 0){
					  		
					  
					  %>
	                    <tr>
	                        <th class="table-header-date" style="cursor:pointer;"onclick="sortTable(0)">구매일</th>
	                        <th class="table-header" id="header-th1" style="cursor:pointer;" onclick="sortTable(1)">게임명</th>
	                        <th class="table-header" style="cursor:pointer;" onclick="sortTable(2)">가격</th>
	                        <th class="table-header-status">상태</th>
	                        <th class="table-header-bill">영수증</th>
	                    </tr>
	                </thead>
	                <tbody>
	                
    	                <%

							if (orderSize > 0) {
								for(int i = 0; i < orderSize; i++) {
									
									System.out.println("");
						%>
	                
	                	<tr>
	                        <td class="table-data"> 
							<fmt:parseDate value="<%= orderList.get(i).getOrderDate() %>" var="dateValue" pattern="yyyy-MM-dd HH:mm:ss"/>
							<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
	                        </td>
	                        <td class="table-data"> <span onClick="location.href='/detailGame.do?id=<%= orderList.get(i).getGameId()%>'" style="cursor:pointer; color: #4496e4;"><%= orderList.get(i).getGameName()%></span></td>
	                        <td class="table-data">₩ <%= orderList.get(i).getGamePrice() %></td>
	                        <td class="table-data" id="data-status">구매함</td>
	                        <td class="bill-icon" onclick="window.open('/order/bill.do?orderId=<%= orderList.get(i).getOrderId()%>', 'Bill',
<%-- 	                        	'width=620,height=520, location=no, status=no, toolbar=no, menubar=no, scrollbars=no, dirctories=no')"> <i class="icon fa fa-file-text-o fa-lg" style= " cursor: pointer;"></i></td> --%>
	                        	'width=620, height=520, scrollbars=false, location=no')"> <i class="icon fa fa-file-text-o fa-lg" style= " cursor: pointer;"></i></td>
<!-- 	                        <td class="bill-icon" onclick="modalOpen()"> <i class="icon fa fa-file-text-o fa-lg" style= " cursor: pointer;"></i></td> -->
	                        <td id="td-forOrderId<%=i%>" style="display:none;"><%= orderList.get(i).getOrderId()%></td>
	                    </tr>
	                   
	                   <%
							} // for문
								
						  } 
							
					  	} else {	
								
	                   %>
	                   		<tr>
<!-- 	                   			<td colspan="4" id="purchase-not-exist"> 구매내역이 존재하지 않습니다. </td> -->
	                   			<td colspan="4" class="no-purchase-x"> 
<!-- 	                   			구매내역이 존재하지 않습니다. -->
	                   			<br/><br/>
								<span "class="css-cvmfyy" aria-hidden="true" data-testid="icon" data-component="Icon">
									<svg xmlns="http://www.w3.org/2000/svg" class="svg css-w1atjl" viewBox="0 0 45 52" style="width:80px; margin-left:40%;">
									<g fill="none" fill-rule="evenodd">
									<path d="M4.058 0C1.094 0 0 1.098 0 4.075v35.922c0 .338.013.65.043.94.068.65-.043 1.934 2.285 2.96 1.553.683 7.62 3.208 18.203 7.573 1.024.428 1.313.529 2.081.529.685.013 1.137-.099 2.072-.53 10.59-4.227 16.66-6.752 18.213-7.573 2.327-1.23 2.097-3.561 2.097-3.899V4.075C44.994 1.098 44.13 0 41.166 0H4.058z" fill="#0078F2"></path>
									<path stroke="#FFF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" d="M14 18l4.91 2.545-2.455 4M25.544 28.705c-1.056-.131-1.806-.14-2.25-.025-.444.115-1.209.514-2.294 1.197M29.09 21.727L25 19.5l2.045-3.5"></path></g></svg><br/><br/><span style="font-size:30px">구매내역이 존재하지 않습니다. </span><br/></span>
									<span class="css-z3vg5b"> <a class="css-8dq9ld" role="link" href="/Game.do"><span>게임 및 앱 구매하기</span></a></span>
	                   			
	                   			<br/><br/><br/>
	                   			 </td>
	                   			
											
										
										
	                   		</tr>
	                   <%
						  	} // if문
	                 	%>
	                    
	                </tbody>
	              </table>
	            </div>
	        </div>
	    </div>
	</div>
	</div> <!-- middle row -->
  </div>
   <!-- side2 -->
  <div class="col-sm-1"></div>
    </div> <!--row -->
 </div> <!-- container -->
 
 
<!--모달 내용-->
<!-- <div class="modal-bg" onClick="javascript:modalClose();" > -->

<!--     <div class="modal-wrap-container"  onClick="javascript:modalClose();" > -->
       
<%--         <jsp:include page="bill.jsp"/> --%>
   
<!--     </div> -->




<!-- </div> -->



<script>

// 팝업열기
function popup(){
    var url = "/order/bill.do";
    var name = "popup test";
    var option = "width = 500, height = 500, top = 100, left = 200, location = no"
    window.open(url, name, option);
}

//모달 시작
function modalOpen() {
	
    var modalPop = $('.modal-wrap-container');
    var modalBg = $('.modal-bg'); 
    $(modalPop).show();
    $(modalBg).show();

}

//모달 닫기
function modalClose() {
    var modalPop = $('.modal-wrap-container');
    var modalBg = $('.modal-bg');

    $(modalPop).hide();
    $(modalBg).hide();

}


//ajax로 orderId 날리기.
// $(document).on('click','#bill-icon', function() {
// $('#test-TEST').on('click', function() {
	
// --- 살리고싶으면 여기부터 열기 -- ////	
// $('.bill-icon').on('click', function() {
// 	console.log('영수증 클릭 작동중 ');
	
// 	//orderId 가져오기
// 	//$(this).next().attr('id')
// 	let v_getIdforTd = $(this).next().attr('id');
// 	var v_orderId = document.getElementById(v_getIdforTd).innerText;
// 	console.log('order아이디 확인>> ', v_orderId);
	


// 	$.ajax({
// 		type: 'get',
// 		url: '/order/bill.do', // 주소확인
// 		data: {
// 			orderId : v_orderId
// 		},
// 		async : false, // 동기화 시키고 나서 + 모달작동
// 		success: function () {
// 				console.log('값보내기 성공ㅠㅠ');
// // 				modalOpen();
// 				popup();
				

// 		},
// 		error: function () {
// 			console.log('값보내기 실패..');
// 			alert('orderId가 안보내졌습니다..')
// 		},
// 		dataType: 'text'
// 	})
	
// });





// option 창 클릭으로 옮기기
	
	// onclick시 작동하기.
// 	function activeSort() {
// 	   var start = 0;
// 	   start = true;
	   
// 	   }
	   

// 	$("opt1").click(function() {
// 		sortTable(0);
// 	});
	   
	   
// 	   switch(start) {
// 	   		case 1: sortTable(0)
// 	   			break;
// 	   		case 2: sortTable(0)
// 	   			break;
// 	   		case 3: sortTable(1)
// 	   			break;
// 	   		case 4: sortTable(2)
// 	   			break;
// 	   	}
	   



//sort 정렬부분
   function sortTable(n) {
	        var table, rows, switching, i, x, y, shouldSwitch, dir, switchCount = 0;
	        table = document.getElementById("purchaseTable");
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
  	 

</script>

</body>


	
</html>
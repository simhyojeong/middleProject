<%@page import="orders.vo.OrderVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix ="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
	List<OrderVO> order = (List<OrderVO>)request.getAttribute("orderList");
// 		int size = orderList.size();
// 		System.out.println("jsp에 들어온 orderList사이즈>>" + size);
		
		
%>	
	
	<!DOCTYPE html>
<html lang="ko">


<head>

    <meta charset="utf-8">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://fonts.googleapis.com/css?family=Hind&display=swap" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js" charset="utf-8"></script>
	<title>영수증</title>
</head>

<body id="bill-body">
<!-- <div class="modal-bg" onClick="javascript:modalClose();" > -->
<!--  <div class="modal-wrap-container"  onClick="javascript:modalClose();" > -->
  <div class="bill-wrapper">
    <div class="container">

        <form action="" class="form">
            <div class="bill-head">
                <h2>영수증</h2>
                <p>Beans Games International에서 구매해 주셔서 감사합니다.</p>
            </div>
            <div class = "order-information">
                            <hr style="border: dashed 0.5px grey">
                <table class="table">
                    <thead>
                        <tr> 
                            <td class="order-detail-head" colspan="3">주문 정보</td>
                        </tr> 
                    </thead>
                    <tbody>
                    
    	                <%
							int orderSize = order.size();
							if (orderSize > 0) {
								for(int i = 0; i < orderSize; i++) {
									System.out.println(order.get(i).getGameName());
						%>                    
                    
                        <tr>
                            <td id="cell-name">청구 대상 : <%= order.get(i).getMemId() %></td>
                        	
                        	<td id="cell-date">주문 일시 : <%= order.get(i).getOrderDate() %>
                            </td>
                            <td id="cell-blank"></td>
                        </tr>
                    </tbody>
                </table>
                
                <table class="table" id="table-bottom">
                    <tbody>
                        <tr> 
                            <td class="order-detail-head" colspan="3">주문 내역</td>
                        </tr> 
                        <tr class="tr-data">
                            <th class="cell-data">게임명</th>
                            <th class="cell-data">    </th>
                            <th id="cell-price">가격</th>
                        </tr>
                        <tr>
                            <td><%= order.get(i).getGameName()%></td>
                            <td>     </td>
                            <td class="cell-total">KRW ₩  <%= order.get(i).getGamePrice() %></td>
                        </tr>
                        <tr> 
                            <td></td>
                            <td class="cell-total" colspan="2">합계[KRW]: ₩ <%= order.get(i).getGamePrice() %></td>
                        </tr>
                        
          			     <%
							} // for문
								
						  } // if문         
                        %>
                         
                    </tbody>
                </table>

            </div>
        </form>

        <hr style="border: dashed 0.5px grey">
        <div class="footer">
            <p id="first-p">Beans Games International</p>
            <p id="second-p" style="margin-top : 0%;">83, Yuseong-daero 1312beon-gil, Yuseong-gu, Daejeon, Republic of Korea</p>
        </div>
    </div>
  </div>
<!--   </div> -->
<!--  </div> -->
 
<script>




// function modalClose() {
//     var modalPop = $('.modal-wrap-container');
//     var modalBg = $('.modal-bg');

//     $(modalPop).hide();
//     $(modalBg).hide();

// }







</script>


</body>
	<link rel="stylesheet" href="../css/bill.css">
</html>


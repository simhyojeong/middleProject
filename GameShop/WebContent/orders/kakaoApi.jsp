<%@page import="orders.service.OrderServiceImpl"%>
<%@page import="orders.service.IOrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%
    String name =  (String)request.getAttribute("name");
    String email = (String)request.getAttribute("email");
    String phone = (String)request.getAttribute("phone");
    int totalPrice = (int)request.getAttribute("totalPrice");   
    String[] cartIdParas = (String[])request.getAttribute("cartIdParas");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카카오페이</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<header id="header-container-fluid">
		<jsp:include page="/main/header.jsp"/>
		<jsp:include page="/main/headerNav.jsp"/>
	</header>
 <script>
    $(function(){
    	// !!결제 준비하기!!
        var IMP = window.IMP; // 생략가능
        IMP.init("imp33174067"); // "가맹점 식별코드"를 사용
        var msg;
        
        // !!결제 요청하기!!
       	//IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ 
        	// param
            pg : 'kakaopay',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : 'Beans Game Store 게임 결제',
            amount : '<%=totalPrice%>',
            buyer_email : '<%=email%>',
            buyer_name : '<%=name%>',
            buyer_tel : '<%=phone%>',
        }, function(rsp) { //콜백함수, rsp에는 결제결과 객체가 포함되어있다 (success(결제 성공 여부), paid_amount(결제된 금액), imp_uid(아임포트 거래 고유 번호) 등을 담고 있는 객체)
            if ( rsp.success ) {
                //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
               		jQuery.ajax({
                    url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                    type: 'POST',
                    dataType: 'json',
                    data: {
                        imp_uid : rsp.imp_uid
                        
                    }
                }).done(function(data) {
                    //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
                    if ( everythings_fine ) {

                     } else {
                    	//결제중단시
                        //[3] 아직 제대로 결제가 되지 않았습니다.
                        //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                    	msg = '결제중단';
                    }
                }); 
                //성공시 이동할 페이지
                
                        msg = '결제가 완료되었습니다.';
                        msg += '\n고유ID : ' + rsp.imp_uid;
                        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
                        msg += '\n결제 금액 : ' + rsp.paid_amount;
                        msg += '\n카드 승인번호 : ' + rsp.apply_num;
                                        
                        alert(msg);

                 <%-- location.href='<%=request.getContextPath()%>/order/paySuccess?msg='+msg; --%>

             	<% 
            	
            	int size = cartIdParas.length;
             	String cartIdParaLink ="";
            	if(size>0){
            		for(int i=0; i<size; i++){
            			cartIdParaLink += "&cartIdPara"+"="+cartIdParas[i];
            		}
            	}
         		System.out.println("APi단에서 파라미터 잘 들어왔나 ? : "+cartIdParaLink);
            	
            	%>

                 location.href='/order/SuccessOrderController.do?<%=cartIdParaLink%>';

            } else {
            	
                msg = '결제에 실패하였습니다.';
                msg += '\n에러내용 : ' + rsp.error_msg;
                //실패시 이동할 페이지
                <%-- location.href="<%=request.getContextPath()%>/order/payFail"; --%>
                alert(msg);
            }
        });
        
    });
    </script>
</body>
</html>
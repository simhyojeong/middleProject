<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 수정 요청
//서블릿에서 저장 한 데이터 꺼내기 

  int   res = (Integer)request.getAttribute("result");
  
  if(res == 1){
%>
  {
     "result"   : "회원탈퇴 성공"
  }
     

   
<% } else { %>
   {
    "result"    : "회원탈퇴 실패"
   }
   
<% } %>
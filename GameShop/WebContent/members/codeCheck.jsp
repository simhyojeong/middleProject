<%@page import="members.member.service.GameCodeServiceImpl"%>
<%@page import="members.member.service.IGameCodeService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	String gameCode = request.getParameter("gameCode");
	
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team4_202210M", "java");
	
	IGameCodeService codeService = GameCodeServiceImpl.getInstance();
	Boolean codeCheck = codeService.checkCode(gameCode);
	System.out.print("코드체크 확인용 >> "+ codeCheck);
	
	//true = 있음, false = 없음 
	 if (codeCheck == false) {
%>
		{"rst":"ok", "msg":"사용가능"}	
<%
	 } else {
%>	
		{"rst":"fail", "msg":"사용불가"}	
<%
	 }
%>		
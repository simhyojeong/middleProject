<%@page import="members.member.service.MemberServiceImpl"%>
<%@page import="members.member.service.IMemberService"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Driver"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String mem_id = request.getParameter("mem_id");

	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url = "jdbc:oracle:thin:@112.220.114.130:1521:xe";
	Connection conn = DriverManager.getConnection(url, "team4_202210M", "java");

	IMemberService memService = MemberServiceImpl.getInstance();
	String check = memService.checkMemId(mem_id);

	if (check == null || check.equals("")) {
%>
		{ "rst":"ok", "msg":"사용가능" }
<%
	} else {
%>
		{ "rst":"fail", "msg":"사용불가" }
<%
	}
%>

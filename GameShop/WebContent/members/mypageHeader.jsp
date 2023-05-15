<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="../css/mypageHeader.css">
</head>
<body>
<header id="header-container-fluid">
		<jsp:include page="../main/header.jsp" />
</header>
<div id="container">
<div class="tabs">
  <div class="tab-2">
    <label for="tab2-1"><a id="mypageId" href="/members/updateMember.jsp">회원정보</a></label>
    <input id="tab2-1" name="tabs-two" type="radio" checked="checked">
  </div>
  <div class="tab-2">
    <label for="tab2-2"><a id="mypageId" href="/order/purchaseRecord.do">구매내역</a></label>
    <input id="tab2-2" name="tabs-two" type="radio">
  </div>
  <div class="tab-2">
    <label for="tab2-3"><a id="mypageId" href="/members/MyReview.do">리뷰내역</a></label>
    <input id="tab2-3" name="tabs-two" type="radio">
  </div>
</div>
</div>
</body>
</html>
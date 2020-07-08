<%@page import="common.DBClass"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <!-- BootstrapのCSS読み込み -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery読み込み -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- BootstrapのJS読み込み -->
	<script src="../js/bootstrap.min.js"></script>
 　　<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
	   <script type="text/javascript" src="../js/jquery.japan-map.min.js"></script>
 　　  <link rel="stylesheet" href="../css/slick-theme.css" type="text/css">
 　　  <link rel="stylesheet" href="../css/slick.css" type="text/css">
 　　  <script src="../js/slick.js" type="text/javascript"></script>
<title>Insert title here</title>
<%
			//ログイン情報
			String userId = (String)session.getAttribute("userId");

			//if(userId == null){
			//	userId = "1";
			//	session.setAttribute("userId",userId);
			//}
		%>
		<%
			//カート
			String cartNum = "0";
			{
			DBClass db = new DBClass();
			db.dbOpen();

			cartNum = db.getCartNum(userId);

			db.dbClose();
			}
		%>
</head>
<body>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-dark" style="margin-top:-25px;">
<a class="navbar-brand text-white" href="../TopPage">Omiyazon</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<form class="form-inline " id="frm1" name="frm1" action="../HeaderItemSearch">
			<input class="form-control" type="text" placeholder="検索" aria-label="Search" name="search" id="search">
			<button class="btn btn-success" type="submit">検索</button>
		</form>

		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link text-white" href="../TAlltokusyuu">特集一覧</a>
			</li>
		</ul>

		<%
			if(userId!=null){
		%>
			<a class="nav-link hover" href="../cart" role="button">
			<img alt="カート" src="../img/cart.png"  width=40 height=35 >
			<span class="text-warning" style="position:relative; left:-29px; top:-8px; font-size: 20px; font-weight: bold"><%=cartNum %></span>
			</a>
			<a class="btn btn-warning text-right" href="Mypage.jsp" role="button">マイページ</a>
		<%}else{%>
			<a class="btn btn-warning text-right" href="user/Login.jsp" role="button">ログイン</a>
		<%} %>
	</div>
</nav>
</body>
</html>
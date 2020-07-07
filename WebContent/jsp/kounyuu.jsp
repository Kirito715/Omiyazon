<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>住所選択</title>
		<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<form action="../kounyuu2">
<%String uid=(String)session.getAttribute("uid");
%>
<%ArrayList<String[]> user = (ArrayList<String[]>) session.getAttribute("user");%>
<%ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");%>

郵便番号
 <table class="table table-striped">
    <thead>
      <tr>
<input type="number"name="num"value="<%=user.get(0)[3]%>"><br></tr></thead></table>
住所選択
<input type="text"name="zyusyo1"value="<%=user.get(0)[1]%>">
<input type="text"name="zyusyo2"value="<%=user.get(0)[2]%>"><br>

<%for(int i=0;i<cart.size();i++){ %>
<%=cart.get(i)[1]%>
<%} %>
<input type="submit"value="購入確定">
<input type="hidden"name="uid"value="<%=uid%>">
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入確認</title>
<link rel="stylesheet" href="../css/slide.css" type="text/css">
	<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body class="text-center">
<br>
<div class="body">
<form action="../kounyuu2">
<%String uid=(String)session.getAttribute("uid");
%>
<%ArrayList<String[]> user = (ArrayList<String[]>) session.getAttribute("user");%>
<%ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");%>
<h1>注文内容確認</h1>
<table class="table table-striped text-center" align="center" style="width:600px">
<thead><tr>
<td>〒</td><td><input type="number"name="num"value="<%=user.get(0)[3]%>"></td>
<td style="width:100px">住所</td>
<td style="width:100px"><input type="text"name="zyusyo1"value="<%=user.get(0)[1]%>">
<%if(user.get(0)[2]!=null){ %>
<input type="text"name="zyusyo2"value="<%=user.get(0)[2]%>"></td>
<%} %>
</tr></thead></table>
<%int sum=0; %>
<table class="table table-striped text-center" align="center" style="width:600px"style="height:900px">
<thead>
<%for(int i=0;i<cart.size();i++){ %>
<tr>
<td><%=cart.get(i)[1]%>:<%=cart.get(i)[2]%>点</td>
</tr>
<%
int a=Integer.parseInt(cart.get(i)[5]);
int b=Integer.parseInt(cart.get(i)[2]);
sum+=a*b;
%>
<%} %>
</thead></table>
<table class="table table-striped text-center" align="center" style="width:600px">
<thead><tr>
<td style="width:600px">合計<%=sum%>円
<button class="button btn-primary">購入</button></td></tr></thead></table>
<input type="hidden"name="uid"value="<%=uid%>">
</form>
</div>
</body>
</html>
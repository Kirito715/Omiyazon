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
<form action="Complete.jsp">
<%String uid=(String)session.getAttribute("uid");
%>
<%ArrayList<String[]> user = (ArrayList<String[]>) session.getAttribute("user");%>
<%ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");%>
<table class="table table-striped text-center" align="center" style="width:800px">
<thead><tr>
<td>〒<input type="number"name="num"value="<%=user.get(0)[3]%>"></td>
<td>住所
<input type="text"name="zyusyo1"value="<%=user.get(0)[1]%>">
<input type="text"name="zyusyo2"value="<%=user.get(0)[2]%>"><br></td>
<%int sum=0; %>
<%for(int i=0;i<cart.size();i++){ %>
<td><%=cart.get(i)[1]%></td>
<%
int a=Integer.parseInt(cart.get(i)[5]);
int b=Integer.parseInt(cart.get(i)[2]);
sum+=a*b;
%>
<%} %>
<td>合計金額<%=sum%></td>
</tr></thead></table>
<button class="button btn-primary">購入</button>
<input type="hidden"name="uid"value="<%=uid%>">
</form>
</div>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入確認</title>
	<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body class="text-center">
<form action="Complete.jsp">
<%String uid=(String)session.getAttribute("uid");
%>
<%ArrayList<String[]> user = (ArrayList<String[]>) session.getAttribute("user");%>
<%ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");%>
郵便番号
<input type="number"name="num"value="<%=user.get(0)[3]%>">
住所選択
<input type="text"name="zyusyo1"value="<%=user.get(0)[1]%>">
<input type="text"name="zyusyo2"value="<%=user.get(0)[2]%>"><br>
<%int sum=0; %>
<%for(int i=0;i<cart.size();i++){ %>
<%=cart.get(i)[1]%>
<%
int a=Integer.parseInt(cart.get(i)[5]);
int b=Integer.parseInt(cart.get(i)[2]);
sum+=a*b;
%>
<%} %>
合計金額<%=sum%>
<input type="submit"value="購入確定">
<input type="hidden"name="uid"value="<%=uid%>">
</form>
</body>
</html>
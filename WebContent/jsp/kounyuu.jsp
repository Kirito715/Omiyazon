<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../kounyuu2">
<%String uid=(String)session.getAttribute("uid");
%>
<%ArrayList<String[]> user = (ArrayList<String[]>) session.getAttribute("user");%>
<%ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");%>
郵便番号
<input type="number"name="num"value="<%=user.get(0)[3]%>">
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
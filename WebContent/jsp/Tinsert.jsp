<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%Date a = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String date = dateFormat.format(a); %>
<form action="../Tinsert">
タイトル<br>
<input type="text"name="title"><br>
<input type="text"name="honbun"><br>
公開開始
<input type="date"name="fdate"value="<%=date%>">
公開終了
<input type="date"name="edate"><br>
画像パス
<input type="text"name="pasu"><br>
関連商品
<%for(int i=0;i<3;i++){ %>
<%=i%>
<%} %><br>
<input type="submit"value="作成する">
</form>
</body>
</html>
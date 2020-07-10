<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>特集作成</title>
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Sample</title>
    <!-- BootstrapのCSS読み込み -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery読み込み -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- BootstrapのJS読み込み -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body >
<%@include file="managerHeader.jsp" %>
<%Date a = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String date = dateFormat.format(a); %>
<form action="../Tinsert2">
<%String[] sid = (String[]) session.getAttribute("sid");%>
<%ArrayList<String[]> kanren = (ArrayList<String[]>) session.getAttribute("kanren");%>
<div>タイトル</div><br>

<input type="text"name="title"><br>
<textarea name="honbun"style="width:15em;height:8em"></textarea><br>
<h>公開開始</h>
<input type="date"name="fdate"value="<%=date%>">
公開終了
<input type="date"name="edate"><br>
画像パス
<input type="text"name="pasu"><br>

<%if(sid!=null){%>
関連商品
	<%for(int i=0;i<sid.length;i++){ %>
		<%=sid[i] %><%=kanren.get(i)[2]%><br>
	<%} %><br>
	<%}%>
<input type="submit"value="作成する">
<input type="hidden"value="">
</form>
</body>
</html>
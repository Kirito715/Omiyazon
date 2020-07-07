<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Tsyousai.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="../Tupdate">
<%String tid=(String)session.getAttribute("tid");%>
<%ArrayList<String[]> Thensyuu = (ArrayList<String[]>) session.getAttribute("Tsyousai");%>
追記する
<input type="text"name="txt"><br>
<%if(Thensyuu.get(0)[3].equals("0")){%>
<button class="button img-a"value="1"name="button">非公開にする</button>
<%}
else if(Thensyuu.get(0)[3].equals("1")){%>
<button class="button img-a"value="2"name="button">公開にする</button>
<%} %>
<button class="button img-a"value="3"name="button">追記する</button><br>

<input type="hidden"name="tid"value="<%=tid%>">
<input type="hidden"name="txt2"value="<%=Thensyuu.get(0)[2]%>">
</form>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="Tsyousai.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/slide.css" type="text/css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap Sample</title>
	    <!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="managerHeader.jsp" %>
<div class="row">
<form action="../Tupdate">
<%String tid=(String)session.getAttribute("tid");%>
<%ArrayList<String[]> Thensyuu = (ArrayList<String[]>) session.getAttribute("Tsyousai");%>
追記する<br>
<textarea name="txt"style="width:15em;height:8em"></textarea>
<br>
<div class="col-sm-8"><%if(Thensyuu.get(0)[3].equals("0")){%></div>
<button class="btn btn-primary"value="1"name="button">非公開にする</button>
<%}
else if(Thensyuu.get(0)[3].equals("1")){%>
<button class="btn btn-primary"value="2"name="button">公開にする</button>
<%} %>
<button class="btn btn-primary"value="3"name="button">追記する</button><br>

<input type="hidden"name="tid"value="<%=tid%>">
<input type="hidden"name="txt2"value="<%=Thensyuu.get(0)[2]%>">
</form>
</div>
</body>
</html>
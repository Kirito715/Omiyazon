<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お気に入り一覧</title>
<link rel="stylesheet" href="../css/slide.css" type="text/css">
<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
function actionA(){
	 document.getElementById('form').action="../ItemDetail";
}
</script>
</head>
<body class="text-center">
<%@include file="header.jsp" %>
<div class="body">
<br>
<br>
<form id='form' name='form'>
<%ArrayList<String[]> book = (ArrayList<String[]>) session.getAttribute("mybook");%>
<%for(int i=0;i<book.size();i++){%>
<table class="table table-striped" align="center">
<tr>
<td><%=book.get(i)[1]%></td>
<td><button class="button  btn-primary"value="5"name="button"onclick=" actionA();">詳細</button><br></td>
<input type="hidden"name="itemid"value="<%=book.get(i)[0]%>">
</tr>
<br>
<%}%>
</table>
</form>
</div>
</body>
</html>
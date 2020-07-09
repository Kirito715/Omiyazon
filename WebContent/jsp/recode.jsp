<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript">

function actionA(){
	 document.getElementById('form').action="../recode2";
}
function actionB(){
	 document.getElementById('form').action="../ItemDetail";
}

</script>
<title>購入履歴</title>
<link rel="stylesheet" href="../css/slide.css" type="text/css">
 <!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<%@include file="header.jsp" %>
<div class="body">
<body class="text-center">
<div class="container-fluid">
<form id='form' name='form'>
  <table class="table table-striped">
<thead><tr>購入履歴</tr></thead>
<tr><td>購入日付</td><td>商品名</td><td>発送の中止</td><td>カート</td></tr>
<%String uid=(String)session.getAttribute("uid");%>
<input type="hidden"name="uid"value="<%=uid%>">
<%ArrayList<String[]> recode = (ArrayList<String[]>) session.getAttribute("myrecode");%>
<%for(int i=0;i<recode.size();i++){%>
<tbody><tr><td><%=recode.get(i)[3]%></td>
<td><%=recode.get(i)[1]%>
<input type="hidden"name="sid"value="<%=recode.get(i)[0]%>">
<input type="hidden"name="did"value="<%=recode.get(i)[6]%>">
</td>
<%if(recode.get(i)[4].equals("0")){%>
<td><button class="button img-a"value="1"name="button"onclick=" actionA();">発送の中止</button></td>
<%}
else%><td>発送済みです</td><%; %>

<td><button class="button img-a"value="<%=recode.get(i)[0]%>"name="itemid"onclick=" actionB();">詳細へ</button></td>
</tr></tbody>
<%}%>
</table>
</form>
</div>
</div>
</body>
</html>
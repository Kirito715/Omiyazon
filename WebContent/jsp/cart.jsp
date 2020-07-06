<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function actionA(){
	 document.getElementById('form').action="../kounyu";
}
</script>
		<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<form id='form' name='form'>
<%String uid=(String)session.getAttribute("uid");
%>
<input type="hidden"value="<%=uid%>"name="uid">
<%ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");%>
<%for(int i=0;i<cart.size();i++){ %>

<%=cart.get(i)[1]%>
<input type="number"name="num"value="<%=cart.get(i)[2]%>">個
<input type="hidden"value="<%=cart.get(i)[0]%>"name="sid">
<button class="button img-a"value="3"name="button"onclick=" actionA();">数量更新</button>
<button class="button img-a"value="1"name="button"onclick=" actionA();">削除</button>
<br>

<%}%>

 <button class="button img-a"value="2"name="button"onclick=" actionA();">購入へ進む</button><br>

 </form>
</body>
</html>
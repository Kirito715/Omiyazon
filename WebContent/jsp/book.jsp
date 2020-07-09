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
	 document.getElementById('form').action="../ItemDetail";
}
</script>
</head>
<body>
<form id='form' name='form'>
<%ArrayList<String[]> book = (ArrayList<String[]>) session.getAttribute("mybook");%>
<%for(int i=0;i<book.size();i++){%>

<%=book.get(i)[1]%>
<button class="button img-a"value="5"name="button"onclick=" actionA();">詳細</button><br>
<input type="hidden"name="itemid"value="<%=book.get(i)[0]%>">
<br>
<%}%>
</form>
</body>
</html>
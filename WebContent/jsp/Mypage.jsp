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
	 document.getElementById('form').action="../Mypage2";
}
</script>
</head>
<body>
<form id='form' name='form'>
<div class="container">
<table class="table">
<%String uid=(String)session.getAttribute("uid");%>
<%ArrayList<String[]> user = (ArrayList<String[]>) session.getAttribute("myuser");%>
<%ArrayList<String[]> recode = (ArrayList<String[]>) session.getAttribute("myrecode");%>
<%ArrayList<String[]> book = (ArrayList<String[]>) session.getAttribute("mybook");%>
<button class="button img-a"value="4"name="button"onclick=" actionA();">ログアウト</button>
<input type="hidden"name="uid"value="<%=uid%>">
<%=user.get(0)[0]%><br>
<%=user.get(0)[1]%>
<%=user.get(0)[2]%><br>
<button class="button img-a"value="1"name="button"onclick=" actionA();">個人情報変更</button>
<br><br>
購入履歴<br><br>
<%for(int i=0;i<recode.size();i++){%>
<%=recode.get(i)[1]%><%=recode.get(i)[2]%>
<br>
<%if(i==3) break;%>

<%}%>
<button class="button img-a"value="2"name="button"onclick=" actionA();">購入履歴一覧へ</button><br>
<br>
<%for(int i=0;i<book.size();i++){%>
<%=book.get(i)[1]%><%=book.get(i)[2]%>
<br>
<%if(i==3) break;%>
<%}%>
<button class="button img-a"value="3"name="button"onclick=" actionA();">お気に入り一覧へ</button><br>
</table>

</form>
</body>
</html>
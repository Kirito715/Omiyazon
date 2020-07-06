<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function actionA(){
	 document.getElementById('form').action="../recode2";
}
</script>
<title>Insert title here</title>
</head>
<body>

<form id='form' name='form'>
購入履歴
<%String uid=(String)session.getAttribute("uid");%>
<input type="hidden"name="uid"value="<%=uid%>">
<%ArrayList<String[]> recode = (ArrayList<String[]>) session.getAttribute("myrecode");%>
<%for(int i=0;i<recode.size();i++){%>
<%=recode.get(i)[1]%>
<input type="hidden"name="sid"value="<%=recode.get(i)[0]%>">
<input type="hidden"name="did"value="<%=recode.get(i)[5]%>">
<%if(recode.get(i)[4].equals("0")){%>
<button class="button img-a"value="1"name="Rbutton"onclick=" actionA();">発送の中止</button>
<%}%>
<button class="button img-a"value="2"name="Rbutton"onclick=" actionA();">カートに入れる</button>
<br>
<%}%>
</form>
</body>
</html>
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
	 document.getElementById('form').action="../Thensyuu";
}

function actionB(){
    document.getElementById('form').action="../Tkousin";
}
function actionC(){
    document.getElementById('form').action="../page";
}
</script>
</head>
<body>
<%String pa=(String)session.getAttribute("page");
int pa2= Integer.parseInt(pa);
%>
<%ArrayList<String[]> tokusyuu = (ArrayList<String[]>) session.getAttribute("tokusyuu");%>
<%int count=0,end=15,start=pa2*end,size=tokusyuu.size(),b=size/end;
%>
<form id='form' name='form'>
<select name="combo">
<option value="1">新着順</option>
<option value="2">投稿が古い物</option>
</select>
<input type="text"name="txt">
<button class="button img-a"value=""name="tid"onclick=" actionB();">検索</button><br>
<%for(int i=start;i<size;i++){ %>
<%=tokusyuu.get(i)[1]%> <%=tokusyuu.get(i)[4]%> <%=tokusyuu.get(i)[3]%>
<button class="button img-a"value="<%=tokusyuu.get(i)[0]%>"name="tid"onclick=" actionA();">詳細</button><br>
</div>
<%if(count==end){
break;
}
count++;
%>
 <%} %>
<%for(int p=0;p<b+1;p++){
	 %>
<button class="button img-a"value="<%=p%>"name="no"onclick=" actionC();"><%=p+1%></button>
	<%
 }%>
 <input type="hidden"name="seni"value="1">
</form>
</body>
</html>
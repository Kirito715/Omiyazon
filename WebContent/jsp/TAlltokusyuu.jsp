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
	 document.getElementById('form').action="../Tsyousai";
}

function actionB(){
    document.getElementById('form').action="../Tkousin";
}
function actionC(){
    document.getElementById('form').action="../page";
}
</script>
		<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body class="text-center">
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
<button class="button  btn-primary"value=""name="tid"onclick=" actionB();">検索</button><br>
 <table class="table table-striped">
    <thead>
      <tr>
        <th>特集名</th>
        <th>開始日時</th>
        <th></th>
      </tr>
    </thead>
<%for(int i=start;i<size;i++){ %>
	<tr>
		<td><%=tokusyuu.get(i)[1]%></td>
		<td><%=tokusyuu.get(i)[4]%></td>
		<td><button class="button btn-primary"value="<%=tokusyuu.get(i)[0]%>"name="tid"onclick=" actionA();">詳細</button><br></td>
	</tr>
<%if(count==end){
break;
}
count++;
%>
 <%} %>


 </table>
</form>
<%for(int p=0;p<b+1;p++){
	 %>
<button class="button  btn-primary"value="<%=p%>"name="no"onclick=" actionC();"><%=p+1%></button>
	<%
 }%>
  <input type="hidden"name="seni"value="3">
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>特集一覧</title>
<link rel="stylesheet" href="../css/slide.css" type="text/css">
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
<%@include file="header.jsp" %>
<div class="body">
<br><br>
<%String pa=(String)session.getAttribute("page");
int pa2= Integer.parseInt(pa);
%>
<%ArrayList<String[]> tokusyuu = (ArrayList<String[]>) session.getAttribute("tokusyuu");%>
<%int count=0,end=15,start=pa2*end,size=tokusyuu.size(),b=size/end;
%>
<div align="left">
<form id='form' name='form'>
<div class="form-group row">
	<select name="combo" class="custom-select col-sm-3" >
		<option value="1">新着順</option>
		<option value="2">投稿が古い物</option>
	</select>
	<div class="col-sm-8">
		<input type="text" name="txt" class="form-control" placeholder="商品名(あいまい検索)">
	</div>
	<button class="btn btn-primary"value=""name="tid"onclick=" actionB();">検索</button>
</div>
<input type="hidden"name="seni"value="3">
</div>
 <table class="table table-striped">
    <thead>
      <tr>
        <th>特集名</th>
        <th>開始日時</th>
        <th></th>
      </tr>
    </thead>
<%for(int i=start;i<size;i++){
if(tokusyuu.get(i)[3].equals("1"))continue;%>
	<tr>
		<td><%=tokusyuu.get(i)[1]%></td>
		<td><%=tokusyuu.get(i)[4]%></td>
		<td><button class="btn btn-outline-primary"value="<%=tokusyuu.get(i)[0]%>"name="tid"onclick=" actionA();">詳細</button><br></td>
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
<button class="btn btn-primary"value="<%=p%>"name="no"onclick=" actionC();"><%=p+1%></button>
	<%
 }%>
  <input type="hidden"name="seni"value="3">
  </div>
</body>
</html>
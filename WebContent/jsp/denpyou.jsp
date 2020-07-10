<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>伝票一覧</title>
 <!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
function actionA(){
	 document.getElementById('form').action="../Dsyousai";
}

function actionB(){
    document.getElementById('form').action="../Dkousin";
}
function actionC(){
    document.getElementById('form').action="../page";
}
function actionD(){
    document.getElementById('form').action="../Dupdate";
}
</script>
</head>
 <body class="text-center">
 <%@include file="managerHeader.jsp" %>
<%String txt=(String)session.getAttribute("txt");
String pa=(String)session.getAttribute("page");
int pa2= Integer.parseInt(pa);
%>
<%ArrayList<String[]> denpyou = (ArrayList<String[]>) session.getAttribute("denpyou");%>
<%int count=0,end=15,start=pa2*end,size=denpyou.size(),b=size/end;
%>

<br>
<div class="container">
<form id='form' name='form'>
<div class="form-group row">
	<select name="combo" class="custom-select col-sm-3" >
		<option value="1">新着順</option>
		<option value="2">投稿が古い物</option>
		<option value="3">未発送</option>
	</select>
	<div class="col-sm-8">
		<input type="text" name="txt" class="form-control" value="<%=txt%>">
	</div>
	<button class="btn btn-outline-primary"value=""name="tid"onclick=" actionB();">検索</button>
</div>

<br>

<div class="container">
	<table class="table table-hover table-sm">
	<thead>
		<tr>
			<th></th>
			<th>id </th>
			<th>購入日時</th>
			<th>注文状態</th>
			<th></th>
		</tr>
	</thead>
<%for(int i=start;i<size;i++){ %>
	<tbody>
		<tr>
			<td><input type="checkbox"name="check"value="<%=denpyou.get(i)[0]%>"></td>
			<td><%=denpyou.get(i)[0]%></td>
			<td><%=denpyou.get(i)[2]%></td>
<%String a="";
if(denpyou.get(i)[3].equals("0")){
	a="未発送";
}
else if(denpyou.get(i)[3].equals("1")){
	a="発送済み";
}
%>
			<td><%=a %></td>
			<td><button class="btn btn-outline-primary"value="<%=denpyou.get(i)[0]%>"name="did"onclick=" actionA();">詳細</button><br></td>
<%if(count==end){
break;
}
count++;
%>
 <%} %>
 		</tr>
	</tbody>
	</table>
</div>
<%for(int p=0;p<b+1;p++){
	 %>
<button class="btn btn-primary"value="<%=p%>"name="no"onclick=" actionC();"><%=p+1%></button>
	<%
 }%>

 <br> <br>
 <button class="btn btn-primary"value="1"name="button"onclick=" actionD();">すべて発送</button>
 <button class="btn btn-primary"value="2"name="button"onclick=" actionD();">選択発送</button>
<input type="hidden"name="seni"value="2">
</form>
</div>
</body>
</html>
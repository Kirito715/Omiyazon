<%@page import="java.util.ArrayList"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>特集作成</title>
    <!-- BootstrapのCSS読み込み -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <!-- jQuery読み込み -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- BootstrapのJS読み込み -->
    <script src="js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="managerHeader.jsp" %>
<%Date a = new Date();
SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
String date = dateFormat.format(a); %>
<br>
<div class="container">
	<form action="../Tinsert2">
	<%String[] sid = (String[]) session.getAttribute("sid");%>
	<%ArrayList<String[]> kanren = (ArrayList<String[]>) session.getAttribute("kanren");%>
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">タイトル</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="title" placeholder="商品名を入力" required>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">特集本文</label>
		<div class="col-sm-10">
			<textarea style="width:100%; height:110px;" class="form-control" name="honbun" placeholder="特集本文を入力" required></textarea>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">公開開始</label>
		<div class="col-sm-10">
			<input type="date" class="form-control" name="fdate" value="<%=date%>" required>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">公開終了</label>
		<div class="col-sm-10">
			<input type="date" class="form-control" name="edate" required>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-sm-2 col-form-label">特集用画像</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" name="pasu" required>
		</div>
	</div>
表示される関連商品一覧
<div class="container" style="width:100%; max-height:500px; overflow-y:auto;">
	<table class="table table-sm table-hover">
	<thead class="thead-dark">
		<tr>
			<th style="position: sticky; top: 0;"></th>
			<th style="position: sticky; top: 0;">商品名</th>
			<th style="position: sticky; top: 0;">価格</th>
			<th style="position: sticky; top: 0;">加盟店</th>
		</tr>
	</thead>
	<tbody>
		<tbody>
<%
	if(kanren != null){
	int cnt = 1;
	for(String[] k: kanren){
%>

		<tr>
			<th scope="row"><%=cnt %></th>
			<td><%=k[1] %></td>
			<td><%=k[2] %></td>
			<td><%=k[3] %></td>
		</tr>
<%
		cnt++;
	}
	}
%>
	</tbody>
</table>
</div>

	<input class="btn btn-primary" type="submit"value="作成する">
	<input type="hidden"value="">
	</form>
</div>
</body>
</html>
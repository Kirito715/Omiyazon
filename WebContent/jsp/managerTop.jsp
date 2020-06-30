<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>管理者システム</title>
	<!-- BootstrapのCSS読み込み -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery読み込み -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- BootstrapのJS読み込み -->
	<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body onLoad="select_checked1()">
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Omiyazon.Manage</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="#">注文管理</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="#">特集管理</a>
      </li>
    </ul>
      	<a class="btn btn-outline-warning text-right" href="#" role="button">ログアウト</a>
  </div>
</nav>

<!-------------------------------------------------------------------------------------------------------------------->
<!------------------------------------------------------- ここから --------------------------------------------------->
<!-------------------------------------------------------------------------------------------------------------------->
<div class="container">
	<form class="form-horizontal" action="#">
		<div class="form-group">
			<label class="control-label col-xs-2">地方</label>
			<div class="col-xs-5">
				<select class="custom-select" name="" id="">
					<option value="0">指定なし</option>
				</select>
			</div>
		<div class="form-group">
			<label class="control-label col-xs-2">都道府県</label>
			<div class="col-xs-5">
				<select class="custom-select" name="" id="">
					<option value="0">指定なし</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-xs-2">ジャンル</label>
			<div class="col-xs-5">
				<select class="custom-select" name="genre" id="genre">
					<option value="0">指定なし</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-xs-2">商品名</label>
			<div class="col-xs-5">
				<input type="text" name="itemName" id="itemName" class="form-control">
			</div>
		</div>
		<div class="form-group">
			<div class="custom-control custom-radio">
				<input type="radio" id="Radio1" name="movieState" class="custom-control-input" value="0">
				<label class="custom-control-label" for="Radio1">販売中</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" id="Radio2" name="movieState" class="custom-control-input" value="1">
				<label class="custom-control-label" for="Radio2">販売停止</label>
			</div>
		</div>
			<div>
				<button style="width:100px; height:100%;"   type="submit" class="btn btn-outline-primary">検索</button>
				<a style="width:100px; height:100%;"   type="button" class="btn btn-outline-success offset-m1" href="../../ManagerNewMovieIn">新規</a>
			</div>
	</form>
</div>
<hr>

<%
	//セッションから検索データを受け取る
	ArrayList<String[]> ary = (ArrayList<String[]>)session.getAttribute("mData");
	if(ary == null) {
		ary = new ArrayList<String[]>();
		String a[] = {"商品名","価格","ジャンル","在庫","加盟店名","都道府県名","地方名"};
		ary.add(a);
		ary.add(a);
		ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);
		ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);ary.add(a);
	}
%>
<div class="container" style="width:100%; height:600px; overflow-y:auto;">
	<form>
	<table class="table table-sm table-hover">
	<thead class="thead-dark">
		<tr>
			<th style="position: sticky; top: 0;"></th>
			<th style="position: sticky; top: 0;"></th>
			<th style="position: sticky; top: 0;">商品名</th>
			<th style="position: sticky; top: 0;">価格</th>
			<th style="position: sticky; top: 0;">ジャンル</th>
			<th style="position: sticky; top: 0;">在庫</th>
			<th style="position: sticky; top: 0;">加盟店名</th>
			<th style="position: sticky; top: 0;">都道府県名</th>
			<th style="position: sticky; top: 0;">地方名</th>
			<th style="position: sticky; top: 0;"></th>
		</tr>
	</thead>
	<tbody>
<%
	if(ary != null){
	int cnt = 1;
	for(String[] a: ary){
%>

		<tr>
			<td><input type="checkbox" id="customCheck1"></td>
			<th scope="row"><%=cnt %></th>
<%
		for(String b:a){
%>
			<td><%=b %></td>
<%
		}
%>
		<td><button type="button" class="btn btn-outline-primary" onclick="move('<%= a[0]%>')">変更</button></td>
		</tr>
<%
		cnt++;
	}
	}
%>
	</tbody>
</table>
</form>
</div>
<form action="../../ManagerMovieChangeIn" name="frm">
	<input type="hidden" name="sid" id="sid">
</form>

</body>
</html>
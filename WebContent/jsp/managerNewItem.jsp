<%@page import="common.DBClass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者システム</title>
<%
	ArrayList<String[]> region = (ArrayList<String[]>)session.getAttribute("mRegionList");
	ArrayList<String[]> pref = (ArrayList<String[]>)session.getAttribute("mPrefList");
	String[] searchCondition = (String[])session.getAttribute("mSearchCondition");

	if(region == null){
		DBClass db = new DBClass();
		db.dbOpen();
		region = db.getRegion();
		db.dbClose();
		session.setAttribute("regionList",region);
	}
	if(pref == null){
		DBClass db = new DBClass();
		db.dbOpen();
		pref = db.getPref();
		db.dbClose();
		session.setAttribute("prefList",pref);
	}
	if(searchCondition == null){
		searchCondition = new String[5];
		searchCondition[0] ="";
		for(int i = 1;i<5;i++){
			searchCondition[i] ="0";
		}
	}
%>
	<!-- BootstrapのCSS読み込み -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery読み込み -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- BootstrapのJS読み込み -->
	<script src="../js/bootstrap.min.js"></script>

</head>
<body>
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
      <li class="nav-item">
        <a class="nav-link" href="#">特集管理</a>
      </li>
    </ul>
      	<a class="btn btn-outline-warning text-right" href="#" role="button">ログアウト</a>
  </div>
</nav>

<div class="container">
<p class="text-center display-4">映画情報追加</p>
	<form action="../../ManagerNewMovieInsert" name="frmInsert">
		<div class="form-group row">
			<label for="inputId" class="col-sm-2 col-form-label">映画ID</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="id" name="id" value=null readonly>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputName" class="col-sm-2 col-form-label">商品名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="name" name="name" placeholder="商品名を入力" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputName" class="col-sm-2 col-form-label">価格</label>
			<div class="col-sm-10">
				<input type="number" class="form-control" id="price" name="price" placeholder="価格を入力" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputName" class="col-sm-2 col-form-label">注文上限</label>
			<div class="col-sm-10">
				<input type="number" class="form-control" id="price" name="price" placeholder="注文上限を入力" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="genre" class="col-sm-2 col-form-label">ジャンル</label>
			<div class="col-sm-10">
				<select class="custom-select" name="selectGenre" id="selectGenre">
					<option value="0">指定なし</option>
					<option value="1">加工食品</option>
					<option value="2">果物</option>
					<option value="3">和菓子</option>
					<option value="4">洋菓子・スイーツ</option>
					<option value="5">水・飲料</option>
					<option value="6">お酒</option>
					<option value="7">調味料</option>
					<option value="8">雑貨・工芸品</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputSummary" class="col-sm-2 col-form-label">商品概要</label>
			 <div class="col-sm-10">
			      <textarea style="width:100%; height:110px;" class="form-control" id="summary" name="summary" placeholder="商品概要を入力" required></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPicture1" class="col-sm-2 col-form-label">画像1</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic1" name="pic1"  placeholder="画像パスを入力" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputpicture2" class="col-sm-2 col-form-label">画像2</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic2" name="pic2"  placeholder="画像パスを入力" >
			</div>
		</div>
		<div class="form-group row">
			<label for="inputpicture3" class="col-sm-2 col-form-label">画像3</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic3" name="pic3"  placeholder="画像パスを入力" >
			</div>
		</div>
		<div class="form-group row">
			<label for="inputpicture4" class="col-sm-2 col-form-label">画像4</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic4" name="pic4"  placeholder="画像パスを入力" >
			</div>
		</div>
		<div class="form-group row">
			<label for="inputpicture5" class="col-sm-2 col-form-label">画像5</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic5" name="pic5"  placeholder="画像パスを入力" >
			</div>
		</div>
		<hr>
		<div class="form-group row">
			<div class="col">
				<a type="button" class="btn btn-warning btn-block" href="managerTop.jsp">戻る</a>
			</div>
			<div class="col">
				<button type="button" class="btn btn-primary btn-block" onclick="moveup()">追加</button>
			</div>
		</div>
	</form>
</div>

</body>
</html>
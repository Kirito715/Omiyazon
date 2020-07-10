<%@page import="common.DBClass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>商品一覧</title>
<%
	//ログイン情報
	String userId = (String)session.getAttribute("userId");
%>
<%
	ArrayList<String[]> region = (ArrayList<String[]>)session.getAttribute("regionList");
	ArrayList<String[]> pref = (ArrayList<String[]>)session.getAttribute("prefList");
	String[] searchCondition = (String[])session.getAttribute("searchCondition");

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
		searchCondition = new String[11];
		searchCondition[0] ="";
		for(int i = 1;i<11;i++){
	searchCondition[i] ="0";
		}
	}
%>
<%
	//検索結果
	ArrayList<String[]>searchResult = (ArrayList<String[]>)session.getAttribute("searchResult");
	if(searchResult == null){
		searchResult = new ArrayList<String[]>();
	}
%>
<%
	//カート
	String cartNum = "0";
	{
	DBClass db = new DBClass();
	db.dbOpen();

	cartNum = db.getCartNum(userId);

	db.dbClose();
	}
%>
<!-- jQuery読み込み -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- BootstrapのCSS読み込み -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<!-- BootstrapのJS読み込み -->
<script src="../../js/bootstrap.min.js"></script>

<script src="../../js/jquery.raty.js"></script>

<script type="text/javascript">
  $(function () {
    $("#submit_button").click(function () {
        //var data = $(this).closest('form').serialize();
        //alert(data);
    $("#searchtext").val($('#search').val());
    $('#frm2').submit();
    });

    var ary = new Array();

    <% for(int i=0; i<searchResult.size(); i++){%>

    ary.push('<%=searchResult.get(i)[6] %>');

    <% }%>

    for(var i=0; i<ary.length; i++){
      $('#star'+i).raty( {
			 score : ary[i],		//スコア初期値
		     readOnly: true,   //true : 閲覧者によるスコアの変更不可  false:変更可能
		     path:'../../ratyimage' //サーバ上のRaty画像のパス
		    });
    }

	var $children = $('.children'); //都道府県の要素を変数に入れます。
	var original = $children.html(); //後のイベントで、不要なoption要素を削除するため、オリジナルをとっておく

	//地方側のselect要素が変更になるとイベントが発生
	$('.parent').change(function() {

		//選択された地方のvalueを取得し変数に入れる
		var val1 = $(this).val();

		//削除された要素をもとに戻すため.html(original)を入れておく
		$children.html(original).find('option').each(function() {
			var val2 = $(this).data('val'); //data-valの値を取得

			//valueと異なるdata-valを持つ要素を削除
			if (val1 != val2 && val1 != 0) {
				$(this).not(':first-child').remove();
			}
		});
	});

});

  function select_checked() {
		$("#selectRegion").val("<%=searchCondition[1]%>");
		$("#selectPref").val("<%=searchCondition[2]%>");
		$(".genre[value=<%=searchCondition[3]%>]").attr("checked","checked");
		$(".genre[value=<%=searchCondition[4]%>]").attr("checked","checked");
		$(".genre[value=<%=searchCondition[5]%>]").attr("checked","checked");
		$(".genre[value=<%=searchCondition[6]%>]").attr("checked","checked");
		$(".genre[value=<%=searchCondition[7]%>]").attr("checked","checked");
		$(".genre[value=<%=searchCondition[8]%>]").attr("checked","checked");
		$(".genre[value=<%=searchCondition[9]%>]").attr("checked","checked");
		$(".genre[value=<%=searchCondition[10]%>]").attr("checked","checked");
  }

  function goDetail(id){
		$("#itemid").val(id);
		document.frm3.submit();
	}
</script>
<style>
.DivLink {
	position: relative;
    padding: 20px;
    overflow: auto;
    margin: 0 auto;
    z-index: 1;
}

.DivLink a {
	position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    text-indent:-999px;
    z-index: 2;

}

.DivLink:hover {
	filter:alpha(opacity=70);
	-ms-filter: "alpha(opacity=70)";
	-moz-opacity:0.7;
	-khtml-opacity: 0.7;
	opacity:0.7;
	zoom:1;
}

</style>

</head>
<body onLoad="select_checked()">

<%--ヘッダー --%>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-dark" style="margin-top:-25px;">
<a class="navbar-brand text-white" href="../../TopPage">Omiyazon</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<form class="form-inline " id="frm1" name="frm1" action="../../HeaderItemSearch">
			<input class="form-control" type="text" placeholder="検索" aria-label="Search" name="search" id="search" >
			<button class="btn btn-success" type="submit">検索</button>
		</form>

		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link text-white" href="../../TAlltokusyuu">特集一覧</a>
			</li>
		</ul>

		<%
			if(userId!=null){
		%>
			<a class="nav-link hover" href="../../cart" role="button">
			<img alt="カート" src="../../img/cart.png"  width=40 height=35 >
			<span class="text-warning" style="position:relative; left:-29px; top:-8px; font-size: 20px; font-weight: bold"><%=cartNum %></span>
			</a>
			<a class="btn btn-warning text-right" href="../Mypage.jsp" role="button">マイページ</a>
		<%}else{%>
			<a class="btn btn-warning text-right" href="../user/Login.jsp" role="button">ログイン</a>
		<%} %>
	</div>
</nav>
<br>
<div class="container-fluid">
<div class="row">
<div class="col-sm-3">

<form action="../../ItemSearch" id="frm2" name="frm2">
<br>
	<select name="selectRegion" id="selectRegion" class="custom-select parent">
		<option value ="0">地方</option>
		<%
			for(String[] a: region){
		%>
		<option value=<%=a[0] %>><%=a[1] %></option>
		<%} %>
	</select>
	<br>
	<select name="selectPref" id="selectPref" class="custom-select children">
		<option value ="0">都道府県</option>
		<%
			for(String[] a: pref){
		%>
		<option value=<%=a[0] %> data-val="<%=a[2] %>"><%=a[1] %></option>
		<%} %>
	</select>
	<br>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="check1" name="genre" class="genre" value="1">
		<label class="form-check-label" for="check1">加工食品</label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="check2" name="genre" class="genre" value="2">
		<label class="form-check-label" for="check2">果物</label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="check3" name="genre" class="genre" value="3">
		<label class="form-check-label" for="check3">和菓子</label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="check4" name="genre" class="genre" value="4">
		<label class="form-check-label" for="check4">洋菓子・スイーツ</label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="check5" name="genre" class="genre" value="5">
		<label class="form-check-label" for="check5">水・飲料</label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="check6" name="genre" class="genre" value="6">
		<label class="form-check-label" for="check6">お酒</label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="check7" name="genre" class="genre" value="7">
		<label class="form-check-label" for="check7">調味料</label>
	</div>
	<div class="form-check">
		<input class="form-check-input" type="checkbox" id="check8" name="genre" class="genre" value="8">
		<label class="form-check-label" for="check8">雑貨・工芸品</label>
	</div>
	<button class="btn btn-outline-primary" type="button" id="submit_button">検索</button>
	<input type="hidden" name="searchtext" id="searchtext">
	<br>
</form>
</div>
<div class="col-sm-8">
<%
	int j = 0;
	for(String[] a: searchResult){
%>
<div class="DivLink">
<img style="width:200px; height:200px; float:left; margin-right:20px;" src="../<%=a[5] %>">

	<h4><%=a[1] %></h4><br>
	<%=a[2] %><br>
	<%=a[3] %><br>
	<%=a[4] %>円<br>
	<span style="position:relative; left:-5px; top:-2px;"id="star<%=j %>"></span><%=a[6] %><br>
	<%=a[7] %>

<%if(userId!=null){ %>
	<%if(a[8].equals("1")){%>
		<span style="text-align: right; display: block;">
 			<img style="width:30px; height:30px;" src="../../img/heart1.png">
 		</span>
	<%}else{%>
		<span style="text-align: right; display: block;">
			<img style="width:30px; height:30px;" src="../../img/heart0.png">
		</span>
	<%} %>
<%} %>
	<a href="#<%=a[0] %>" onclick="goDetail('<%=a[0]%>');return false;"></a>
</div>
<hr>
<% j++;} %>
</div>
</div>
</div>
<form action="../../ItemDetail" name="frm3" id="frm3">
	<input type="hidden" name="itemid" id="itemid">
</form>
</body>
</html>
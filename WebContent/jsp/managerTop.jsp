<%@page import="common.DBClass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<%
	//セッションから検索データを受け取る
	ArrayList<String[]> ary = (ArrayList<String[]>)session.getAttribute("mSearchResult");
	if(ary == null) {
		ary = new ArrayList<String[]>();
	}
%>
<meta charset="UTF-8">
<title>管理者システム</title>
	<!-- BootstrapのCSS読み込み -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery読み込み -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- BootstrapのJS読み込み -->
	<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">
$(function() {
    $('input:checkbox').change(function() {
        var cnt = $('#checkcnt input:checkbox:checked').length;

        if(cnt > 0){
        	$("#goBtn").prop('disabled', false);
        }
        else{
        	$("#goBtn").prop('disabled', true);
        }

        $('div.checkret').text(cnt + '件選択中');
    }).trigger('change');

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
</script>
</head>
<body>
<%@include file="managerHeader.jsp" %>

<!-------------------------------------------------------------------------------------------------------------------->
<!------------------------------------------------------- ここから --------------------------------------------------->
<!-------------------------------------------------------------------------------------------------------------------->

<div class="container">
<div class="row"><br></div>
	<form class="form-horizontal" action="../ManagerItemSearch">
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">地方</label>
			<div class="col-sm-10">
				<select class="custom-select parent" name="selectRegion" id="selectRegion">
					<option value="0">指定なし</option>
					<%
					for(String[] a: region){
					%>
					<option value=<%=a[0] %>><%=a[1] %></option>
					<%} %>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">都道府県</label>
			<div class="col-sm-10">
				<select class="custom-select children" name="selectPref" id="selectPref">
					<option value="0">指定なし</option>
					<%
					for(String[] a: pref){
					%>
					<option value=<%=a[0] %> data-val="<%=a[2] %>" ><%=a[1] %></option>
					<%} %>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label class="col-sm-2 col-form-label">ジャンル</label>
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
			<label class="col-sm-2 col-form-label">商品名</label>
			<div class="col-sm-10">
				<input type="text" name="itemName" id="itemName" class="form-control" placeholder="商品名(あいまい検索)">
			</div>
		</div>
		<div class="form-group">
			<div class="custom-control custom-radio">
				<input type="radio" id="Radio1" name="itemState" class="custom-control-input itemState" value="0" checked="checked">
				<label class="custom-control-label" for="Radio1">販売中</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" id="Radio2" name="itemState" class="custom-control-input itemState" value="1">
				<label class="custom-control-label" for="Radio2">販売停止</label>
			</div>
		</div>
			<div>
				<button style="width:100px; height:100%;"   type="submit"  class="btn btn-outline-primary">検索</button>
				<a style="width:100px; height:100%;"   type="button" class="btn btn-outline-success offset-m1" href="managerNewItem.jsp">新規</a>
			</div>
	</form>
</div>
<hr>

<form id="checkcnt" action="../Tinsert">
<div class="container" style="width:100%; max-height:500px; overflow-y:auto;">
	<table class="table table-sm table-hover">
	<thead class="thead-dark">
		<tr>
			<th style="position: sticky; top: 0;"></th>
			<th style="position: sticky; top: 0;"></th>
			<th style="position: sticky; top: 0;">商品名</th>
			<th style="position: sticky; top: 0;">価格</th>
			<th style="position: sticky; top: 0;">ジャンル</th>
			<th style="position: sticky; top: 0;">注文</th>
			<th style="position: sticky; top: 0;">加盟店</th>
			<th style="position: sticky; top: 0;">県名</th>
			<th style="position: sticky; top: 0;">地方</th>
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
			<td><input type="checkbox" id="itemid" name="itemid" value="<%=a[0] %>"></td>
			<th scope="row"><%=cnt %></th>
			<td><%=a[1] %></td>
			<td><%=a[2] %></td>
			<td><%=a[3] %></td>
			<td><%=a[7] %></td>
			<td><%=a[4] %></td>
			<td><%=a[5] %></td>
			<td><%=a[6] %></td>
		<td><button type="button" class="btn btn-outline-primary" onclick="move('<%= a[0]%>')">詳細</button></td>
		</tr>
<%
		cnt++;
	}
	}
%>
	</tbody>
</table>
</div>
<div class="container" style="padding: 10px;">
<div class="row">
<div class="col-8"></div>
<div class="col-sm-2">
	<div class="checkret" style="position:relative; top:5px; font-size: 20px;"></div>
</div>
<div class="col-sm-2">
	<input class="btn btn-primary" type="submit" id="goBtn" value="特集作成へ" disabled>
</div>
</div>
</div>
</form>
<form action="../ManagerItemDetail" name="frm">
	<input type="hidden" name="sid" id="sid">
</form>


<script type="text/javascript">

function move(id){
	$("#sid").val(id);	//jQuery
	document.frm.submit();
}

</script>
</body>
</html>
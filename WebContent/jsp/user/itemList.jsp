<%@page import="common.DBClass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//ログイン情報
//	String userId = (String)session.getAttribute("userId");
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
<%	//検索結果
	ArrayList<String[]>searchResult = (ArrayList<String[]>)session.getAttribute("searchResult");
	if(searchResult == null){
		searchResult = new ArrayList<String[]>();
	}
%>
<%
	//カート
//	String cartNum = "0";
	{
	DBClass db = new DBClass();
	db.dbOpen();

//	cartNum = db.getCartNum(userId);

	db.dbClose();
	}
%>
<!-- BootstrapのCSS読み込み -->
<link href="../../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery読み込み -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- BootstrapのJS読み込み -->
<script src="../../js/bootstrap.min.js"></script>

<script>
  $(function () {
    $("#submit_button").click(function () {
      //var data = $(this).closest('form').serialize();
      //alert(data);
    $("#searchtext").val($('#search').val());
    $('#frm2').submit();
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
<%@include file="header.jsp" %>

<div class="container-fluid">
<div class="row">
<div class="col-sm-4">

<form action="../../ItemSearch" id="frm2" name="frm2">
<br>
	<select name="selectRegion" id="selectRegion" class="custom-select">
		<option value ="0">地方</option>
		<%
			for(String[] a: region){
		%>
		<option value=<%=a[0] %>><%=a[1] %></option>
		<%} %>
	</select>
	<br>
	<select name="selectPref" id="selectPref" class="custom-select">
		<option value ="0">都道府県</option>
		<%
			for(String[] a: pref){
		%>
		<option value=<%=a[0] %>><%=a[1] %></option>
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
	for(String[] a: searchResult){
%>
<div class="DivLink">
<img style="width:200px; height:200px; float:left; margin-right:20px;" src="../<%=a[5] %>">

	<h4><%=a[1] %></h4><br>
	<%=a[2] %><br>
	<%=a[3] %><br>
	<%=a[4] %>円<br>
	<%=a[6] %><br>
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
<a href="#<%=a[0] %>"></a>
</div>
<hr>
<%} %>
</div>
</div>
</div>

</body>
</html>
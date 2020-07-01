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
	String userId = (String)session.getAttribute("userId");

	if(userId == null){
		userId = "1";
		session.setAttribute("userId",userId);
	}
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

</head>
<body onLoad="select_checked()">

<%--ヘッダー --%>
<header>
	<nav>
		<h2><a href="#">Omiyazon</a></h2>
		<ul>
			<li>
			<div class="form-text-field-all">
				<form action="../../HeaderItemSearch" id="frm1" name="frm1">
					<input type="text" name="search" id="search" placeholder="検索欄" value="<%=searchCondition[0] %>">
					<input type="submit" value="検索">
				</form>
			</div>
			</li>
			<li>
				<a href="#">特集一覧</a>
			</li>
			<%
				if(userId!=null){
			%>
			<li>
				<a href="#">カート:<%=cartNum %></a>
			</li>
			<%}%>
			<li>
				<%
				if(userId!=null){
				%>
				<a href="#">マイページ</a>
				<%}else{ %>
				<a href="#">ログイン</a>
				<%} %>
			</li>
		</ul>
	</nav>
</header>

<br>
<div class="LikesIcon">
	<i class="far fa-heart LikesIcon-fa-heart"></i>
</div>
<br>

<div>
<form action="../../ItemSearch" id="frm2" name="frm2">
	<select name="selectRegion" id="selectRegion">
		<option value ="0">地方</option>
		<%
			for(String[] a: region){
		%>
		<option value=<%=a[0] %>><%=a[1] %></option>
		<%} %>
	</select>
	<br>
	<select name="selectPref" id="selectPref">
		<option value ="0">都道府県</option>
		<%
			for(String[] a: pref){
		%>
		<option value=<%=a[0] %>><%=a[1] %></option>
		<%} %>
	</select>
	<br>
	<input type="checkbox" name="genre" class="genre" value="1">加工食品<br>
	<input type="checkbox" name="genre" class="genre" value="2">果物<br>
	<input type="checkbox" name="genre" class="genre" value="3">和菓子<br>
	<input type="checkbox" name="genre" class="genre" value="4">洋菓子・スイーツ<br>
	<input type="checkbox" name="genre" class="genre" value="5">水・飲料<br>
	<input type="checkbox" name="genre" class="genre" value="6">お酒<br>
	<input type="checkbox" name="genre" class="genre" value="7">調味料<br>
	<input type="checkbox" name="genre" class="genre" value="8">雑貨・工芸品<br>
	<button type="button" id="submit_button">検索</button>
	<input type="hidden" name="searchtext" id="searchtext">
</form>
</div>

<%
	ArrayList<String[]>searchResult = (ArrayList<String[]>)session.getAttribute("searchResult");
	if(searchResult == null){
		searchResult = new ArrayList<String[]>();
	}
%>

<table>
	<tr>
	<td><img style="width:200px; height:200px;" src="../../img/testimg.png"></td>
	<td>商品名<br>
		加盟店名<br>
		評価<br>
		ジャンル<br>
		値段<br>
		在庫有無</td>
	</tr>
	<%
	for(String[] a: searchResult){
	%>
	<tr>
	<td><img style="width:200px; height:200px; object-fit: cover;" src="../../img/TokyoBanana.jpg"></td>
	<td><%=a[1] %><br>
		<%=a[2] %><br>
		<%=a[3] %><br>
		<%=a[4] %><br>
		<%=a[6] %><br>
		<%=a[7] %></td>
	<td>
	<%if(userId!=null){ %>
	<input type="checkbox"<%if(a[8].equals("1")){%> checked="checked" <%}%> >お気に入り
	<%} %>
	</td>
	</tr>

	<%} %>
</table>


</body>
</html>
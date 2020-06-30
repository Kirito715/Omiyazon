<%@page import="common.DBClass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery読み込み -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

<script>
  $(function () {
    $(document).on('click', '.form-text-field-all .submit_button', function () {

      var data = $(this).closest('form').serialize();

      alert(data);
    });
  });
</script>

</head>
<body>

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
	}
%>


<header>
	<nav>
		<h2><a href="#">Omiyazon</a></h2>
		<ul>
			<li>
			<div class="form-text-field-all">
				<form action="../HeaderItemSearch">
					<input type="text" name="search" placeholder="検索欄" value="<%=searchCondition[0] %>">
					<input type="submit" value="検索">
				</form>
			</div>
			</li>
			<li>
				<a href="#">特集一覧</a>
			</li>
			<li>
				<a href="#">カート</a>
			</li>
			<li>
				<a href="#">ログイン</a>
			</li>
		</ul>
	</nav>
</header>

<div class="form-text-field-all">
<form action="../ItemSearch">
	<select name="selectRegion">
		<option value ="">地方</option>
		<%
			for(String[] a: region){
		%>
		<option value=<%=a[0] %>><%=a[1] %></option>
		<%} %>
	</select>
	<br>
	<select name="selectPref">
		<option value ="">都道府県</option>
		<%
			for(String[] a: pref){
		%>
		<option value=<%=a[0] %>><%=a[1] %></option>
		<%} %>
	</select>
	<br>
	<input type="checkbox" name="genre" value="1">加工食品<br>
	<input type="checkbox" name="genre" value="2">果物<br>
	<input type="checkbox" name="genre" value="3">和菓子<br>
	<input type="checkbox" name="genre" value="4">洋菓子・スイーツ<br>
	<input type="checkbox" name="genre" value="5">水・飲料<br>
	<input type="checkbox" name="genre" value="6">お酒<br>
	<input type="checkbox" name="genre" value="7">調味料<br>
	<input type="checkbox" name="genre" value="8">雑貨・工芸品<br>
	<button type="button" class="submit_button">仮検索</button>
	<input type="submit" value="検索">
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
	<td><img style="width:200px; height:200px;" src="../img/testimg.png"></td>
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
	<td><img style="width:200px; height:200px; object-fit: cover;" src="../img/TokyoBanana.jpg"></td>
	<td><%=a[1] %><br>
		<%=a[2] %><br>
		<%=a[3] %><br>
		<%=a[4] %><br>
		<%=a[6] %><br>
		<%=a[7] %></td>
	</tr>

	<%} %>
</table>


</body>
</html>
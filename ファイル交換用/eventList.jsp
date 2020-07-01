<%@page import="java.util.ArrayList"%>
<%@page import="common.Singleton.DataUser"%>
<%@page import="common.Singleton"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>イベント一覧</title>

<head>

<style>
.DivLink {
	position: relative;
	width: 500px;
	height: 300px;
	background-color: #FFFFFF;
	border: 1px solid #000000;
}

.DivLink .Link {
	display: block;
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	text-decoration: none;
}
</style>
<!-- jQuery読み込み -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js">

</script>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://getbootstrap.com/docs/4.0/dist/css/bootstrap.min.css">
<link
	href="https://getbootstrap.com/docs/4.0/examples/offcanvas/offcanvas.css"
	rel="stylesheet">

<style type="text/css">
<!--
body {
	background: #373B44; /* fallback for old browsers */
	background: #780206; /* fallback for old browsers */
	background: -webkit-linear-gradient(#061161, #780206);
	/* Chrome 10-25, Safari 5.1-6 */
	background: linear-gradient(#061161, #780206);
	/* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
	url (../../image/main_6.jpg);
	background-size: cover;
}

.form {
	color: fffacd;
}
.jumbotron {
	background-image: url("../../image/105.jpg");
	background-size: cover;
	background-position: center 60%;
}

-->
</style>

</head>

<body>

	<%
		ArrayList<String[]> ary = (ArrayList<String[]>) session.getAttribute("eventList");
			String LoginEvent = (String)session.getAttribute("LoginEvent");
			String listsort = (String) session.getAttribute("listsort");
			if (listsort == null) {
		listsort = "";
			}

			if (!Singleton.NullCheck()) {
		Singleton.Init();
			}
		if (LoginEvent == null) {
			LoginEvent = "";
		}
	%>

	<nav
		class="navbar navbar-expand-md fixed-top navbar-dark bg-dark  mr-auto ">
		<a class="navbar-brand" href="../topPage/topPage.jsp"> <img
			src="../../image/navbar.jpg" alt="Online Bar">
		</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExampleDefault"
			aria-controls="navbarsExampleDefault" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>


		<div class="collapse navbar-collapse " id="navbarsExampleDefault">


			<ul class="navbar-nav mr-auto">
				<%-- Integer.parseInt(Singleton.GetUserData(DataUser.Login.ordinal())) --%>
				<%
					if (Integer.parseInt(Singleton.GetUserData(DataUser.Login.ordinal())) == 1) {
				%>
				<li class="nav-item"><a class="nav-link"
					href="../PremiumMember/premiumMemberAdd.jsp">プレミアム会員登録</a></li>
				<%
					}
				%>
			</ul>

			<ul class="navbar-nav">
				<li class="nav-item "><a class="nav-link"
					<%if (Integer.parseInt(Singleton.GetUserData(DataUser.Login.ordinal())) == 1) {%>
					href="../MyPage/myPage.jsp">マイページ <span class="sr-only">(current)</span></a>
					<%
						} else {
					%> href="../MyPage/userLogin.jsp">ログイン</a></li>
				<%
					}
				%>
				</li>
				<li class="nav-item"><a class="nav-link"
					<%if (Integer.parseInt(Singleton.GetUserData(DataUser.Login.ordinal())) == 1) {%>
					href="../../UserLogout">ログアウト</a></li>
				<%
					} else {
				%>
				href="../Member/newMemberAdd.jsp">新規登録
				</a>
				</li>
				<%
					}
				%>
			</ul>
		</div>
	</nav>

	<br>

	<div class="container">
		<div class="row row-offcanvas row-offcanvas-right">
			<div class="col-6 col-md-3 sidebar-offcanvas" id="sidebar ">
				<div class="list-group">
					<a href="../../ItemSeachSet"
						class="list-group-item btn-outline-primary">商品購入</a> <a
						href="../../EventList" class="list-group-item btn-outline-primary">イベント一覧</a>
				</div>
				<br>

				<%
					if (Singleton.GetUserData(DataUser.PremiumMember.ordinal()).equals("1")) {
				%>
				<div class="list-group">
					<% if(LoginEvent.equals("0")){ %>
						<a href="eventCreate.jsp"class="list-group-item btn-outline-warning">イベント作成</a>
						<%}else{ %>
						<a href="../../EventEdit" class="list-group-item btn-outline-warning">イベント編集</a>
						<a href="../../EventCancelSet"class="list-group-item btn-outline-warning">イベントキャンセル</a>
						<%} %>
				</div>
				<%
					}
				%>

				<div>
					<a class="twitter-timeline" data-width="320" data-height="400"
						data-theme="light"
						href="https://twitter.com/DnoisinoSake?ref_src=twsrc%5Etfw">Tweets
						by sZDUTsGiobl8rRF</a>
					<script async src="https://platform.twitter.com/widgets.js"
						charset="utf-8"></script>
				</div>
			</div>

			<div class="col-8 jumbotron" style="">
				<div style="background-color: #454545" align="center"
					class="col-md-12 rounded p-3">
					<h1>
						<font color="#FCECEA">イベント一覧</font>
					</h1>
					<p align="center">
						<font color="#FCECEA"><font size="2">会ったことのない人とも気軽に会話し、時間を気にせず、お酒の場を楽しめます。</font></font>
					</p>
				</div>

				<br>

				<form name="order" action="../../EventList">
					<select name="listsort" onchange="document.order.submit();"
						class="custom-select d-block w-100" id="month" required>
						<option value="未選択" <%if (listsort.equals("未選択")) {%> selected
							<%}%>>未選択</option>
						<option value="新着順" <%if (listsort.equals("新着順")) {%> selected
							<%}%>>新着順</option>
						<option value="開催日順" <%if (listsort.equals("開催日順")) {%> selected
							<%}%>>開催日順</option>
						<option value="終了済み" <%if (listsort.equals("終了済み")) {%> selected
							<%}%>>終了済み</option>
					</select>
				</form>

				<form name="eveteDetail" action="../../EventOverview">
					<%
						for (int i = 0; i <= ary.size() - 1; i++) {
					%>
					<hr class="mb-3">
					<br>

					<div class="DivLink">
						<table class="table">
							<caption>イベント一覧</caption>
							<tr>
								<th>イベント画像</th>
								<th>イベント名</th>
								<th>開催日</th>
							</tr>
							<%
								if (ary.get(i)[9] == null || ary.get(i)[9].equals("")) {
										ary.get(i)[9] = "../../image/default_e.jpg";
									}
							%>

							<tr>
								<a class="Link" onclick="eventSet('<%=ary.get(i)[0]%>')">
									<td><img src="<%=ary.get(i)[9]%>" width="150" height="150"></td>
									<td><%=ary.get(i)[1]%></td>
									<td><%=ary.get(i)[7]%>～<%=ary.get(i)[8]%><br><br>
									<%
										if (!"".equals(String.valueOf(ary.get(i)[2]))) {%>
											<%=" #" + ary.get(i)[2]%>
									<%}%>
									<%
										if (!"".equals(String.valueOf(ary.get(i)[3]))) {%>
											<%=(" #" + ary.get(i)[3]) %>
									<%}%>
									<%
										if (!"".equals(String.valueOf(ary.get(i)[4]))) {%>
											<%=(" #" + ary.get(i)[4]) %>
									<%}%>
									<br>
									<%
										if (!"".equals(String.valueOf(ary.get(i)[5]))) {%>
											<%=(" #" + ary.get(i)[5]) %>
									<%}%>
									<%
										if (!"".equals(String.valueOf(ary.get(i)[6]))) {%>
											<%=(" #" + ary.get(i)[6]) %>
									<%}%>
									</td>
								</a>
							</tr>

						</table>
					</div>
					<%
						}
					%>
					<input type="hidden" id="hiddenId" name="hiddenId" value="000">
				</form>
		<footer class="my-3 pt-3 text-muted text-center text-small">
			<p class="mb-1">&copy; D will Company 2020</p>
		</footer>
			</div>
			<!--/span-->
		</div>
	</div>
	<!--/span-->
</body>

<script type="text/javascript">
	function eventSet(id) {
		document.getElementById("hiddenId").value = id;
		document.eveteDetail.submit();
	}
</script>
</html>
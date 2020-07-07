<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カート</title>
<link rel="stylesheet" href="../css/slide.css" type="text/css">
<script type="text/javascript">
	function actionA() {
		document.getElementById('form').action = "../kounyu";
	}
</script>
<!-- BootstrapのCSS読み込み -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery読み込み -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- BootstrapのJS読み込み -->
<script src="../js/bootstrap.min.js"></script>
</head>
<body class="text-center">
	<br>
	<div class="body">
		<form id='form' name='form'>
			<%
				String uid = (String) session.getAttribute("uid");
			%>
			<input type="hidden" value="<%=uid%>" name="uid">
			<%
				ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");
			%>
			<table class="table table-striped text-center" align="center" style="width:800px">
				<thead>
					<tr>
						<th>商品名</th>
						<th>個数</th>
						<th>更新・削除</th>
					</tr>
					<%
						for (int i = 0; i < cart.size(); i++) {
					%>
					<tr>
						<td><%=cart.get(i)[1]%></td>
						<td><input type="number" name="num"
							value="<%=cart.get(i)[2]%>" style="text-align: right">個</td>
						<input type="hidden" value="<%=cart.get(i)[0]%>" name="sid">
						<td><button class="button  btn-primary" value="3"
								name="button" onclick=" actionA();">数量更新</button>
							<button class="button  btn-primary" value="1" name="button"
								onclick=" actionA();">削除</button></td>
					</tr>
					<%
						}
					%>
				</thead>
			</table>
			<br> <br>
			<button class="button btn-primary" value="2" name="button"
				onclick=" actionA();">購入へ進む</button>
			<br>

		</form>
	</div>
</body>

</html>
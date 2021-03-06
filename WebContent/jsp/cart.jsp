<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>カート</title>
<%@include file="header.jsp"%>
<link rel="stylesheet" href="../css/slide.css" type="text/css">

<!-- BootstrapのCSS読み込み -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<!-- jQuery読み込み -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- BootstrapのJS読み込み -->
<script src="../js/bootstrap.min.js"></script>

<script type="text/javascript">
$(function(){
	 $('.upd').change(function() {
		 var sid = $(this).closest('tr').find('.btd').val();
		 var num =$(this).closest('tr').find('input').val();
		 window.location.href = '../kounyu?action=upd&sid='+sid+'&num='+num;
	 });
	 $('.btd').on('click', function() {
		 var sid = $(this).val();
		 var num =$(this).closest('tr').find('input').val();
		 window.location.href = '../kounyu?action=del&sid='+sid+'&num='+num;
	 });
});
</script>


</head>
<body class="text-center">

	<br>
	<div class="body">
		<form  action="../kounyu" method="post">
			<%
				String uid = (String) session.getAttribute("uid");
			%>
			<input type="hidden" value="<%=uid%>" name="uid">
			<%
				ArrayList<String[]> cart = (ArrayList<String[]>) session.getAttribute("cart");
				ArrayList<Integer> max = (ArrayList<Integer>) session.getAttribute("max");
			%>
			<table class="table table-striped text-center" align="center" style="width:800px">
				<thead>
					<tr>
						<th>商品名</th>
						<th>個数</th>
						<th>削除</th>
					</tr>
					<%
						for (int i = 0; i < cart.size(); i++) {
					%>
					<tr>
						<td><%=cart.get(i)[1]%></td>
						<td><input type="number" name="num" class="upd"
							value="<%=cart.get(i)[2]%>" style="text-align: right" min=1 max=<%=max.get(0)%> required>個</td>
						<td>
							<button class="btd btn-primary" value="<%=cart.get(i)[0]%>" type="button" name="del">削除</button>
						</td>
					</tr>
					<%
						}
					%>
				</thead>
			</table>
			<br> <br>
			<%if(cart.size()==0){%>
				<p>カートの中身がありません</p>
			<% }else{ %>
			<button class="btn btn-primary"  type="submit">購入へ進む</button>
			<%} %>
			<br>

		</form>
	</div>
	<footer><p class="mt-5 mb-3 text-muted" align="center">&copy; Omiyazon</p></footer>

</body>

</html>
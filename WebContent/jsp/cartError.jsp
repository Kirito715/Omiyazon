<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="">

<title>購入エラー</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Custom styles for this template -->
<link
	href="https://getbootstrap.com/docs/4.0/examples/sign-in/signin.css"
	rel="stylesheet">
</head>

<body class="text-center">
	<%String overitem=(String)session.getAttribute("overitem"); %>
	<%Integer overid=(Integer)session.getAttribute("overid"); %>
	<form class="form-signin" action="../cart">
		<h2 class="h3 mb-3 font-weight-normal">申し訳ございません</h2>
			<h4 class="h3 mb-3 font-weight-normal">注文された</h4>
			<h3><a href="../ItemDetail?itemid=<%=overid%>"><%=overitem%></a>は</h3>
			<h4 class="h3 mb-5 font-weight-normal">すでに在庫切れか、在庫を超えて注文されています</h4>
			<h5 class="h3 mb-5 font-weight-normal">恐れ入りますがもう一度カートから個数を選び直してご購入をお願い致します</h5>
		<button class="btn btn-lg btn-primary btn-block" type="submit">カートへ</button><br>
		<p class="mt-5 mb-3 text-muted">&copy; Omiyazon</p>

	</form>
</body>
</html>
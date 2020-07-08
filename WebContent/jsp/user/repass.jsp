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

<title>パスワード再取得</title>

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
	<form class="form-signin" action="../../Repass"method="POST">
		<h1 class="h3 mb-3 font-weight-normal">パスワードを</h1>
		<h1 class="h3 mb-3 font-weight-normal">お忘れですか？</h1><br>
		<h4 class="h6 mb-3 font-weight-normal">Omiyazonに登録されているメールアドレスを入力してください。</h4>
		<label for="password" class="sr-only">password</label>
		<input type="text" id="Mail" class="form-control" placeholder="mail" required autofocus name="Mail"><br>
		<button class="btn btn-lg btn-primary btn-block" type="submit">次へ進む</button><br>
		<p class="mt-5 mb-3 text-muted">&copy; Omiyazon</p>


	</form>
</body>
</html>
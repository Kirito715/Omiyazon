<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../../html/header.html"%>

<!doctype html>
<html lang="ja">
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="">

<title>登録内容確認</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">

<!-- Custom styles for this template -->
<link
	href="https://getbootstrap.com/docs/4.0/examples/checkout/form-validation.css"
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

<body class="bg-light">
	<%
		String sUserID = (String) session.getAttribute("UserID");
		String sNN = (String) session.getAttribute("NN");
		String sName = (String) session.getAttribute("Name");
		String sHurihuri = (String) session.getAttribute("Hurihuri");
		String sYaer = (String) session.getAttribute("Year");
		String sMonth = (String) session.getAttribute("Month");
		String sDay = (String) session.getAttribute("Day");
		String sGengder = (String) session.getAttribute("Gender");
		String sPos_1 = (String) session.getAttribute("Pos_1");
		String sPos_2 = (String) session.getAttribute("Pos_2");
		String sAddress_1 = (String) session.getAttribute("Address_1");
		String sAddress_2 = (String) session.getAttribute("Address_2");
		String sPass = (String) session.getAttribute("Pass");
		String sCheckPass = (String) session.getAttribute("CheckPass");
	%>

	<div class="container jumbotron">
		<div class="py-6 col-md-6 order-md-6">
			<h2>入力内容確認</h2>
		</div>

		<div class="row">
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">内容に間違いがないか確認してください</h4>
				<form class="needs-validation" novalidate
					action="../../newMemberConfirmation" method="post">
					<div class="mb-3">
						<label for="UserID">ユーザーID</label>
						<h4><%=sUserID%></h4>
					</div>

					<div class="mb-3">
						<label for="NN">ニックネーム</label>
						<h4><%=sNN%></h4>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="Name">氏名</label>
							<h4><%=sName%></h4>
						</div>
						<div class="col-md-6 mb-3">
							<label for="Hurihuri">フリガナ</label>
							<h4><%=sHurihuri%></h4>
						</div>
					</div>

					<div class="mb-3">
						<label for="pass">パスワード</label>
						<h4><%=sPass%></h4>
					</div>

					<div class="mb-3">
						<label for="CheckPass">パスワードの確認</label>
						<h4><%=sCheckPass%></h4>
					</div>

					<div>
						<div>
							<label for="birth">生年月日</label>
						</div>
					</div>

					<div>
						<h4><%=sYaer%>年<%=sMonth%>月<%=sDay%>日
						</h4>
					</div>

					<div>
						<label for="CheckPass">性別</label>
					</div>

					<div>
						<h4><%=sGengder%></h4>
					</div>

					<div>
						<div>
							<label for="pos_1">郵便番号</label>
						</div>
					</div>

					<div>
						<h4>
							〒<%=sPos_1%>-<%=sPos_2%></h4>
					</div>

					<div>
						<label>住所</label>
						<h4><%=sAddress_1%></h4>
					</div>

					<div>
						<h4><%=sAddress_2%></h4>
					</div>

					<hr class="mb-3">

					<div class=>
						<a href="newMemberInput.jsp"
							class="btn btn-outline-warning btn-lg float-left" role="button">内容変更</a>
						<button class="btn btn-primary btn-lg ml-12 float-right"
							type="submit">登録する</button>
					</div>
				</form>

			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; D will Company 2020</p>
		</footer>
	</div>

	<!-- Bootstrap core JavaScript
================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
	<script src="https://getbootstrap.com/assets/js/vendor/holder.min.js"></script>
	<script>
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict';

			window.addEventListener('load',
					function() {
						// Fetch all the forms we want to apply custom Bootstrap validation styles to
						var forms = document
								.getElementsByClassName('needs-validation');

						// Loop over them and prevent submission
						var validation = Array.prototype.filter.call(forms,
								function(form) {
									form.addEventListener('submit', function(
											event) {
										if (form.checkValidity() === false) {
											event.preventDefault();
											event.stopPropagation();
										}
										form.classList.add('was-validated');
									}, false);
								});
					}, false);
		})();
	</script>
</body>
</html>
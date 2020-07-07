<%@page import="bean.MemberBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
<link rel="stylesheet" href="../css/slide.css" type="text/css">
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
<div class="body">
<body class="bg-light">

	<% MemberBean bean = (MemberBean)session.getAttribute("beanData");
		String sNN = bean.getNickname();
		String sName = bean.getName();
		String sHurihuri = bean.getFurigana();
		String sEmail = bean.getEmail();
		String sYaer = bean.getYear();
		String sMonth =  bean.getMonth();
		String sDay =  bean.getDay();
		String sGengder =  bean.getGender();
		String sPos_1 =  bean.getPcode();
		String sPos_2 =  bean.getPcode2();
		String sAddress_1 =  bean.getAdd();
		String sAddress_2 =  bean.getAdd2();
		String sPass =  bean.getPass();
	%>

	<div class="container jumbotron">
		<div class="py-6 col-md-6 order-md-6">
			<h2>入力内容確認</h2>
		</div>

		<div class="row">
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">内容に間違いがないかご確認ください</h4>
				<form class="needs-validation" novalidate
					action="../../NewMember?action=done" method="get">

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
						<label for="email">メールアドレス</label>
						<h4><%=sEmail%></h4>
					</div>

					<div class="mb-3">
						<label for="pass">パスワード</label>
						<h4><%=sPass%></h4>
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
					<%if(sAddress_2 != null){ %>
						<h4><%=sAddress_2%></h4>
					<%} %>
					</div>

					<hr class="mb-3">

					<div class=>
						<a href="../../NewMember?action=back"
							class="btn btn-outline-warning btn-lg float-left" role="button">内容変更</a>
						<a href="../../NewMember?action=done"
					 class="btn btn-primary btn-lg ml-12 float-right" role="button">登録する</a>
					</div>
				</form>

			</div>
		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; Omiyazon</p>
		</footer>
	</div>
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
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

<title>会員登録完了</title>

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
	<div class="container jumbotron">
		<div class="row">
			<div class="col-auto">
				<div class="col-2"></div>
				<h1>登録完了！</h1>
			</div>
		</div>
		<hr class="mb-3">
		<div class="row ">
			<div class="col-auto">
				<h4 class="p-3">
					登録完了しました！<br>OnLineBarをどうぞお楽しみください！
				</h4>
			</div>
			<div class="col-auto p-3">
				<h4>何から始めるか迷っているアナタはこちら！</h4>
				<a href="../topPage/topPage.jsp"
					class="btn btn-outline-primary btn-lg float-left" role="button">トップページへ</a>
			</div>

			<div class="col-auto p-3">
				<h4>新しい出会いを求めているアタナはこちら！</h4>
				<a href="../../EventList"
					class="btn btn-outline-danger btn-lg float-left" role="button">イベント一覧へ</a>
			</div>

			<div class="col-auto p-3">
				<h4>お酒を求め続けるアナタにはこちら！</h4>
				<a href="../../ItemSeachSet"
					class="btn btn-outline-success btn-lg float-left" role="button">通販トップへ</a>
			</div>

			<div class="col-auto p-3">
				<h4>自己紹介や準備は大切！マイページを編集したいアナタにはこちら！</h4>
				<a href="../MyPage/myPage.jsp"
					class="btn btn-outline-info btn-lg float-left" role="button">マイページへ</a>
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
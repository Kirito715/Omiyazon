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

<title>修正完了</title>
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

<body class="bg-light">
<div class="body">
	<div class="container jumbotron">
		<div class="row">
			<div class="col-auto">
				<div class="col-2"></div>
				<h1>修正完了！</h1>
			</div>
		</div>
		<hr class="mb-3">
		<div class="row ">
			<div class="col-auto">
				<h4 class="p-3">
					修正完了しました！<br>Omiyazonをどうぞお楽しみください！
				</h4>
			</div>
		</div>
		<div class="row">
			<div class="col-auto p-3">
				<a href="../../Mypage"
					class="btn btn-outline-primary btn-lg float-left" role="button">マイページへ</a>
			</div>


			<div class="col-auto p-3">

				<a href="../../ItemSearch"
					class="btn btn-outline-success btn-lg float-left" role="button">商品一覧</a>
			</div>

			</div>


		</div>

		<footer class="my-5 pt-5 text-muted text-center text-small">
			<p class="mb-1">&copy; Omiyazon</p>
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
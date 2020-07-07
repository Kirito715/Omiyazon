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

<title>登録情報修正</title>

<link rel="stylesheet" href="../css/slide.css" type="text/css">


<script src="https://ajaxzip3.github.io/ajaxzip3.js" charset="UTF-8"></script>
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

<body>
<%@include file="header.jsp" %>

	<div class="body">
	<div class="container jumbotron">
		<div class="py-6 col-md-6 order-md-6">
			<h2>登録情報修正</h2>
		</div>

		<div class="row">
			<div class="col-md-8 order-md-1">
				<h4 class="mb-3">お客様情報を入力してください</h4>
				<form class="needs-validation" novalidate
					action="../UpdateMemberInfo" method="post">

					<div class="mb-3">
						<label for="nickName">ニックネーム</label> <input type="text" name="nickName"
							class="form-control" id="nickName" placeholder="ニックネーム" required>
						<div class="invalid-feedback">ニックネームを入力してください</div>
					</div>

					<div class="row">
						<div class="col-md-6 mb-3">
							<label for="Name">氏名</label> <input type="text" name="name"
								class="form-control" id="name" placeholder="山田健太" required>
							<div class="invalid-feedback">名前エラー</div>
						</div>
						<div class="col-md-6 mb-3">
							<label for="furigana">フリガナ</label> <input type="text"
								name="furigana" class="form-control" id="furigana"
								placeholder="ヤマダケンタ" required>
							<div class="invalid-feedback">フリガナエラー</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="email">メールアドレス</label> <input type="email" name="email"
							maxlength="30" class="form-control" id="Email" placeholder=""  required>
						<div class="invalid-feedback">アドレスエラー</div>
					</div>


					<div class="mb-3">
						<label for="pass">パスワード</label> <input type="password" name="pass"
							maxlength="16" class="form-control" id="pass" placeholder="" required>
						<div class="invalid-feedback">パスワードエラー</div>
					</div>


					<div>
						<div>
							<label for="birth">生年月日</label>
						</div>
					</div>

					<div class="row">
						<div class="col-md-3 mb-3">
							<select name="year" class="custom-select d-block w-100" id="year" required>
								<option></option>

								<%int i;
								for(i=1940 ; i<2020 ; i++){%>
								<option><%=i%></option>
								<%} %>

							</select>
							<div class="invalid-feedback">未入力エラー</div>
						</div>
						  <script type="text/javascript" src="../js/form.js"></script>

						<div class="col-md-2 mb-3">
							<select name="month" class="custom-select d-block w-100"
								id="month" required>
								<option value=""></option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
								<option>05</option>
								<option>06</option>
								<option>07</option>
								<option>08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
							</select>
							<div class="invalid-feedback">未入力エラー</div>
						</div>
						<script type="text/javascript" src="../js/form.js"></script>

						<div class="col-md-2 mb-3">
							<select name="day" class="custom-select d-block w-100" id="day"
								required>
								<option value=""></option>
								<option>01</option>
								<option>02</option>
								<option>03</option>
								<option>04</option>
								<option>05</option>
								<option>06</option>
								<option>07</option>
								<option>08</option>
								<option>09</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
								<option>14</option>
								<option>15</option>
								<option>16</option>
								<option>17</option>
								<option>18</option>
								<option>19</option>
								<option>20</option>
								<option>21</option>
								<option>22</option>
								<option>23</option>
								<option>24</option>
								<option>25</option>
								<option>26</option>
								<option>27</option>
								<option>28</option>
								<option>29</option>
								<option>30</option>
								<option>31</option>
							</select>
							<div class="invalid-feedback">未入力エラー</div>
						</div>
					</div>
					<script type="text/javascript" src="../js/form.js"></script>

					<div>
						<label for="CheckPass">性別</label>
					</div>

					<div class="form-check">
						<input class="form-check-input" name="gender" type="radio"
							id="man" value="男" checked> <label
							class="form-check-label" for="man">男 </label>
					</div>

					<div class="form-check">
						<input class="form-check-input" name="gender" type="radio"
							id="woman" value="女"> <label class="form-check-label"
							for="woman">女 </label>
					</div>

					<br>

					<div>
						<div>
							<label for="pcode">郵便番号</label>
						</div>
					</div>

					<div class="form-row col-mb-2">

						<div class="">
							<label><h4>〒</h4></label>
						</div>

						<div class="col-md-2">
							<input type="number" name="pcode" size="4" maxlength="3" class="form-control" id="pcode" required>
							<div class="invalid-feedback">未入力エラー</div>
						</div>

						<div>
							<h4>-</h4>
						</div>

						<div class="col-md-2">
							<input type="number" name="pcode2" id="pcode2" size="5" maxlength="4"  class="form-control" onKeyUp="AjaxZip3.zip2addr('pcode','pcode2','add','add');" required>
							<div class="invalid-feedback">未入力エラー</div>
						</div>
					</div>

					<div class="mb-3">
						<label for="add">住所</label> <input type="text"
							name="add" class="form-control" id="add"
							placeholder="" required>
					</div>

					<div class="mb-3">
						<label for="add2">マンション・アパート名<span class="text-muted">(ない場合は未入力OK)</span></label>
						<input type="text" name="add2" class="form-control"
							id="add2" placeholder="">
					</div>


					<hr class="mb-3">

					<div class=>
						<a href="../topPage/topPage.jsp"
							class="btn btn-outline-warning btn-lg float-left" role="button">マイページへ</a>
						<button class="btn btn-primary btn-lg ml-12 float-right" type="submit">登録を修正する</button>
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

		$(function(){
			<% MemberBean bean = (MemberBean)session.getAttribute("beanData");%>
				$('#nickName').val("<%=bean.getNickname()%>");
				$('#pass').val("<%=bean.getPass()%>");
				$('#name').val("<%=bean.getName()%>");
				$('#year').val("<%=bean.getYear()%>");
				$('#month').val("<%=bean.getMonth()%>");
				$('#day').val("<%=bean.getDay()%>");
				$('#Email').val("<%=bean.getEmail()%>");
				$('#furigana').val("<%=bean.getFurigana()%>");
				$('#pcode').val("<%=bean.getPcode()%>");
				$('#pcode2').val("<%=bean.getPcode2()%>");
				$('#add').val("<%=bean.getAdd()%>");
			if(<%=bean.getAdd2()!=null%>){
				$('#add2').val("<%=bean.getAdd2()%>");
			}

		});

	</script>
</body>
</html>

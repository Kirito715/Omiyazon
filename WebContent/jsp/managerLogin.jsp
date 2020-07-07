<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者システム</title>
	    <!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<br><br>
<div class="container">
<div class ="row">
<div class="col-sm-2"></div>
<div class="col-sm-8">
<h1 class="text-center">管理者システム</h1>
<form action="../ManagerLogin" method="post">
	<div class="form-group">
	  <label for="Input">ログインID</label>
	  <input type="text" class="form-control" id="inputId" name="inputId" placeholder="半角英数" pattern="^[0-9A-Za-z]+$" required>
	</div>
	<div class="form-group">
	  <label for="Input2">パスワード</label>
	  <input type="password" class="form-control" id="inputPass" name="inputPass" placeholder="半角英数" required>
	</div>
	<div class="text-center">
	  <button type="submit" class="btn btn-primary">ログイン</button>
	</div>
</form>
</div>
<div class="col-sm-2"></div>
</div>
</div>


</body>
</html>
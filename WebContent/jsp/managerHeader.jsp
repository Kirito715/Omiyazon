<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- BootstrapのCSS読み込み -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery読み込み -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- BootstrapのJS読み込み -->
	<script src="../js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Omiyazon.Manage</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="../denpyou">注文管理</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="../KTAlltokusyuu">特集管理</a>
      </li>
    </ul>
      	<a class="btn btn-outline-warning text-right" href="../ManagerLogout" role="button">ログアウト</a>
  </div>
</nav>
</body>
</html>
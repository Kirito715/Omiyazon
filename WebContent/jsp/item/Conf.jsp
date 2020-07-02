<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>購入確認</title>
</head>
<body>
<h1>注文内容確認</h1>
<h2>お届け先住所</h2>
〒<%= session.getAttribute("post")%><br>
住所:<%= session.getAttribute("address1")%><br>
建物名:<%= session.getAttribute("address2")%><br>
</body>
</html>
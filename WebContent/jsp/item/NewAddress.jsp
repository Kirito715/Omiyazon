<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お届け先住所の登録</title>
</head>
<body>
<h1>お届け先住所の登録</h1>
<form action="../../SendAddress"method="post">
〒<input type="tel"name=post maxlength="7"><br>
住所<input type="text"name=address1><br>
建物名<input type="text"name=address2><br>
<input type="submit"value="次へ">
</form>
</body>
</html>
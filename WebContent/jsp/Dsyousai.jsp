<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body>
<%@include file="managerHeader.jsp" %>
	<div class="container">
  <table class="table table-striped">
    <thead>
      <tr>
        <th>商品名</th>
        <th>単価</th>
      </tr>
    </thead>
    <tbody>
<%ArrayList<String[]> Dsyousai = (ArrayList<String[]>) session.getAttribute("Dsyousai");%>
<%for(int i=0;i<Dsyousai.size();i++){%>
<tr>
          <td><%=Dsyousai.get(i)[1]%></td>
          <td><%=Dsyousai.get(i)[2]%></td>
      </tr>
<br>
<%}%>
</body>
</html>
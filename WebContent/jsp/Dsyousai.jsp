<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%ArrayList<String[]> Dsyousai = (ArrayList<String[]>) session.getAttribute("Dsyousai");%>
<%for(int i=0;i<Dsyousai.size();i++){%>
<%=Dsyousai.get(i)[0]%>
<br>
<%}%>
</body>
</html>
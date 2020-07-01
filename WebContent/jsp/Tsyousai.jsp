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
<%ArrayList<String[]> Tsyousai = (ArrayList<String[]>) session.getAttribute("Tsyousai");%>
<%ArrayList<String[]> Tkanren = (ArrayList<String[]>) session.getAttribute("Tkanren");%>

 <div class="photo-background">
	    <img src="<%=Tsyousai.get(0)[6]%>"  class="photo-img" >
	    </div>
<%=Tsyousai.get(0)[1]%><br>
           <%=Tsyousai.get(0)[4]%><br>
<%=Tsyousai.get(0)[2]%><br>
関連商品<br>
<form>
<%for(int i=0;i<Tkanren.size();i++){ %>
	<%=Tkanren.get(i)[0] %><%=Tkanren.get(i)[1] %><%=Tkanren.get(i)[2]%>
	<div class="photo-background">
	    <img src="<%=Tkanren.get(i)[3]%>"  class="photo-img" >
	    </div>
	<button class="button img-a"value="<%=Tkanren.get(i)[0]%>"name="sid">詳細へ</button><br>
<%} %>
</form>
</body>
</html>
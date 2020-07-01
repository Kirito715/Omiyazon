<%@page import="bean.DetailBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link href="../css/omiyastyle.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	<% DetailBean bean = (DetailBean)session.getAttribute("DetaillBean");%>

	$('#itemname').text("<%=bean.getItemname()%>");
	$('#avgqua').text("☆<%=bean.getAvgqua()%>");
	$('#favorite').hide();
	if(<%=bean.getLogin()%>){
		$('#favorite').show();
	}
	$('#itemimage').attr('src','<%=bean.getImage1()%>');
	$('#avgqua').text("☆<%=bean.getAvgqua()%>");
	$('#price').text("<%=bean.getPrice()%>");
	$('#storename').text("<%=bean.getStorename()%>");

	if(<%=bean.getOrdable()%><=0){
		$('#cart').val("在庫がありません");
	}else if(!(<%=bean.getLogin()%>)){
		$('#cart').val("ログイン");
	}else if(<%=bean.getCart()%>>0){
		$('#cart').val("カートに追加済み");
	}else{
		$('#cart').val("カートに追加");
	}
	$('#outline').text("<%=bean.getOutline()%>");

	if("<%=bean.getNickname()%>"!=null){
	$('#review').val("<%=bean.getNickname()%>");
	}

	});

</script>

</head>
<body>

<br>
<span id="itemname"></span>
<span id="avgqua"></span>
<span id="favorite" class="heart"></span>
<br>
<img id=itemimage style="width:300; height:300; object-fit: cover;"><br>
<span id="price"></span><br>
<span id="storename"></span><br>
<input type=button id="cart"><br>
<span id="outline"></span><br>

<%	if(bean.getReviewList()!=null) {
	for(int i=0;i<bean.getReviewList().size();i++) {%>
<span>ユーザ名:<%=bean.getReviewList().get(i)[0]%></span><br>
<span>☆<%=bean.getReviewList().get(i)[2]%></span><br>
<span>レビュー:<%=bean.getReviewList().get(i)[1]%></span><br>
<%
	}
}
%>
<input type=button id="review"><br>
<br>
</body>
</html>
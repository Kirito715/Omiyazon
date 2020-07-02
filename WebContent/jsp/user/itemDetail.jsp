<%@page import="bean.DetailBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link href="../css/omiyastyle.css" rel="stylesheet">
<script type="text/javascript">
$(function(){
	<% DetailBean bean = (DetailBean)session.getAttribute("DetaillBean");%>

	$('#itemname').text("<%=bean.getItemname()%>");
	$('#favorite').hide();

	if(<%=bean.getLogin()%>){
		$('#favorite').show();
	}

	 $('.LikesIcon').on('click', function() {
		  let $btn = $(this);
		  // Likeボタンがonクラス持っていたら
		  if ($btn.hasClass('on')) {
		    $btn.removeClass('on');
		    // 白抜きアイコンに戻す
		    $btn.children("i").attr('class', 'far fa-heart LikesIcon-fa-heart');
		  } else {
		    $btn.addClass('on');
		    $btn.children("i").attr('class', 'fas fa-heart LikesIcon-fa-heart heart');
		  }
		});

	$('#itemimage').attr('src','<%=bean.getImage1()%>');

	var irev=<%=bean.getReviewList().size()%>;
	$('#sort').addClass('hide');
	if(!(irev==1)){
			$('#sort').removeClass('hide');
			$('#avgqua').text("☆<%=bean.getAvgqua()%>");
		}

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


	var re0="<%=bean.getReviewList().get(0)[0]%>";
	if(re0==("1")){
		$('#sort').val("quo");
	}

	$('#sort').change(function(){
		window.location.href = '../ItemDetail?action='+$('#sort').val();
	});


	$('#review').hide();
	if(<%=bean.getLogin()%>){
		if(<%=bean.getNickname()%>!=null){
		$('#review').val("<%=bean.getNickname()%>");
		$('#review').show();
	 }
	}

	});

</script>

</head>
<body>

<br>
<span id="itemname"></span>
<span id="avgqua"></span>


<div id="favorite" class="LikesIcon">
<i class="far fa-heart LikesIcon-fa-heart"></i>
</div>

<br>
<img id=itemimage style="width:300; height:300; object-fit: cover;"><br>
<span id="price"></span><br>
<span id="storename"></span><br>
<input type=button id="cart"><br>
<span id="outline"></span><br><br>

<%	if(bean.getReviewList()!=null) {
	for(int i=bean.getReviewList().size()-1; 1 <= i; i--) {%>
<span>ユーザ名:<%=bean.getReviewList().get(i)[0]%></span><br>
<span>☆<%=bean.getReviewList().get(i)[2]%></span><br>
<span>レビュー:<%=bean.getReviewList().get(i)[1]%></span><br>
<%
	}
}
%>
<select id="sort">
<option value="new">最新順</option>
<option value="quo">評価順</option>
</select>

<input type=button id="review"><br>
<br>
</body>
</html>
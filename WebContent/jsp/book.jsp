<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>お気に入り一覧</title>
<link rel="stylesheet" href="../css/slide.css" type="text/css">
<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
	    <link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
		<link href="../css/omiyastyle.css" rel="stylesheet">

<%String uid=(String)session.getAttribute("uid");%>
<%ArrayList<String[]> book = (ArrayList<String[]>) session.getAttribute("mybook");%>

<script type="text/javascript">
function actionA(){
	 document.getElementById('form').action="../ItemDetail";
}

$(function(){

$('.LikesIcon').addClass('on')
$('.LikesIcon').children("i").attr('class', 'fas fa-heart LikesIcon-fa-heart heart');

$('.LikesIcon').on('click', function() {
	  let $btn = $(this);
	  var num =$(this).closest('tr').find('input').val();
	  // Likeボタンがonクラス持っていたら
	  if ($btn.hasClass('on')) {
		  var request = {
				action : 'delete',
				itemid : num,
				userid : '<%=uid%>'
		  };
				  //ajaxでservletにリクエストを送信
		 $.ajax({
				type    : "GET",          //GET / POST
				url     : "../AjaxServlet",  //送信先のServlet URL（適当に変えて下さい）
				data    : request,        //リクエストJSON
			    async   : true,           //true:非同期(デフォルト), false:同期
				success : function(data) {

							$btn.removeClass('on');
						    // 白抜きアイコンに戻す
						    $btn.children("i").attr('class', 'far fa-heart LikesIcon-fa-heart');

				    }, error : function(XMLHttpRequest, textStatus, errorThrown) {
					      alert("リクエスト時にエラーが発生しました：" + textStatus +":\n" + errorThrown);
				    }
				  });

	  } else {
		  //リクエストJSON
		  var request = {
			 action : 'create',
			 itemid : num,
			 userid : '<%=uid%>'
		  };

		  //ajaxでservletにリクエストを送信
		  $.ajax({
		    type    : "GET",          //GET / POST
		    url     : "../AjaxServlet",  //送信先のServlet URL（適当に変えて下さい）
		    data    : request,        //リクエストJSON
		    async   : true,           //true:非同期(デフォルト), false:同期
			success : function(data) {
				 $btn.addClass('on');
				 $btn.children("i").attr('class', 'fas fa-heart LikesIcon-fa-heart heart');
		    },
		    error : function(XMLHttpRequest, textStatus, errorThrown) {
		      alert("リクエスト時にエラーが発生しました：" + textStatus +":\n" + errorThrown);
		    }
		  });

	  }
	});
});

</script>
</head>
<body class="text-center">
<%@include file="header.jsp" %>
<div class="body">
<br>
<h3 class="text-center">お気に入り一覧</h3>
<br>
<form id='form' name='form'>
<table class="table table-striped">

<%for(int i=0;i<book.size();i++){%>
<tr>
<td><span  class="LikesIcon"> <i style="cursor: hand; cursor:pointer;" class="far fa-heart LikesIcon-fa-heart"></i> </span>
<input type="hidden" value="<%=book.get(i)[0]%>"/>
</td>
<td align="center"><%=book.get(i)[1]%></td>
<td align="left"><button class="btn btn-outline-primary"value="<%=book.get(i)[0]%>"name="itemid"onclick=" actionA();">詳細</button><br></td>
</tr>
<%}%>
</table>
</form>
</div>
</body>
</html>
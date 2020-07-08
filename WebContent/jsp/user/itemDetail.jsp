<%@page import="java.util.ArrayList"%>
<%@page import="common.DBClass"%>
<%@page import="bean.DetailBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
	//ログイン情報
	String userId = (String)session.getAttribute("userId");

	//if(userId == null){
	//	userId = "1";
	//	session.setAttribute("userId",userId);
	//}
%>
<%
	ArrayList<String[]> region = (ArrayList<String[]>)session.getAttribute("regionList");
	ArrayList<String[]> pref = (ArrayList<String[]>)session.getAttribute("prefList");
	String[] searchCondition = (String[])session.getAttribute("searchCondition");

	if(region == null){
		DBClass db = new DBClass();
		db.dbOpen();
		region = db.getRegion();
		db.dbClose();
		session.setAttribute("regionList",region);
	}
	if(pref == null){
		DBClass db = new DBClass();
		db.dbOpen();
		pref = db.getPref();
		db.dbClose();
		session.setAttribute("prefList",pref);
	}
	if(searchCondition == null){
		searchCondition = new String[11];
		searchCondition[0] ="";
		for(int i = 1;i<11;i++){
			searchCondition[i] ="0";
		}
	}
%>
<%	//検索結果
	ArrayList<String[]>searchResult = (ArrayList<String[]>)session.getAttribute("searchResult");
	if(searchResult == null){
		searchResult = new ArrayList<String[]>();
	}
%>
<%
	//カート
	String cartNum = "0";
	{
	DBClass db = new DBClass();
	db.dbOpen();
	cartNum = db.getCartNum(userId);
	db.dbClose();
	}
%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="../../js/jquery.raty.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link href="https://use.fontawesome.com/releases/v5.6.1/css/all.css" rel="stylesheet">
<link rel="stylesheet" href="../../css/slide.css" type="text/css">
<link href="../../css/omiyastyle.css" rel="stylesheet">

<script type="text/javascript">
$(function(){
	<% DetailBean bean = (DetailBean)session.getAttribute("DetaillBean");%>

	$('#itemname').text("<%=bean.getItemname()%>");
	$('#favorite').hide();

	if(<%=bean.getLogin()%>){
		$('#favorite').show();
		if(<%=bean.getFavorite()%>){
			 $('#favorite').addClass('on');
			 $('#favorite').children("i").attr('class', 'fas fa-heart LikesIcon-fa-heart heart');
		}
	}


	 $('#favorite').on('click', function() {
		  let $btn = $(this);
		  // Likeボタンがonクラス持っていたら
		  if ($btn.hasClass('on')) {
			  var request = {
					action : 'delete',
					itemid : '<%=bean.getItemid()%>',
					userid : '<%=bean.getUserid()%>'
			  };
					  //ajaxでservletにリクエストを送信
			 $.ajax({
					type    : "GET",          //GET / POST
					url     : "../../AjaxServlet",  //送信先のServlet URL（適当に変えて下さい）
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
				 itemid : '<%=bean.getItemid()%>',
				 userid : '<%=bean.getUserid()%>'
			  };

			  //ajaxでservletにリクエストを送信
			  $.ajax({
			    type    : "GET",          //GET / POST
			    url     : "../../AjaxServlet",  //送信先のServlet URL（適当に変えて下さい）
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

	$('#itemimage').attr('src','../<%=bean.getImage1()%>');

	var irev=<%=bean.getReviewList().size()%>;
	$('#sort').addClass('hide');
	if(!(irev==1)){
			$('#sort').removeClass('hide');
			$('#avgstar').raty( {
				 score : <%=bean.getAvgqua()%>,		//スコア初期値
			     readOnly: true,   //true : 閲覧者によるスコアの変更不可  false:変更可能
			     path:'../../ratyimage' //サーバ上のRaty画像のパス
			    });
		}

	$('#price').text("\<%=bean.getPrice()%>");
	$('#storename').text("出品 : <%=bean.getStorename()%>");

	if(<%=bean.getOrdable()%><=0){
		$('#cart').val("在庫がありません");
		$('#cart').prop('disabled',true);
	}else if(!(<%=bean.getLogin()%>)){
		$('#cart').val("ログイン");
	}else if(<%=bean.getCart()%>>0){
		$('#cart').val("カートに追加済み");
		$('#cart').prop('disabled',true);
	}else{
		$('#cart').val("カートに追加");
	}

	 $('#cart').on('click', function(){
	    var cart = $('#cart').val()
		 if(cart=='ログイン'){
			 window.location.href = 'Login.jsp';
		 }else{
		 	 window.location.href = '../../ItemDetail?action=cart';
		 }
	 });


	$('#outline').text("<%=bean.getOutline()%>");


	var re0="<%=bean.getReviewList().get(0)[0]%>";
	if(re0==("1")){
		$('#sort').val("quo");
	}

	$('#sort').change(function(){
		window.location.href = '../../ItemDetail?action='+$('#sort').val();
	});


	$('#rebtn').hide();
	if(<%=bean.getLogin()%>){
		var nickname = "<%=bean.getNickname()%>";
		if(!(nickname=="null")){
			$('#rebtn').val("レビューを投稿する");
			$('#rebtn').show();
	 	}
	}



	  $('#rebtn').click(function(){
	      $('#modalArea').fadeIn();
	  });
	  $('#closeModal , #modalBg').click(function(){
	    $('#modalArea').fadeOut();
	  });



	$('#star').raty( {
	 score : 5,
     readOnly: false,   //閲覧者によるスコアの変更不可
     targetScore: '#target',
     click: function(score) {
        return $(this).attr('data-score');
     },
     path:'../../ratyimage' //サーバ上のRaty画像のパス
    });


	<% for(int i=bean.getReviewList().size()-1; 1 <= i; i--) {%>

		$('#userRev<%= i %>').raty( {
			 score : <%=bean.getReviewList().get(i)[2]%>,		//スコア初期値
		     readOnly: true,   //true : 閲覧者によるスコアの変更不可  false:変更可能
		     path:'../../ratyimage' //サーバ上のRaty画像のパス
		    });

	<%}%>

});



</script>



</head>
<body >
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-dark">
<a class="navbar-brand text-white" href="../../TopPage">Omiyazon</a>

<style type="text/css">
.modalArea {
  display: none;
  position: fixed;
  z-index: 10;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.modalBg {
  width: 100%;
  height: 100%;
  background-color: rgba(30,30,30,0.9);
}

.modalWrapper {
  position: absolute;
  top: 50%;
  left: 50%;
  transform:translate(-50%,-50%);
  width: 70%;
  padding: 10px 30px;
  background-color: #fff;
  height:70%;
  overflow : auto;
}

.closeModal {
  position: absolute;
  top: 0.5rem;
  right: 1rem;
  cursor: pointer;
}



</style>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<form class="form-inline " id="frm1" name="frm1" action="../../HeaderItemSearch">
			<input class="form-control" type="text" placeholder="検索" aria-label="Search" name="search" id="search" value="<%=searchCondition[0] %>">
			<button class="btn btn-success" type="submit">検索</button>
		</form>

		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link text-white" href="../../TAlltokusyuu">特集一覧</a>
			</li>
		</ul>

		<%
			if(userId!=null){
		%>
			<a class="nav-link hover" href="../../cart" role="button">
			<img alt="カート" src="../../img/cart.png"  width=40 height=35 >
			<span class="text-warning" style="position:relative; left:-29px; top:-8px; font-size: 20px; font-weight: bold"><%=cartNum %></span>
			</a>
			<a class="btn btn-warning text-right" href="../Mypage.jsp" role="button">マイページ</a>
		<%}else{%>
			<a class="btn btn-warning text-right" href="Login.jsp" role="button">ログイン</a>
		<%} %>
	</div>
</nav>
<div class="body">
<br>
<span id="itemname"></span>
<span  class="col-md-6 mb-3" id="avgstar"></span>

<span id="favorite" class="LikesIcon">
<i class="far fa-heart LikesIcon-fa-heart"></i>
</span>

<br>
<img id=itemimage style="width:200px; height:200px; object-fit: cover;"><br>
<span id="price"></span><br>
<span id="storename"></span><br>
<input class="btn btn-outline-primary" type=button id="cart"><br>

<span id="outline"></span><br><br>

<select id="sort">
<option value="new">最新順</option>
<option value="quo">評価順</option>
</select>
<%	if(bean.getReviewList()!=null) {
	for(int i=bean.getReviewList().size()-1; 1 <= i; i--) {%>
<span>ユーザ名:<%=bean.getReviewList().get(i)[0]%></span><br>
<span id="userRev<%= i %>"></span><br>
<span>レビュー:<%=bean.getReviewList().get(i)[1]%></span><br>
<%
	}
}
%>


<input type=button id="rebtn" class="btn btn-outline-primary">
<section id="modalArea" class="modalArea">
	<div id="modalBg" class="modalBg"></div>
		<div class="modalWrapper">
		<div class="modalContents">
    		<!-- ここに中身を書く -->
		<FORM METHOD="POST" action="../../ItemDetail">
    		<div class="row">
				<div class="col-md-6 mb-3">
   					<label for="nickName">ニックネーム</label>
   				</div>
    			<div class="col-md-6 mb-3">
    				<label><%=bean.getNickname()%></label>
  				</div>
  			</div>
			<div class="row">
				<div class="col-md-6 mb-3">
					<label for="rev">評価 </label>
				</div>
  				<div  class="col-md-6 mb-3" id="star">
  				<input type="hidden" id="target" name="star">
  				</div>
  			</div>
			<div class="col-md-6 mb-3">
				<textarea  name=review  cols="50" rows="8" placeholder="レビュー" maxlength="500" required></textarea>
			</div>

			<input type=submit class="btn btn-outline-primary" value="送信">

			</FORM>

		<div id="closeModal" class="closeModal">
			×
		</div>

	</div>
</div>
</section>
</div>
<br>
</body>
</html>
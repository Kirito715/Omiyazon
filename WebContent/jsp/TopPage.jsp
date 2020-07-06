<%@page import="common.DBClass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
	 <!-- BootstrapのCSS読み込み -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery読み込み -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- BootstrapのJS読み込み -->
	<script src="../js/bootstrap.min.js"></script>
 　　<script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
	   <script type="text/javascript" src="../js/jquery.japan-map.min.js"></script>
 　　  <link rel="stylesheet" href="../css/slick-theme.css" type="text/css">
 　　  <link rel="stylesheet" href="../css/slick.css" type="text/css">
 　　  <script src="../js/slick.js" type="text/javascript"></script>
　　　 <title>Omiyazon～お土産専門通販サイト～</title>
		<%
			//ログイン情報
			String userId = (String)session.getAttribute("userId");

			//if(userId == null){
			//	userId = "1";
			//	session.setAttribute("userId",userId);
			//}
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


<script type="text/javascript">
$(function(){
	  $('.single-item').slick({
	    accessibility: true,
	    autoplay: true,
	    autoplaySpeed: 6000,
	    dots: true,
	    fade: true,
	  });
	  $('.multiple-items').slick({
		  infinite: true,
		  autoplay: true,
		  autoplaySpeed: 5000,
		  slidesToShow: 3,
		  slidesToScroll: 3
		});


	<%String[][] color =(String[][])session.getAttribute("color");
	int c=0;%>
	var areas = [
		{"code": 1 , "name":"北海道地方", "color":"<%=color[c][0]%>", "hoverColor":"<%=color[0][1]%>", "prefectures":[1]},
		{"code": 2 , "name":"東北地方",   "color":"<%=color[++c][0]%>", "hoverColor":"<%=color[c][1]%>", "prefectures":[2,3,4,5,6,7]},
		{"code": 3 , "name":"関東地方",   "color":"<%=color[++c][0]%>", "hoverColor":"<%=color[c][1]%>", "prefectures":[8,9,10,11,12,13,14]},
		{"code": 4 , "name":"北陸・甲信越地方",   "color":"<%=color[++c][0]%>", "hoverColor":"<%=color[c][1]%>", "prefectures":[15,16,17,18,19,20]},
		{"code": 5 , "name":"東海地方",   "color":"<%=color[++c][0]%>", "hoverColor":"<%=color[c][1]%>", "prefectures":[21,22,23,24]},
		{"code": 6 , "name":"近畿地方",   "color":"<%=color[++c][0]%>", "hoverColor":"<%=color[c][1]%>", "prefectures":[25,26,27,28,29,30]},
		{"code": 7 , "name":"中国地方",   "color":"<%=color[++c][0]%>", "hoverColor":"<%=color[c][1]%>", "prefectures":[31,32,33,34,35]},
		{"code": 8 , "name":"四国地方",   "color":"<%=color[++c][0]%>", "hoverColor":"<%=color[c][1]%>", "prefectures":[36,37,38,39]},
		{"code": 9 , "name":"九州地方",   "color":"<%=color[++c][0]%>", "hoverColor":"<%=color[c][1]%>", "prefectures":[40,41,42,43,44,45,46]},
		{"code":10 , "name":"沖縄地方",   "color":"<%=color[++c][0]%>", "hoverColor":"<%=color[c][1]%>", "prefectures":[47]}
	];

	$("#map").japanMap(
		{
			areas  : areas, //上で設定したエリアの情報
			selection : "prefecture", //選ぶことができる範囲(県→prefecture、エリア→area)
			borderLineWidth: 0.25, //線の幅
			drawsBoxLine : false, //canvasを線で囲む場合はtrue
			movesIslands : true, //南西諸島を左上に移動させるときはtrue、移動させないときはfalse
			showsAreaName : true, //エリア名を表示しない場合はfalse
			width: 651, //canvasのwidth。別途heightも指定可。
			backgroundColor: "#ffffff", //canvasの背景色
			font : "MS Mincho", //地図に表示する文字のフォント
			fontSize : 12, //地図に表示する文字のサイズ
			fontColor : "areaColor", //地図に表示する文字の色。"areaColor"でエリアの色に合わせる
			fontShadowColor : "black", //地図に表示する文字の影の色
			onSelect:function(data){
				if(data.code<10){
					window.location.href = '../ItemSearch?selectPref=10'+data.code;
					}else{
						window.location.href = '../ItemSearch?selectPref=1'+data.code;
					}
			},
		}
	);

	var $el, leftPos, newWidth,
    $mainNav = $("#example-one");

    /* example1 */
    $mainNav.append("<li id='magic-line'></li>");
    var $magicLine = $("#magic-line");
    $magicLine
       .width($(".current_page_item").width())
       .css("left", $(".current_page_item a").position().left)
       .data("origLeft", $magicLine.position().left)
       .data("origWidth", $magicLine.width());
    $("#example-one li a").hover(function() {
       $el = $(this);
       leftPos = $el.position().left;
       newWidth = $el.parent().width();
       $magicLine.stop().animate({
          left: leftPos,
          width: newWidth
       });
    }, function() {
       $magicLine.stop().animate({
          left: $magicLine.data("origLeft"),
          width: $magicLine.data("origWidth")
       });
    });

});


function nextPage(id){

	$('#hidGenreID').val(id);
	document.frm.submit();
}

</script>
<style type="text/css">
.body {
   margin: 0px 10%;  /* 外側の余白を、上下はゼロで左右は画面横幅の15％に */
   padding: 0px;     /* 内側の余白を消す */
   background-color: white;  /* 本文部分の背景色は白色 */

}

.container {
  margin: 0 auto;
  padding: 40px;
  width: 100%;
  color: #333;
  background: lightgrey;
}

.slick-slide {
  text-align: center;
  background:white;
}
.item {
    /* slickでslider化するとimgがblockになるのでtext-alignでは中央寄せできなくなる */
    text-align: center;
}

.Tokusyu img{

	width:100%;
	height: 300px;

}

.item img {
    /* 100%にしてしまえば横幅目一杯に広がるので「左に寄る問題」自体が発生しなくなる */
    width: 150px;
    height: 280px;
    object-fit: cover;
    width: 80%;
}
.center {
    /* slickでslider化するとimgがblockになるのでmarginで中央寄せにしないといけない */
    margin: 0 auto;
}
.nav-wrap {
            margin:20px auto; padding:0;
            background-color:rgba(0,0,0,0.6);
            border-top:2px solid #fff;
            border-bottom:2px solid #fff;
         }
         #example-one {
            position:relative;
            margin:0 auto; padding:0;
            list-style:none;
            width:960px;
         }
         #example-one li {
            margin:0; padding:0;
            list-style:none;
            display:inline-block; /* inline->inline-block */
         }
         #example-one li a {
            color:#bbb;
            display:block; float:left;
            padding:4px 10px 2px 10px;
            text-decoration:none;
            text-transform:uppercase;
            font-size:14px;
         }
         #example-one li a:hover {
            color:#fff;
         }
         #magic-line {
            position:absolute;
            bottom:-2px; left:0;
            width:100px; height:2px;
            background:#fe4902;
            z-index:9999px;
         }


 .slick-prev:before,
 .slick-next:before {
   color: black;
 }
</style>

</head>
<body>
<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-dark" style="margin-top:-25px;">
<a class="navbar-brand text-white" href="../TopPage">Omiyazon</a>
<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
<span class="navbar-toggler-icon"></span>
</button>
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<form class="form-inline " id="frm1" name="frm1" action="../HeaderItemSearch">
			<input class="form-control" type="text" placeholder="検索" aria-label="Search" name="search" id="search">
			<button class="btn btn-success" type="submit">検索</button>
		</form>

		<ul class="navbar-nav mr-auto">
			<li class="nav-item">
				<a class="nav-link text-white" href="../TAlltokusyuu">特集一覧</a>
			</li>
		</ul>

		<%
			if(userId!=null){
		%>
			<a class="nav-link hover" href="#" role="button">
			<img alt="カート" src="../../img/cart.png"  width=40 height=35 >
			<span class="text-warning" style="position:relative; left:-29px; top:-8px; font-size: 20px; font-weight: bold"><%=cartNum %></span>
			</a>
			<a class="btn btn-warning text-right" href="Mypage.jsp" role="button">マイページ</a>
		<%}else{%>
			<a class="btn btn-warning text-right" href="user/Login.jsp" role="button">ログイン</a>
		<%} %>
	</div>
</nav>

<br><br>
<div class="body">

      <div class='single-item'>
      <% ArrayList <String[]> Tok = (ArrayList<String[]>)session.getAttribute("reqTokusyuPass");
	for(int i = 0; i < Tok.size(); i++){%>
        <div class='Tokusyu'>
          <input type="hidden" name="tid" value="<%=Tok.get(i)[0] %>"><a href="../Tsyousai?tid=<%=Tok.get(i)[0] %>"><img src="<%= Tok.get(i)[1] %>"></a>
        </div>
        <%} %>
    </div>


    <br><br><br><br>

	<br><br><br>

		<h3>売上ランキング!!</h3>
	<form action="../janruchange" method="post" name="frm">
	<div class="nav-wrap" align="center">
            <ul class="group" id="example-one">
            <li class="current_page_item"><a href="../janruchange">総合</a></li>
	<%
	ArrayList <String[]> Jnr = (ArrayList<String[]>)session.getAttribute("reqJanruname");
		String under = "class='current_page_item'";

	for(int i = 0; i < Jnr.size(); i++){%>

			<li <%= under %>><a href="#" onClick="nextPage('<%=Jnr.get(i)[0]%>')"><%=Jnr.get(i)[1] %></a></li>

	<%
		under = "";
	} %>
		</ul>
         </div>
         <input type="hidden" name="hidGenreID" id="hidGenreID" value="">
	</form>

		<br><br>

    	<div class='multiple-items'>
    	<% ArrayList <String[]> arr = (ArrayList<String[]>)session.getAttribute("reqRanking");
		for(int i = 0; i < arr.size(); i++){%>
    		<div class="item">
    		<a href="../ItemDetail?itemid=<%=arr.get(i)[2]%>"><img src="<%= arr.get(i)[0] %>" class="center"></a>
    		<br>
    		<%= arr.get(i)[1]%>
    		<br>
    		<%= i+1+"位"%>
    		</div>
    		<%} %>
    	</div>

<br><br><br><br>
<div id="map" align="center"></div>

<p class="mt-5 mb-3 text-muted" align="center">&copy; Omiyazon</p>

</div>

</body>
</html>
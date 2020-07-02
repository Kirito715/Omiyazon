<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 　　  <script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
	   <script type="text/javascript" src="../js/jquery.japan-map.min.js"></script>
 　　  <link rel="stylesheet" href="../css/slick-theme.css" type="text/css">
 　　  <link rel="stylesheet" href="../css/slick.css" type="text/css">
 　　  <script src="../js/slick.js" type="text/javascript"></script>
　　　 <title>jQuery</title>
<script type="text/javascript">
$(function(){
	  $('.single-item').slick({
	    accessibility: true,
	    autoplay: true,
	    autoplaySpeed: 1000,
	    dots: true,
	    fade: true,
	  });
	  $('.multiple-items').slick({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 3
		});

	<%String[][] color =(String[][])session.getAttribute("color");
	int c=1;%>
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
});
</script>
<style type="text/css">
.container {
  margin: 0 auto;
  padding: 40px;
  width: 80%;
  color: #333;
  background: #419be0;
}

.slick-slide {
  text-align: center;
  background:#419be0;
}
.item {
    /* slickでslider化するとimgがblockになるのでtext-alignでは中央寄せできなくなる */
    text-align: center;
}

.Tokusyu img{

	width:100%;

}

.item img {
    /* 100%にしてしまえば横幅目一杯に広がるので「左に寄る問題」自体が発生しなくなる */
    width: 150px;
    height: 200px;
    object-fit: cover;
    width: 80%;
}
.center {
    /* slickでslider化するとimgがblockになるのでmarginで中央寄せにしないといけない */
    margin: 0 auto;
}
</style>

</head>
<body>
<header></header>
<div class='container'>
      <div class='single-item'>
      <% ArrayList <String[]> Tok = (ArrayList<String[]>)session.getAttribute("reqTokusyuPass");
	for(int i = 0; i < Tok.size(); i++){%>
        <div class='Tokusyu'>
          <input type="hidden" name="tid" value="<%=Tok.get(i)[0] %>"><a href="../Tsyousai"><img src="<%= Tok.get(i)[1] %>"></a>
        </div>
        <%} %>
    </div>
    </div>


    <br><br><br><br>
	<form action="../janruchange" method="post">
	<button name="submit" value="NULL">総合</button>
	</form>
     <% ArrayList <String[]> Jnr = (ArrayList<String[]>)session.getAttribute("reqJanruname");
 	for(int i = 0; i < Jnr.size(); i++){%>
	<div>
		<form action="../janruchange" method="post">
		<button name="submit" value="<%=Jnr.get(i)[0] %>"><%=Jnr.get(i)[1] %></button>
	<input type="hidden" name="hidGenreID" value="<%=Jnr.get(i)[0]%>">
		</form>
	</div>
	<%} %>


    <br><br><br><br>



    <div class='container'>
    	<div class='multiple-items'>
    	<% ArrayList <String[]> arr = (ArrayList<String[]>)session.getAttribute("reqRanking");
		for(int i = 0; i < arr.size(); i++){%>
    		<div class="item">
    		<a href="../ItemDetail?itemid="<%=arr.get(i)[2]%>><img src="<%= arr.get(i)[0] %>" class="center"></a>
    		<br>
    		<%= arr.get(i)[1]%>
    		<br>
    		<%= i+1+"位"%>
    		</div>
    		<%} %>
    	</div>
    </div>

<br><br>
<div id="map"></div>

</body>
</html>
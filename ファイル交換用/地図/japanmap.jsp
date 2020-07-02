<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" src="../js/jquery.japan-map.min.js"></script>

<script type="text/javascript">
$(function(){
<%String[][] color =(String[][])session.getAttribute("color");
int i=0;%>
var areas = [
	{"code": 1 , "name":"北海道地方", "color":"<%=color[i][0]%>", "hoverColor":"<%=color[0][1]%>", "prefectures":[1]},
	{"code": 2 , "name":"東北地方",   "color":"<%=color[++i][0]%>", "hoverColor":"<%=color[i][1]%>", "prefectures":[2,3,4,5,6,7]},
	{"code": 3 , "name":"関東地方",   "color":"<%=color[++i][0]%>", "hoverColor":"<%=color[i][1]%>", "prefectures":[8,9,10,11,12,13,14]},
	{"code": 4 , "name":"北陸・甲信越地方",   "color":"<%=color[++i][0]%>", "hoverColor":"<%=color[i][1]%>", "prefectures":[15,16,17,18,19,20]},
	{"code": 5 , "name":"東海地方",   "color":"<%=color[++i][0]%>", "hoverColor":"<%=color[i][1]%>", "prefectures":[21,22,23,24]},
	{"code": 6 , "name":"近畿地方",   "color":"<%=color[++i][0]%>", "hoverColor":"<%=color[i][1]%>", "prefectures":[25,26,27,28,29,30]},
	{"code": 7 , "name":"中国地方",   "color":"<%=color[++i][0]%>", "hoverColor":"<%=color[i][1]%>", "prefectures":[31,32,33,34,35]},
	{"code": 8 , "name":"四国地方",   "color":"<%=color[++i][0]%>", "hoverColor":"<%=color[i][1]%>", "prefectures":[36,37,38,39]},
	{"code": 9 , "name":"九州地方",   "color":"<%=color[++i][0]%>", "hoverColor":"<%=color[i][1]%>", "prefectures":[40,41,42,43,44,45,46]},
	{"code":10 , "name":"沖縄地方",   "color":"<%=color[++i][0]%>", "hoverColor":"<%=color[i][1]%>", "prefectures":[47]}
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
		window.location.href = '../Prefecture?pre='+data.name;
		},
	}
);
});

</script>

<style type="text/css">

#map{
width: 651px;
padding: 10px;
margin: 20px auto;
box-shadow: 1px 2px 5px rgba(0, 0, 0, 0.3);
background: #fff;
}
@media only screen and (max-width:799px){
#map{
width: 100%;
box-sizing: border-box;	}
#map canvas{
width: 100%;
	}
}

</style>

</head>
<body>
<div id="map"></div>
</body>
</html>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Omiyazon～お土産専門通販サイト～</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script type="text/javascript">
function actionA(){
	 document.getElementById('form').action="../Mypage2";
}
$(function(){

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
});
</script>
</head>
<body>
<%@include file="header.jsp" %>
<form id='form' name='form'>
<div class="container">
<table class="table">
<%String uid=(String)session.getAttribute("uid");%>
<%ArrayList<String[]> user = (ArrayList<String[]>) session.getAttribute("myuser");%>
<%ArrayList<String[]> recode = (ArrayList<String[]>) session.getAttribute("myrecode");%>
<%ArrayList<String[]> book = (ArrayList<String[]>) session.getAttribute("mybook");%>
<button class="button img-a"value="4"name="button"onclick=" actionA();">ログアウト</button>
<input type="hidden"name="uid"value="<%=uid%>">
<%=user.get(0)[0]%><br>
<%=user.get(0)[1]%>
<%=user.get(0)[2]%><br>
<button class="button img-a"value="1"name="button"onclick=" actionA();">個人情報変更</button>
<br><br>
購入履歴<br><br>
<%for(int i=0;i<recode.size();i++){%>
<%=recode.get(i)[1]%>
<br>
<%if(i==3) break;%>

<%}%>
<button class="button img-a"value="2"name="button"onclick=" actionA();">購入履歴一覧へ</button><br>
<br>
<%for(int i=0;i<book.size();i++){%>
<%=book.get(i)[1]%>
<br>
<%if(i==3) break;%>
<%}%>
<button class="button img-a"value="3"name="button"onclick=" actionA();">お気に入り一覧へ</button><br>
</table>

</form>
<br><br><br><br>
<div id="map" align="center"></div>
</body>
</html>
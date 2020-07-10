<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Omiyazon～お土産専門通販サイト～</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link rel="stylesheet"href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
<div class="container">
<form id='form' name='form'>

<%String uid=(String)session.getAttribute("uid");%>
<%ArrayList<String[]> user = (ArrayList<String[]>) session.getAttribute("myuser");%>
<%ArrayList<String[]> recode = (ArrayList<String[]>) session.getAttribute("myrecode");%>
<%ArrayList<String[]> book = (ArrayList<String[]>) session.getAttribute("mybook");%>


<br>
<div class="row">
<div class="col-10">
<h4><%=user.get(0)[4]%>さんのアカウント</h4>
</div>

<div class="col-2">
<button class="btn btn-secondary"value="4"name="button"onclick=" actionA();">ログアウト</button>
<input type="hidden"name="uid"value="<%=uid%>">



</div>
</div>
<br>
<div class="card">
  <div class="card-body">
    <h4 class="card-title">個人情報</h4>
    <p class="card-text">
    	<%=user.get(0)[0]%><br>
    	<%=user.get(0)[3].substring(0,3)%>-<%=user.get(0)[3].substring(3)%><br>
     	<%=user.get(0)[1]%>
     	<%if(user.get(0)[2]!=null){ %>
		<%=user.get(0)[2]%>
		<%} %>
		<br>
    </p>
    <button class="btn btn-primary"value="1"name="button" onclick=" actionA();">登録情報の変更へ</button>
  </div>
</div>
<br>
<div class="card">
  <div class="card-body">
    <h4 class="card-title">購入履歴</h4>
    <p class="card-text">
     	<%for(int i=0;i<recode.size();i++){%>
			<%=recode.get(i)[1]%><br>
			<%if(i==2) break;
		}%>
		<button class="btn btn-primary"value="2"name="button"onclick=" actionA();">購入履歴一覧へ</button><br>
     </p>
     </div>
</div>

<br>
<div class="card">
  <div class="card-body">
    <h4 class="card-title">お気に入り</h4>
    <p class="card-text">
     	<%for(int i=0;i<book.size();i++){%>
		<%=book.get(i)[1]%>
		<br>
		<%if(i==2) break;%>
		<%}%>
		<button class="btn btn-primary"value="3"name="button"onclick=" actionA();">お気に入り一覧へ</button><br>
	 </p>
	 </div>
</div>
</form>

<br>
<br>
<h3 class="text-center">全国地方スタンプラリー</h3>
<br>
<br>
<div id="map" align="center"></div>
<br>
<h4 class="text-center">全国地方スタンプラリーとは</h4>
<div class=row>
<div class="col-2"></div>
<div class="col-8">
<br>
<p class="text-center">商品を購入することで、商品を購入した地方の色が染まります</p>
<p class="text-center">すべての地方を制覇すると特典が・・・？</p>
</div>
<div class="col-2"></div>
</div>
</div>
</body>
</html>
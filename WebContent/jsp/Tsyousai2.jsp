
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
		  autoplay: true,
		  autoplaySpeed: 3000,
		  slidesToShow: 3,
		  slidesToScroll: 3
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
  background: #DDDDDD;
}

.slick-slide {
  text-align: center;
}
.item {
    /* slickでslider化するとimgがblockになるのでtext-alignでは中央寄せできなくなる */
    text-align: center;
}

.Tokusyu img{

	width:100%;
	height: 400px;

}

.item img {
    /* 100%にしてしまえば横幅目一杯に広がるので「左に寄る問題」自体が発生しなくなる */
    width: 150px;
    height: 250px;
    object-fit: cover;
    width: 90%;
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

<br><br>
<div class="body">
<%ArrayList<String[]> Tsyousai = (ArrayList<String[]>) session.getAttribute("Tsyousai");%>
<%ArrayList<String[]> Tkanren = (ArrayList<String[]>) session.getAttribute("Tkanren");%>

 <div class="Tokusyu">
	    <img src="<%=Tsyousai.get(0)[6]%>" class="photo-img" >
	    </div>
		<font size="42"><%=Tsyousai.get(0)[1]%></font><br>
          <p align="right"><%=Tsyousai.get(0)[4]%></p><br>
<%=Tsyousai.get(0)[2]%><br><br><br>
関連商品<br><br>
		<div class="container">
    	<div class='multiple-items'>
    	<%	for(int i=0;i<Tkanren.size();i++){%>
    		<div class="item">
    		<a href="../ItemDetail?itemid=<%=Tkanren.get(i)[0]%>"><img src="<%=Tkanren.get(i)[3]%>" class="center"></a>
    		<br>
    		<%=Tkanren.get(i)[1] %>
    		<br>
    		<%=Tkanren.get(i)[2]+'円'%>
    		</div>
    		<%} %>
    	</div>
    	</div>


</div>

<footer><p class="mt-5 mb-3 text-muted" align="center">&copy; Omiyazon</p></footer>
</body>
</html>
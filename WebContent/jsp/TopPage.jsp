<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
 　　  <script type="text/javascript" src="http://code.jquery.com/jquery-3.1.0.min.js"></script>
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
	  $('.center').slick({
		  centerMode: true,
		  centerPadding: '60px',
		  slidesToShow: 3,
		  responsive: [
		    {
		      breakpoint: 768,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '40px',
		        slidesToShow: 3
		      }
		    },
		    {
		      breakpoint: 480,
		      settings: {
		        arrows: false,
		        centerMode: true,
		        centerPadding: '40px',
		        slidesToShow: 1
		      }
		    }
		  ]
		});
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
  color: #419be0;
  background: white;
}
img {
    width: 100%;
    height: 50vw;
    object-fit: cover;
}
</style>

</head>
<body>
<div class='container'>
      <div class='single-item'>
      <% ArrayList <String[]> Tok = (ArrayList<String[]>)session.getAttribute("reqTokusyuPass");
	for(int i = 0; i < Tok.size(); i++){%>
        <div>
          <a href=""><img src="<%= Tok.get(i)[1] %>"></a>
        </div>
        <%} %>
    </div>
    </div>


    <br><br><br><br>
    <div class='container'>
    	<div class='center'>
    	<% ArrayList <String[]> arr = (ArrayList<String[]>)session.getAttribute("reqRanking");
	for(int i = 0; i < arr.size(); i++){%>
    		<div>
    		<img src="<%= arr.get(i)[0] %>">
    		</div>
    		<%} %>
    	</div>
    </div>

</body>
</html>
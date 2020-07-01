<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    width: 100px;
    height: 100px;
    object-fit: cover;
}
</style>
<title>Insert title here</title>
</head>

<body>

<div class='container'>
      <div class='single-item'>
<%
	for(int i = 0; i <5; i++){%>
        <div>
         <%=i%>
        </div>
        <%} %>
    </div>
    </div>
</body>
</html>
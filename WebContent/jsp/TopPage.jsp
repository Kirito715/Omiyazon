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
</style>

</head>
<body>
<div class='container'>
      <div class='single-item'>
        <div>
          <h3>1</h3>
        </div>
        <div>
          <h3>2</h3>
        </div>
        <div>
          <h3>3</h3>
        </div>
        <div>
          <h3>4</h3>
        </div>
        <div>
          <h3>5</h3>
        </div>
        <div>
          <h3>6</h3>
        </div>
      </div>
    </div>
</body>
</html>
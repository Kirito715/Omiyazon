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
	  $('.multiple-items').slick({
		  infinite: true,
		  slidesToShow: 3,
		  slidesToScroll: 3
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


</body>
</html>
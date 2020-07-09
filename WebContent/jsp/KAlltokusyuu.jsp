<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<script type="text/javascript">
function actionA(){
	 document.getElementById('form').action="../Thensyuu";
}

function actionB(){
    document.getElementById('form').action="../Tkousin";
}
function actionC(){
    document.getElementById('form').action="../page";
}
</script>
		<!-- BootstrapのCSS読み込み -->
	    <link href="../css/bootstrap.min.css" rel="stylesheet">
	    <!-- jQuery読み込み -->
	    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	    <!-- BootstrapのJS読み込み -->
	    <script src="../js/bootstrap.min.js"></script>
</head>
<body class="text-center">
<%@include file="managerHeader.jsp" %>
<%String pa=(String)session.getAttribute("page");
int pa2= Integer.parseInt(pa);
%>
<%ArrayList<String[]> tokusyuu = (ArrayList<String[]>) session.getAttribute("tokusyuu");%>
<%int count=0,end=15,start=pa2*end,size=tokusyuu.size(),b=size/end;
%>
<form id='form' name='form'>
<select name="combo">
<option value="1">新着順</option>
<option value="2">投稿が古い物</option>
</select>
<input type="text"name="txt">

<button class="btn btn-primary"value=""name="tid"onclick=" actionB();">検索</button><br>
 <input type="hidden"name="seni"value="1">


<br>

<table class="table table-striped">
    <thead>
      <tr>
        <th>#</th>
        <th>特集名</th>
        <th>公開日時</th>
        <th>公開</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
    <%for(int i=start;i<size;i++){ %>
      <tr>
        <th scope="row"><%=i+1 %></th>
          <td><%=tokusyuu.get(i)[1]%></td>
          <td> <%=tokusyuu.get(i)[4]%></td>
          <%String a="";
          if(tokusyuu.get(i)[3].equals("0"))a="公開";
          else a="非公開"; %>
          <td> <%=a%></td>
          <td><button class="btn btn-primary"value="<%=tokusyuu.get(i)[0]%>"name="tid"onclick=" actionA();">詳細</button></td>
      </tr>
      <%if(count==end){
break;
}
count++;
%>
 <%} %>
    </tbody>
  </table>
<%for(int p=0;p<b+1;p++){
	 %>
<button class="btn btn-primary"value="<%=p%>"name="no"onclick=" actionC();"><%=p+1%></button>
	<%
 }%>
 </form>
</body>
</html>
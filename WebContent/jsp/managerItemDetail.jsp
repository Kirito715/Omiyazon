<%@page import="common.DBClass"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>管理者システム</title>
<%
	ArrayList<String> ary = (ArrayList<String>)session.getAttribute("mItemDetail");
	ArrayList<String[]> pref = (ArrayList<String[]>)session.getAttribute("mPrefList");

	if(pref == null){
		DBClass db = new DBClass();
		db.dbOpen();
		pref = db.getPref();
		db.dbClose();
		session.setAttribute("prefList",pref);
	}
%>
	<!-- BootstrapのCSS読み込み -->
	<link href="../css/bootstrap.min.css" rel="stylesheet">
	<!-- jQuery読み込み -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<!-- BootstrapのJS読み込み -->
	<script src="../js/bootstrap.min.js"></script>

<script type="text/javascript">
	function select_checked() {
		$("#selectGenre").val("<%=ary.get(5)%>");
		$("#selectPref").val("<%=ary.get(6)%>");
		$(".itemState[value=<%=ary.get(7)%>]").attr("checked","checked");

	}
</script>

<style type="text/css">
/* モーダルCSS */
.modalArea {
  display: none;
  position: fixed;
  z-index: 10;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
}

.modalBg {
  width: 100%;
  height: 100%;
  background-color: rgba(30,30,30,0.9);
}

.modalWrapper {
  position: absolute;
  top: 50%;
  left: 50%;
  transform:translate(-50%,-50%);
  width: 70%;
  padding: 10px 30px;
  background-color: #fff;
  height:70%;
  overflow : auto;
}

.closeModal {
  position: absolute;
  top: 0.5rem;
  right: 1rem;
  cursor: pointer;
}

</style>
<body onLoad="select_checked()">
<%@include file="managerHeader.jsp" %>

<div class="container">
<p class="text-center display-4">商品詳細</p>
	<form action="../ManagerItemUpdate" name="frmUpdate" id="frmUpdate">
		<input type="hidden" name="id" value="<%=ary.get(0) %>" readonly>
		<div class="form-group row">
			<label for="inputName" class="col-sm-2 col-form-label">商品名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="name" name="name" placeholder="商品名を入力" value="<%=ary.get(1) %>" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputName" class="col-sm-2 col-form-label">加盟店名</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="sname" name="sname" placeholder="加盟店名を入力" value="<%=ary.get(2) %>" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputName" class="col-sm-2 col-form-label">価格</label>
			<div class="col-sm-10">
				<input type="number" class="form-control" id="price" name="price" placeholder="価格を入力" value="<%=ary.get(3) %>" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputName" class="col-sm-2 col-form-label">注文上限</label>
			<div class="col-sm-10">
				<input type="number" class="form-control" id="num" name="num" placeholder="注文上限を入力" value="<%=ary.get(4) %>" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="selectGenre" class="col-sm-2 col-form-label">ジャンル</label>
			<div class="col-sm-10">
				<select class="custom-select" name="selectGenre" id="selectGenre">
					<option value="1">加工食品</option>
					<option value="2">果物</option>
					<option value="3">和菓子</option>
					<option value="4">洋菓子・スイーツ</option>
					<option value="5">水・飲料</option>
					<option value="6">お酒</option>
					<option value="7">調味料</option>
					<option value="8">雑貨・工芸品</option>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label for="selectPref" class="col-sm-2 col-form-label">都道府県</label>
			<div class="col-sm-10">
				<select class="custom-select" name="selectPref" id="selectPref">
					<%
					for(String[] a: pref){
					%>
					<option value=<%=a[0] %>><%=a[1] %></option>
					<%} %>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="custom-control custom-radio">
				<input type="radio" id="Radio1" name="itemState" class="custom-control-input itemState" value="0" checked="checked">
				<label class="custom-control-label" for="Radio1">販売中</label>
			</div>
			<div class="custom-control custom-radio">
				<input type="radio" id="Radio2" name="itemState" class="custom-control-input itemState" value="1">
				<label class="custom-control-label" for="Radio2">販売停止</label>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputSummary" class="col-sm-2 col-form-label">商品概要</label>
			 <div class="col-sm-10">
			      <textarea style="width:100%; height:110px;" class="form-control" id="summary" name="summary" placeholder="商品概要を入力" required><%=ary.get(8) %></textarea>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputPicture1" class="col-sm-2 col-form-label">画像1</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic1" name="pic1"  placeholder="画像パスを入力" value="<%=ary.get(9) %>" required>
			</div>
		</div>
		<div class="form-group row">
			<label for="inputpicture2" class="col-sm-2 col-form-label">画像2</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic2" name="pic2"  placeholder="画像パスを入力" value="<%=ary.get(10) %>" >
			</div>
		</div>
		<div class="form-group row">
			<label for="inputpicture3" class="col-sm-2 col-form-label">画像3</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic3" name="pic3"  placeholder="画像パスを入力" value="<%=ary.get(11) %>" >
			</div>
		</div>
		<div class="form-group row">
			<label for="inputpicture4" class="col-sm-2 col-form-label">画像4</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic4" name="pic4"  placeholder="画像パスを入力" value="<%=ary.get(12) %>" >
			</div>
		</div>
		<div class="form-group row">
			<label for="inputpicture5" class="col-sm-2 col-form-label">画像5</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pic5" name="pic5"  placeholder="画像パスを入力" value="<%=ary.get(13) %>" >
			</div>
		</div>
		<hr>
		<div class="form-group row">
			<div class="col">
				<a type="button" class="btn btn-warning btn-block" href="managerTop.jsp">戻る</a>
			</div>
			<div class="col">
				<button type="button" class="btn btn-primary btn-block" onclick="moveup()">更新</button>
			</div>
		</div>
	</form>
</div>

<!-- モーダルエリアここから -->
<section id="modalArea" class="modalArea">
  <div id="modalBg" class="modalBg"></div>
  <div class="modalWrapper">
	<div class="modalContents">
	<h1>確認</h1>
	<div class="d-flex">
		<div class="p-1 flex-fill w-100">商品名:</div>
		<div class="p-1 flex-fill w-100" id="modalName"></div>
	</div>
	<hr>
	<div class="d-flex">
		<div class="p-1 flex-fill w-100">加盟店名:</div>
		<div class="p-1 flex-fill w-100" id="modalSName"></div>
	</div>
	<hr>
	<div class="d-flex">
		<div class="p-1 flex-fill w-100">価格:</div>
		<div class="p-1 flex-fill w-100" id="modalPrice"></div>
	</div>
	<hr>
	<div class="d-flex">
		<div class="p-1 flex-fill w-100">注文上限:</div>
		<div class="p-1 flex-fill w-100" id="modalNum"></div>
	</div>
	<hr>
	<div class="d-flex">
		<div class="p-1 flex-fill w-100">ジャンル:</div>
		<div class="p-1 flex-fill w-100" id="modalGenre"></div>
	</div>
	<hr>
	<div class="d-flex">
		<div class="p-1 flex-fill w-100">都道府県:</div>
		<div class="p-1 flex-fill w-100" id="modalPref"></div>
	</div>
	<hr>
	<div class="d-flex">
		<div class="p-1 flex-fill w-100">販売状態:</div>
		<div class="p-1 flex-fill w-100" id="modalState"></div>
	</div>
	<hr>
	<div class="d-flex flex-column align-items-stretch">
		<div class="p-1">商品概要：</div>
		<div class="p-1" id="modalSummary"></div>
		<hr>
		<div class="p-1">画像1：</div>
		<div class="p-1"><img style="max-width:300px; max-height:300px;" id="modalPic1" src="../img/551.jpg"></div>
		<div class="p-1">画像2：</div>
		<div class="p-1"><img style="max-width:300px; max-height:300px;" id="modalPic2" src=""></div>
		<div class="p-1">画像3：</div>
		<div class="p-1"><img style="max-width:300px; max-height:300px;" id="modalPic3" src=""></div>
		<div class="p-1">画像4：</div>
		<div class="p-1"><img style="max-width:300px; max-height:300px;" id="modalPic4" src=""></div>
		<div class="p-1">画像5：</div>
		<div class="p-1"><img style="max-width:300px; max-height:300px;" id="modalPic5" src=""></div>
	</div>
      <button type="button" class="btn btn-primary btn-block" id="goUpdate">更新</button>
    </div>
    <div id="closeModal" class="closeModal">
      ×
    </div>
  </div>
</section>
<!-- モーダルエリアここまで -->

<script type="text/javascript">
$(function () {
	  $('#openModal').click(function(){
	      $('#modalArea').fadeIn();
	  });
	  $('#closeModal , #modalBg').click(function(){
	    $('#modalArea').fadeOut();
	  });

	  $('#goUpdate').click(function(){
		  $('#frmUpdate').submit();
		  alert("データを変更しました");
	  })
	});

function moveup(){

	if (! $('form')[0].reportValidity()) {
	 	return false;
	  }
	else{
		$('#modalName').text($('#name').val());
		$('#modalSName').text($('#sname').val());
		$('#modalPrice').text($('#price').val());
		$('#modalNum').text($('#num').val());
		$('#modalGenre').text($('#selectGenre option:selected').text());
		$('#modalPref').text($('#selectPref option:selected').text());
		if($('input:radio[name="itemState"]:checked').val() == '0'){
			$('#modalState').text("販売中");
		}
		else if($('input:radio[name="itemState"]:checked').val() == '1'){
			$('#modalState').text("販売停止");
		}
		$('#modalSummary').text($('#summary').val());
		$('#modalPic1').attr('src',$('#pic1').val());
		$('#modalPic2').attr('src',$('#pic2').val());
		$('#modalPic3').attr('src',$('#pic3').val());
		$('#modalPic4').attr('src',$('#pic4').val());
		$('#modalPic5').attr('src',$('#pic5').val());
		$('#modalArea').fadeIn();
	}
}


</script>
</body>
</html>
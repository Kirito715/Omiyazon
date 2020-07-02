/**
 *
 */

//var list;

//$(document).ready( function () {
//	 // デフォルトの設定を変更
//    $.extend( $.fn.dataTable.defaults, {
//        language: {
//            url: "http://cdn.datatables.net/plug-ins/9dcbecd42ad/i18n/Japanese.json"
//        }
//    });
//    createFavo();
//} );


function createFavo() {

  //リクエストJSON
  var request = {
	action : 'create'
  };

  //ajaxでservletにリクエストを送信
  $.ajax({
    type    : "GET",          //GET / POST
    url     : "../AjaxServlet",  //送信先のServlet URL（適当に変えて下さい）
    data    : request,        //リクエストJSON
    async   : true,           //true:非同期(デフォルト), false:同期
    success : function(data) {
    	 $btn.removeClass('on');
		    // 白抜きアイコンに戻す
		    $btn.children("i").attr('class', 'far fa-heart LikesIcon-fa-heart');
    }
  });

}

function deleteFavo() {

  //リクエストJSON
  var request = {
	 action : 'delete'
  };

  //ajaxでservletにリクエストを送信
  $.ajax({
    type    : "GET",          //GET / POST
    url     : "../AjaxServlet",  //送信先のServlet URL（適当に変えて下さい）
    data    : request,        //リクエストJSON
    async   : true,           //true:非同期(デフォルト), false:同期
	success : function(data) {

    },
    error : function(XMLHttpRequest, textStatus, errorThrown) {
      alert("リクエスト時になんらかのエラーが発生しました：" + textStatus +":\n" + errorThrown);
    }
  });

}
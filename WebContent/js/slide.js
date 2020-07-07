/**
 *
 */

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




	var $el, leftPos, newWidth,
    $mainNav = $("#example-one");

    /* example1 */
    $mainNav.append("<li id='magic-line'></li>");
    var $magicLine = $("#magic-line");
    $magicLine
       .width($(".current_page_item").width())
       .css("left", $(".current_page_item a").position().left)
       .data("origLeft", $magicLine.position().left)
       .data("origWidth", $magicLine.width());
    $("#example-one li a").hover(function() {
       $el = $(this);
       leftPos = $el.position().left;
       newWidth = $el.parent().width();
       $magicLine.stop().animate({
          left: leftPos,
          width: newWidth
       });
    }, function() {
       $magicLine.stop().animate({
          left: $magicLine.data("origLeft"),
          width: $magicLine.data("origWidth")
       });
    });

});


function nextPage(id){

	$('#hidGenreID').val(id);
	document.frm.submit();
}
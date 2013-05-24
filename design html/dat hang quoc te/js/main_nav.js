$(document).ready(function(){
	$('#nav-sub li').hover(function(){
		$(this).find('.nav-layer:first').css({visibility: 'visible', display: 'none'}).show(300);
	}, function() {
		$(this).find('.nav-layer:first').css({visibility:'hidden'});
	});

	
	$('.list-product ul li').find('.product_thumbnail').hide();
})

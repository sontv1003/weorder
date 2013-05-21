$(document).ready(function(){
	$('.fader').hover(function(){
		var image1= $("img",this).attr("src");
		var image2= $("img",this).attr("rel");
		$("img",this).attr("src",image2);
		$("img",this).attr("rel",image1);
	},function(){
		var image1= $("img",this).attr("src");
		var image2= $("img",this).attr("rel");
		$("img",this).attr("src",image2);
		$("img",this).attr("rel",image1);
	});

})
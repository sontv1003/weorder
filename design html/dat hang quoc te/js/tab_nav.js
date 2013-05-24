$(document).ready(function(){
	$('.tabbed_content:not(:first)').hide();
	$('.idTabs li').click(function(){
		$('.idTabs li').removeClass('selected');
		$(this).addClass('selected');
		$('.tabbed_content').hide();
		
		var activeTab = $("a",this).attr('href');
		$(activeTab).fadeIn();
		return false;
	});

	$('.tabbed_content2:not(:first)').hide();
	$('.idTabs2 li').click(function(){
		$('.idTabs2 li').removeClass('selected');
		$(this).addClass('selected');
		$('.tabbed_content2').hide();
		
		var activeTab = $("a",this).attr('href');
		$(activeTab).fadeIn();
		return false;
	});

})
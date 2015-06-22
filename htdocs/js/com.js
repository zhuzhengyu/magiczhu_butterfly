$(function(){
	$('.product-r ul li').hover(function(){
		$(this).children('.title').addClass('title-now');
	},function(){
		$(this).children('.title').removeClass('title-now');
	});
});

$(function(){
	$('.search input').focus(function(){
		$(this).parent().stop().animate({width:'160px'},500);
	}).blur(function(){
		$(this).parent().stop().animate({width:'120px'},500);
	});
});

$(function(){
	$('#menu a').hover(function(){
		$(this).addClass('bounceIn animated');
	},function(){
		$(this).removeClass('bounceIn animated');
	});
});


$(function(){
	$('.login a').hover(function(){
		$(this).addClass('flipInY animated');
	},function(){
		$(this).removeClass('flipInY animated');
	});
});

$(function(){
	$('.product-l-u li a').hover(function(){
		$(this).addClass('flipInX animated');
	},function(){
		$(this).removeClass('flipInX animated');
	});
});

$(function(){
	$('.side-nav ul li a.i-nav').click(function(){
		$('.side-nav ul li a').removeClass('on');
		$(this).addClass('on');
		if($(this).next("dl").is(':hidden')){
			$(this).next("dl").slideDown();
		}
		else{
			$(this).next("dl").slideUp();
		}
	});
});

$(function(){
	$('.select_pro').click(function(){	
		$('.select_pro').removeClass('select_on');
		if($(this).hasClass('select_on')){
			$(this).removeClass('select_on');
		}
		else{
			$(this).addClass('select_on');
		}
	});
});

$(function(){
	var WW = $('.recommend_pp_1').width();
	var Now = 0;
	var btn = 1;
	$('.recommend_page a').click(function(){
		var index = $(this).index();
		$('.recommend_page a').removeClass('recommend_page_on')
		$('.recommend_pp_con').stop().animate({'left': -WW*index+60},100);
		$(this).addClass('recommend_page_on');
		Now = index;
	});
	$('.pp_left').click(function(){
		var m = $('.recommend_page a').size();
		var left = parseInt($('.recommend_pp_con').css('left'));
		if (left < 60 && Now>=0 && btn == 1) {
			btn = 0;
			$('.recommend_pp_con').stop().animate({'left': left+WW},100);
			Now--;			
		};
		$('.recommend_page a').removeClass('recommend_page_on').eq(Now).addClass('recommend_page_on');
		setTimeout(function () { btn = 1; }, 400);		
	});
	$('.pp_right').click(function(){		
		var m = $('.recommend_page a').size();
		var left = parseInt($('.recommend_pp_con').css('left'));
		if (left > -WW*(m-1)+60 && Now <= m && btn == 1) {
			btn = 0;
			$('.recommend_pp_con').stop().animate({'left': left-WW},100);
			Now++;			
		}		
		$('.recommend_page a').removeClass('recommend_page_on').eq(Now).addClass('recommend_page_on');
		setTimeout(function () { btn = 1; }, 400);
	});
});



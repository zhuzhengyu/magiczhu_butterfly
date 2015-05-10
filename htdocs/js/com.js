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
	$('.foryou-con ul li img').hover(function(){
		$(this).addClass('flash animated');
	},function(){
		$(this).removeClass('flash animated');
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

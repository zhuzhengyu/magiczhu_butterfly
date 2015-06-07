 window.onload = function(){
            
        var oUl = $('.clothes_d_l ul');
        var oLiUl = $('.clothes_d_l ul li');

        var oOl = $('.clothes_d_l ol');
        var oLiOl = $('.clothes_d_l ol li');

        var iNow = 0;

        var timer = null;
        var oBox = $('.clothes_d_l');
        var oneW = $('.clothes_d_l ul li img').width();

        oLiOl.bind({
            mouseover : function(){
            	var im = $(this).index();
                oLiOl.removeClass();
                $(this).addClass("active");                
                iNow = im;
                iNow2 = im;
                //oLiUl.hide();
                oUl.stop().animate({left: -im*oneW},250,"linear");
            }           
        });

        timer = setInterval(toRun,2000);

            oBox.bind({
                mouseover : function(){
                    clearInterval(timer);
                },
                mouseleave : function(){
                    timer = setInterval(toRun,2000);
                }
            });

            function toRun(){
                if(iNow > oLiOl.size()-2){
                    iNow = -1;                                     
                }                
                iNow++;
                oLiOl.removeClass("active");
                oLiOl.eq(iNow).addClass("active");
                oUl.stop().animate({left: -iNow*oneW},250,"linear");
                //console.log(iNow , oLiOl.index()-1);
            }   
   
}

$(function(){
	$('.bag_pro').hover(function(){
		var _this = $(this);
		_this.find('ul').stop().animate({top : '-300px'},300);
		_this.find('.bag_info').addClass('bag_active');
		_this.find('span').addClass('bag_span');
	},function(){
		var _this = $(this);
		_this.find('ul').stop().animate({top : '0px'},300);
		_this.find('.bag_info').removeClass('bag_active');
		_this.find('span').removeClass('bag_span');
	});
});



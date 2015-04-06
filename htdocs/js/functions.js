$(document).ready(function(){
	// Activate the main slider	
	$("#mainSlider").jCarouselLite({
		btnNext: "#sliderBtnNext",
		btnPrev: "#sliderBtnPrev",
		visible: 1
	});
	
	
	// jQuery image change on hover
	$("ul#socialBW li a img, div#clientListContainer ul li p a img")
        .mouseover(function() { 
            var src = $(this).attr("src").match(/[^\.]+/) + "Over.png";
            $(this).attr("src", src);
        })
        .mouseout(function() {
            var src = $(this).attr("src").replace("Over", "");
            $(this).attr("src", src);
        });
});

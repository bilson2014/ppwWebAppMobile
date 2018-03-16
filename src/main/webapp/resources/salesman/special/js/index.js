$().ready(function() {
	
	var mySwiper = new Swiper('.first .swiper-container', {
		autoplay: true,//可选选项，自动滑动
	})

	var swiper = new Swiper('.hots .swiper-container', {
	    pagination: '.swiper-pagination',
	    slidesPerView: 'auto',
	    paginationClickable: true,
	    spaceBetween:0,
	});
});


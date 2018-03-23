$().ready(function() {
	new Swiper('#firstSwiper', {
		autoplay : 3000,
		speed:300,
	});

	new Swiper('#secondSwiper', {
		 pagination: '.swiper-pagination',
		 slidesPerView: 'auto',
		 paginationClickable: true,
		 spaceBetween:0,
	});
});


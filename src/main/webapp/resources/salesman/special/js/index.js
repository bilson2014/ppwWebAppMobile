$().ready(function() {
	
	var mySwiper = new Swiper('.first .swiper-container', {
		autoplay: true,//可选选项，自动滑动
	})
	
	/* var swiper = new Swiper('.hots .swiper-container', {
		 slidesPerView: 'auto',
	      spaceBetween: 30,
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
		  slidesPerView: 1,
	      centeredSlides: true,
	      spaceBetween: 30,
	      grabCursor: true,
	      
	    
	      
	      pagination: {
	        el: '.swiper-pagination',
	        clickable: true,
	      },
	    });*/
	
	
	 var swiper = new Swiper('.hots .swiper-container', {
	        pagination: '.swiper-pagination',
	        slidesPerView: 'auto',
	        paginationClickable: true,
	        spaceBetween:0,
	        
	        
	    });
});


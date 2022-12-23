/**
 * 
 */
 // 스크롤 전 좌표
let loading = false;
let lastScrollTop = 0;

$(window).scrollTop = 0;

$(window).scroll(function(){
	//스크롤 후 좌표
	let currentScrollTop = $(window).scrollTop();
	//다운 스크롤
	if(currentScrollTop + $(window).height() + 100 >=$(document).height()){
		surveyList();

		
	}
})
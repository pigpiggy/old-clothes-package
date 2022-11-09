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

function surveyList(){
	if(!loading){
		loading = true;
		
		let lastsno = $(".card:last").attr("data-sno");
		let keyword = $("#keyword").val();
	
		$.ajax({
			type: 'post',
			url: 'infiniteScrollDown',
			dataType: 'json',
			data: JSON.stringify({
				sno: lastsno,
				kwd: keyword
			}),
			contentType: "application/json",
			success: function(data){
				console.log(data);
				let str="";
				if(data!=""){
					$(data).each(
						function(){
							str += "<a href="+"'sharingView/"+this.sno+"'>"
							str	+= "<div class="+"'card'"+" data-sno='"+this.sno+"'>";
		          			str	+= "<div class="+"'card-image'"+">";
		          			if(this.sfileids!=null && this.sfileids !=""){
								str	+= "<img src="+"'upload/"+this.sfileids+"' alt="+"'무료나눔 옷'"+">";
							} else {
								str	+= "<img src="+"'upload/logo3.png'"+" alt="+"'로고'"+">";
							}
		          			str	+= "</div>";
		          			str	+= "<div class="+"'card-body'"+">";
		              		str	+= "<span class="+"'date'"+">"+this.regDate+"</span>";
		              		str	+= "<h2 class="+"'sharingTitle'"+">"+this.stitle+"</h2>";
		              		str	+= "<p class="+"'sharingContent'"+">"+this.scontent+"</p>";
		          			str	+= "</div>";
		          			if(this.addressCity !=null && this.addressCity !=""){
								str	+= "<div class="+"'card-footer'"+">";
								str	+= "["+this.sdealType+"] "+this.addressCity+" "+this.addressTown;
								str	+= "</div>";
							} else {
								str	+= "<div class="+"'card-footer'"+">";
								str	+= "["+this.sdealType+"]";
								str	+= "</div>";
							}
		          			str	+= "</div>";
		          			str	+= "</div>";
		          			str += "</a>";
						});
						console.log(str);
						$(".card-list").append(str);
						loading = false;
				}
			}
		});
	}
}

	




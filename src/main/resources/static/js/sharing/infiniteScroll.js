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
	
		$.ajax({
			type: 'post',
			url: 'infiniteScrollDown',
			dataType: 'json',
			data: JSON.stringify({
				sno: lastsno
			}),
			contentType: "application/json",
			success: function(data){
				console.log(data);
				let str="";
				if(data!=""){
					$(data).each(
						function(){
							str	+= "<div class="+"'card'"+" data-sno='"+this.sno+"'>";
		          			str	+=  "<div class="+"'card-image'"+">";
		              		str	+=  "<img src="+"'upload/"+this.sfileids+"' alt="+"'무료나눔 옷'"+">";
		          			str	+= "</div>";
		          			str	+= "<div class="+"'card-body'"+">";
		              		str	+= "<span class="+"'date'"+">"+this.regDate+"</span>";
		              		str	+= "<h2>"+this.stitle+"</h2>";
		              		str	+= "<p class="+"'sharingContent'"+">"+this.scontent+"</p>";
		          			str	+= "</div>";
		          			str	+= "<div class="+"'card-footer'"+">";
		              		str	+= this.addressCity+" "+this.addressTown;
		          			str	+= "</div>";
		          			str	+= "</div>";
		          			str	+= "</div>";
						});
						console.log(str);
						$(".card-list").append(str);
						loading = false;
				}
			}
		});
	}
}

	




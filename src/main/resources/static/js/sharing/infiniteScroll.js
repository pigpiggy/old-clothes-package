// 스크롤 전 좌표
let loading = false;
let lastScrollTop = 0;

$(window).scroll(function(){
	$(window).scrollTop = 0;
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
	/*else {
		if($(window).scrollTop()<=0){
			let firstsno=$(".card-list:first").attr("data-sno");
			
			$.ajax({
				type: 'post',
				url: 'infiniteScrollUp',
				dataType: 'json',
				data: JSON.stringify({
					sno: firstsno
				}),
				contentType: "application/json",
				success: function(data){
					console.log(data);
					let str="";
					if(data!=""){
						$(data).each(
							function(){
								str += "<div class="+"'card-list'"+">";
									+  "<div class="+"'card'"+" data-sno='"+this.sno+"'>";
			          				+  "<div class="+"'card-image'"+">";
			              			+  "<img src="+"'upload/"+this.sfileids+"' alt="+"'무료나눔 옷'"+">";
			          				+  "</div>";
			          				+  "<div class="+"'card-body'"+">";
			              			+  "<span class="+"'date'"+">"+this.regDate+"</span>";
			              			+  "<h2>"+this.stitle+"</h2>";
			              			+  "<p>"+this.scontent+"</p>";
			          				+  "</div>";
			          				+  "<div class="+"'card-footer'"+">";
			              			+  this.addressCity+" "+this.addressTown;
			          				+  "</div>";
			          				+  "</div>";
			          				+  "</div>";
							});
							$(".card-list").empty();
							$("#buttonAndSelect").after(str);
					}
					else {
						
					}
				}
			});
			
			var position =($(document).height() - $(window).height()) -10;
			$('html,body').stop().animate({scrollTop : position}, 600, easeEffect);
		}
	}*/
	




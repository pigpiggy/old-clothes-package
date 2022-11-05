const container = document.querySelector('.container')

//part1. get a batch of images and append to the container div
var loading = false;
var scrollPage = 1;

function loadImages(numImages = 10){
	if(!loading){
		loading = true;
		$.ajax({
			url: "${pageContext.servletContext.contextPath }/sharingList",
			type: "get",
			data: {"page":page},
			dataType:"html",
			success:function(res){
				$("")
			}
			
		})
	}
    let i = 0;
    while(i < numImages){
        const img = document.createElement('img')
        img.src = `${URL}${getRandNum()}`
        container.appendChild(img)
        i++
    }
}

loadImages()

//part2. listen for a scroll event and load more images if we reach the bottom of the window

window.addEventListener('scroll', () => {
    if(window.scrollY + window.innerHeight >= document.documentElement.scrollHeight) {
        loadImages()
    }
})
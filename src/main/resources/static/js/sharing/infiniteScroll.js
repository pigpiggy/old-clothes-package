const container = document.querySelector('.container')

//part1. get a batch of images and append to the container div
function getRandNum(){
    return Math.floor(Math.random() * 100)
}

function loadImages(numImages = 10){
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
let hamburger = document.getElementById('hamburgerBar');
let headerMenuBar = document.getElementsByClassName('headerMenuBar');
let headerMenuList = document.querySelectorAll('.headerMenuList');
let headerMenuSpan = document.querySelectorAll('.headerMenuList span');
let sideMenu = document.querySelectorAll('.sideMenu');

hamburger.onclick = function() {
  headerMenuBar[0].classList.toggle('toggle');
}

const body = document.querySelector("body");

function handleWindowSize() {
	const windowWidth = window.innerWidth;
	if(windowWidth < 768) {
		
	} else {
		for(let i=0;i<headerMenuList.length;i++){
		  headerMenuList[i].addEventListener('mouseover', function() {
		    this.querySelector('.sideMenu').classList.add('toggle');
		    this.querySelector('.sideMenu').addEventListener('mouseover', function() {
				this.classList.add('toggle');
			})
		  })
		
		  headerMenuList[i].addEventListener('mouseout', function() {
		    this.querySelector('.sideMenu').classList.remove('toggle');
		    this.querySelector('.sideMenu').addEventListener('mouseout', function() {
				this.classList.remove('toggle');
			})
		  })
		}
	}
}

const windowWidth = window.innerWidth;
if(windowWidth < 768) {
	
} else {
	for(let i=0;i<headerMenuList.length;i++){
	  headerMenuList[i].addEventListener('mouseover', function() {
	    this.querySelector('.sideMenu').classList.add('toggle');
	    this.querySelector('.sideMenu').addEventListener('mouseover', function() {
			this.classList.add('toggle');
		})
	  })
	
	  headerMenuList[i].addEventListener('mouseout', function() {
	    this.querySelector('.sideMenu').classList.remove('toggle');
	    this.querySelector('.sideMenu').addEventListener('mouseout', function() {
			this.classList.remove('toggle');
		})
	  })
	}
}

window.addEventListener("resize", handleWindowSize);


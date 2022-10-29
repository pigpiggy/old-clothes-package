let hamburger = document.getElementById('hamburgerBar');
let headerMenuBar = document.getElementsByClassName('headerMenuBar');
let hederMenuList = document.querySelectorAll('.hederMenuList');

hamburger.onclick = function() {
  headerMenuBar[0].classList.toggle('toggle');
}

const body = document.querySelector("body");

function handleWindowSize() {
	const windowWidth = window.innerWidth;
	if(windowWidth < 768) {
		for(let i=0;i<hederMenuList.length;i++){
		  hederMenuList[i].addEventListener('mouseover', function() {
		    this.querySelector('.sideMenu').classList.add('toggle');
		  })
		
		  hederMenuList[i].addEventListener('mouseout', function() {
		    this.querySelector('.sideMenu').classList.remove('toggle');
		  })
		}
	} else {
		for(let i=0;i<hederMenuList.length;i++){
		  hederMenuList[i].addEventListener('mouseover', function() {
		    this.querySelector('.sideMenu').classList.add('toggle');
		    this.querySelector('.sideMenu').addEventListener('mouseover', function() {
				this.classList.add('toggle');
			})
		  })
		
		  hederMenuList[i].addEventListener('mouseout', function() {
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
	for(let i=0;i<hederMenuList.length;i++){
	  hederMenuList[i].addEventListener('mouseover', function() {
	    this.querySelector('.sideMenu').classList.add('toggle');
	  })
	
	  hederMenuList[i].addEventListener('mouseout', function() {
	    this.querySelector('.sideMenu').classList.remove('toggle');
	  })
	}
} else {
	for(let i=0;i<hederMenuList.length;i++){
	  hederMenuList[i].addEventListener('mouseover', function() {
	    this.querySelector('.sideMenu').classList.add('toggle');
	    this.querySelector('.sideMenu').addEventListener('mouseover', function() {
			this.classList.add('toggle');
		})
	  })
	
	  hederMenuList[i].addEventListener('mouseout', function() {
	    this.querySelector('.sideMenu').classList.remove('toggle');
	    this.querySelector('.sideMenu').addEventListener('mouseout', function() {
			this.classList.remove('toggle');
		})
	  })
	}
}

window.addEventListener("resize", handleWindowSize);


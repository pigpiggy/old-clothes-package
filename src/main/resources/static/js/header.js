let hamburger = document.getElementById('hamburgerBar');
let headerMenuBar = document.getElementsByClassName('headerMenuBar');
let hederMenuList = document.querySelectorAll('.hederMenuList');

hamburger.onclick = function() {
  headerMenuBar[0].classList.toggle('toggle');
}

for(let i=0;i<hederMenuList.length;i++){
  hederMenuList[i].addEventListener('mouseover', function() {
    this.querySelector('.sideMenu').classList.add('toggle');
  })

  hederMenuList[i].addEventListener('mouseout', function() {
    this.querySelector('.sideMenu').classList.remove('toggle');
  })
}
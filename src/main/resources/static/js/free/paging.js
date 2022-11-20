$('ul.pagination').on('click', 'a', function() { // listen for click on pagination link
  if($(this).hasClass('active')) return false;

  var active_elm = $('ul.pagination a.active');

  if(this.id == 'next'){

  }
  else if(this.id == 'prev') {
    
  } else {
    $(this).addClass('active');
  }
  active_elm.removeClass('active');

});
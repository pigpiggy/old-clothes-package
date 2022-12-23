$('ul.pagination').on('click', 'a', function() { // listen for click on pagination link
  if($(this).hasClass('active')) return false;

  var active_elm = $('ul.pagination a.active');

  if(this.id == 'next'){
    var _next = active_elm.parent().next().children('a');
    if($(_next).attr('id') == 'next') {
      this.removeClass('active');  
      active_elm.addClass('active');

      return; 
    }
    
  }
  else if(this.id == 'prev') {
	var _prev = active_elm.parent().prev().children('a');
    if($(_prev).attr('id') == 'prev') {
		this.removeClass('active');
    	active_elm.addClass('active');
    };
  } else {
    $(this).addClass('active');
  }
  active_elm.removeClass('active');

});
jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript");} 
});

  
jQuery(document).ready(function() {
  // Zebra table
  $('table.zebra tr.row').hover(function() {
    $(this).addClass('hover');
  }, function() {
    $(this).removeClass('hover');
  });
  $('table.zebra tr.row').click(function() {
    window.location.href = $('a', this).attr('href');
  });
  $('table.zebra').each(function() {
    $(this).find('tr:last').addClass("last");
  });
  
  $('.datepicker').datepicker($.datepicker.regional['pl']);
  
  $('.profiles_controller .search input').keyup(function() {
    if ($(this).val() != "") {
      $('.search .indicator').show();
      $.get('/profiles', { "search[name_like]": $(this).val() }, null, "script");
    } else {
      $('#profiles_container .search_results').html("");
      $('.search .indicator').hide();
      $('#profiles_container table').show();
    }
  });
});
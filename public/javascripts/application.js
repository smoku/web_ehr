jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript");} 
});

  
jQuery(document).ready(function() {
  // Loader
  $('#loader').ajaxStart(function() {
    $(this).show();
  });
  
  $('#loader').ajaxComplete(function() {
    $(this).fadeOut();
  });

  $('#loader').ajaxSuccess(function() {
    $(this).fadeOut();
  });
  
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
});
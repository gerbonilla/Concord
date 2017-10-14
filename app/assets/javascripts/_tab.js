$(document).ready(function() {
  $('.toggle-btn').click(function(event) {
    event.preventDefault();
    console.log("clicked")
    $('.toggle-btn').removeClass('active');
    $(this).addClass('active');
    if ($(this)[0].id == "percentage-btn") {
      $('.cas-value').addClass('hidden');
      $('.cas-percentage').removeClass('hidden');
    }
    if ($(this)[0].id == "value-btn") {
      $('.cas-percentage').addClass('hidden');
      $('.cas-value').removeClass('hidden');
    }
  });
});

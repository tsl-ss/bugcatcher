var $signup = $('#signup-tab');
var $signin = $('#signin-tab');

$(document).ready(function() {
  $('.tab').click(function() {
    if(!$(this).hasClass('active')) {
      $('#signup-tab').toggleClass('active')
      $('#signup-form').toggle()
      $('#signin-tab').toggleClass('active')
      $('#signin-form').toggle()
    }
  });
});

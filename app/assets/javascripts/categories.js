$(document).on('turbolinks:load', function() {
  $('.albulm-wrap').hover(
    function() {
      $(this).find('.albulm-title-wrap').toggleClass('non-visibility');
      $(this).find('img').toggleClass('light-visibility');
    }
  );
});

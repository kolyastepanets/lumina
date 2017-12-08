$(document).on('turbolinks:load', function() {
  $('.albulm-wrap').hover(
    function() {
      $(this).find('.albulm-title-wrap').toggleClass('non-visibility');
      $(this).find('img').toggleClass('light-visibility');
    }
  );

  var $grid = $('.grid').isotope({
    itemSelector: '.grid-item',
    layoutMode: 'fitRows'
  });

  $('[data-show]').on( 'click', function(e) {
    e.preventDefault();
    var filterValue = $(this).attr('data-show');
    $grid.isotope({ filter: '.' + filterValue });
  });
});

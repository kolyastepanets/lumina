$(document).ready(function() {
  $('.albulm-wrap a').hover(
    function() {
      $(this).find('.albulm-title-wrap').toggleClass('non-visibility');
      $(this).find('img').toggleClass('light-visibility');
    }
  );

  var $grid = $('.grid').imagesLoaded( function() {
    $grid.isotope({
      itemSelector: '.grid-item',
      layoutMode: 'fitRows'
    });
  });

  $('[data-show]').on( 'click', function(e) {
    e.preventDefault();
    var filterValue = $(this).attr('data-show');
    $grid.isotope({ filter: '.' + filterValue });
  });

  $('.albulm-title-wrap').addClass('non-visibility');
  $('img').removeClass('light-visibility');
});

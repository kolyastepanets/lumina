$(document).on('turbolinks:load', function() {
  $('[data-link-articles-date]').on( 'click', function(e) {
    e.preventDefault();
    var id = $(this).attr('data-link-articles-date');
    $('[data-articles-date]').addClass('hidden');
    var elem = $('[data-articles-date=' + id + ']');
    elem.removeClass('hidden');
    $('html, body').animate({
      scrollTop: elem.offset().top
    }, 2000);

    $('[data-link-articles-date]').removeClass('active-link');
    $(this).addClass('active-link');
  });

  $('.carousel-articles').slick({
    infinite: true,
    slidesToShow: 3,
    slidesToScroll: 3
  });
});

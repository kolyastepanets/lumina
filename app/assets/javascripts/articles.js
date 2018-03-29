$(document).ready(function() {
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
    slidesToScroll: 3,
    responsive: [
      {
        breakpoint: 800,
        settings: {
          slidesToShow: 2,
          slidesToScroll: 2
        }
      },
      {
        breakpoint: 480,
        settings: {
          slidesToShow: 1,
          slidesToScroll: 1
        }
      }
    ]
  });

  $('.ssb-icon.ssb-twitter').addClass('fa fa-twitter fa-1x');
  $('.ssb-icon.ssb-facebook').addClass('fa fa-facebook fa-1x');
  $('.ssb-icon.ssb-linkedin').addClass('fa fa-linkedin fa-1x');
  $('.ssb-icon.ssb-telegram').addClass('fa fa-telegram fa-1x');
  $('.ssb-icon.ssb-google_plus').addClass('fa fa-google-plus fa-1x');
});

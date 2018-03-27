$(document).on('turbolinks:load', function() {
  $(window).scroll(function(){
    if ($(this).scrollTop() > 100) {
      $('.topbutton').fadeIn();
    } else {
      $('.topbutton').fadeOut();
    }

    if ($(this).scrollTop() >= 250) {
      $('.main-navigation').addClass('fixed-header');
    }
    else {
      $('.main-navigation').removeClass('fixed-header');
    }
  });

  $('.topbutton').click(function(){
    $('html, body').animate({ scrollTop : 0 }, 800);
    return false;
  });

  $('.carousel-photos').slick({
    autoplay: true,
    slidesToShow: 1,
    slidesToScroll: 1,
    infinite: true,
    speed: 500,
    fade: true,
    cssEase: 'linear'
  });
});

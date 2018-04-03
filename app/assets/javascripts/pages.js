$(document).ready(function() {
  var isMobile = window.matchMedia("only screen and (max-width: 767px)");
  var isSmallDesktop = window.matchMedia("(min-width: 768px) and (max-width: 1199px)");

  if (isSmallDesktop.matches) {
    $('footer.site-footer').children('.footer-image-instagram').slice(-2).addClass("hidden")
  } else {
    $('footer.site-footer').children('.footer-image-instagram').slice(-2).removeClass("hidden")    
  }

  if (!isMobile.matches) {
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
  } else {
    $('footer.site-footer').children('.footer-image-instagram').slice(-3).addClass("hidden")
  }

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

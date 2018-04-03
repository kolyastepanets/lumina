$(document).ready(function() {
  var isMobile = window.matchMedia("only screen and (max-width: 767px)");
  var isSmallDesktop = window.matchMedia("(min-width: 768px) and (max-width: 1199px)");

  hideLastImages = function(number) {
    $('footer.site-footer').children('.footer-image-instagram').slice(number).addClass("hidden")
  }

  showLastImages = function(number) {
    $('footer.site-footer').children('.footer-image-instagram').slice(number).removeClass("hidden")
  }

  scrollToTop = function() {
    $('.topbutton').click(function(){
      $('html, body').animate({ scrollTop : 0 }, 800);
      return false;
    });
  }

  if (isSmallDesktop.matches) {
    hideLastImages(-2)
  } else {
    showLastImages(-2)
  }

  if (isMobile.matches) {
    hideLastImages(-3)
  } else {
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

    scrollToTop();
  }

  $loading = $('.loading');
  $loading.removeClass('hidden');
  var $slider = $('.carousel-photos').imagesLoaded( function() {
    $slider.slick({
      autoplay: true,
      slidesToShow: 1,
      slidesToScroll: 1,
      infinite: true,
      speed: 500,
      fade: true,
      lazyLoad: 'progressive',
      cssEase: 'linear'
    });
    $loading.addClass('hidden');
    $slider.removeClass('hidden');
  });
});

$(function() {
    $('.slider').slick({
        prevArrow:'.slick-prev',
        nextArrow:'.slick-next',
        dots: true,
        autoplay: true,
        autoplaySpeed: 2500,
        speed: 700,
        draggable: true,
        arrows: true,
        initialSlide: 3,
        infinite: true,
        
    });
    $('.slick-dots li').on('mouseover', function() {
      $('.slider').slick('goTo', $(this).index());
      
    });
  });
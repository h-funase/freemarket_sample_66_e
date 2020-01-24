$(function(){
  $('.small_photo').mouseover(function(){
    var selectedSrc = $(this).attr('src');
    $('.photos').html(`<img src="${selectedSrc}" width="300px" height="300px">`)
  });
});
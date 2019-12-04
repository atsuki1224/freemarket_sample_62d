$(function() {

  $(".header__form").change(function(){

  window.location.href = '/products/new';

  var aa = $('#search_field').val();

  var aaa = '#name[' + aa +']'

  var name = '/products/search?name='
  var url = name + aa

  $('#search_link').attr('href',url);
  var ccc = $('#search_link').attr('href');

  $('#search_link')[0].click();

  })

  $(".header__form" ).on("submit", function(e){
  	return false;
    $( ".header__form" ).keypress( function ( e ) {
    if ( e.which == 13 ) {

      window.location.href = '/products/new';
      var aa = $('#search_field').val();
      var aaa = '#name[' + aa +']'
      var name = '/products/search?name='
      var url = name + aa

      $('#search_link').attr('href',url);
      var ccc = $('#search_link').attr('href');
      $('#search_link')[0].click();
      }
    })
  });
  $('.header__form i').click(function(){
    $('#search_link')[0].click();
  })
});

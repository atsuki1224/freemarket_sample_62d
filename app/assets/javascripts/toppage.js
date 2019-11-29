$(function() {
  $(".header__form").submit(function(){
      console.log('lololo');
      window.location.href = 'localhost:3000/products/new';
  });
});

$(function(){
  $('.noti-todo__select > li').on('click',function(e){
    e.preventDefault();
    var index = $('.noti-todo__select > li').index(this);
    $('.noti-todo__select > li').removeClass('active');
    $('.noti-todo__content > ul').removeClass('active'); 
    $('.noti-todo__content > ul').eq(index).addClass('active'); 
    $(this).addClass('active');
  });

  $('.transaction__select > li').on('click',function(e){
    e.preventDefault();
    var index = $('.transaction__select > li').index(this);
    $('.transaction__select  > li').removeClass('active');
    $('.transaction__content > ul').removeClass('active');
    $('.transaction__content > ul').eq(index).addClass('active'); 
    $(this).addClass('active');
  });
});
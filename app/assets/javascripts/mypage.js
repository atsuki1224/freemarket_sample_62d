$(function(){
  $('.mypage__noti-todo__select > li').on('click',function(e){
    e.preventDefault();
    var index = $('.mypage__noti-todo__select > li').index(this);
    $('.mypage__noti-todo__select > li').removeClass('active');
    $('.mypage__noti-todo__content > ul').removeClass('active'); 
    console.log($(this));
    $('.mypage__noti-todo__content > ul').eq(index).addClass('active'); 
    $(this).addClass('active');
  });

  $('.mypage__container__select > li').on('click',function(e){
    e.preventDefault();
    var index = $('.mypage__container__select > li').index(this);
    $('.mypage__container__select  > li').removeClass('active');
    $('.mypage__container__content > ul').removeClass('active'); 
    console.log($(this));
    $('.mypage__container__content > ul').eq(index).addClass('active'); 
    $(this).addClass('active');
  });
});
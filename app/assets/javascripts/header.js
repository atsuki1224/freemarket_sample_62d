$(function() {
  $('.header-category').hover(function(){
    $('.category-box').show();
  },
    function(){
      $('.category-box').hide();
    });

  $('.header-brand').hover(function(){
    $('.brand-box').show();
  },
    function(){
      $('.brand-box').hide();
    });

  $('#header-news').hover(function(){
    $('.news-box').show();
  },
    function(){
      $('.news-box').hide();
    });

  $('#header-todo').hover(function(){
    $('.todo-box').show();
  },
    function(){
      $('.todo-box').hide();
    });
    $(".img").hover(function(){
        let ImgSrc = $(this).attr("src");
        $(".main-image").attr({src:ImgSrc});
        $(".main-image").hide();
        $(".main-image").fadeIn("slow");
        return false;
    });
});

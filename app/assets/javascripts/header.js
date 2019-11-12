$(function() {

  $('.header_categories').hover(function(){
      $('.category_box').show();
  },
      function(){
        $('.category_box').hide();
      }

  );



  $('.header_brands').hover(function(){
    $('.brand_box').show();
  },
    function(){
      $('.brand_box').hide();
    }

  );

  $('.header_news').hover(function(){
    $('.news_box').show();
  },
    function(){
      $('.news_box').hide();
    }

  );

  $('.header_todo').hover(function(){
    $('.todo_box').show();
  },
    function(){
      $('.todo_box').hide();
    }

  );

});
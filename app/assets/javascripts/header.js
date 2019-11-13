$(function() {

  $('#category').hover(function(){
      $('.category-box').show();
  },
      function(){
        $('.category-box').hide();
      }
  );

  $('#brand').hover(function(){
    $('.brand-box').show();
  },
    function(){
      $('.brand-box').hide();
    }

  );

  $('#news').hover(function(){
    $('.news-box').show();
  },
    function(){
      $('.news-box').hide();
    }
  );

  $('#todo').hover(function(){
    $('.todo-box').show();
  },
    function(){
      $('.todo-box').hide();
    }
  );
});
$(function() {

  $('.header_categories').hover(function(){
      $('.top_category_list_btn').show();
  },
      function(){
        $('.top_category_list_btn').hide();
      }

  );



  $('.header_brands').hover(function(){
    $('.top_brand_list_btn').show();
  },
    function(){
      $('.top_brand_list_btn').hide();
    }

  );

  $('.header_news').hover(function(){
    $('.top_news').show();
  },
    function(){
      $('.top_news').hide();
    }

  );

  $('.header_to_do_list').hover(function(){
    $('.top_to_do_list').show();
  },
    function(){
      $('.top_to_do_list').hide();
    }

  );

});
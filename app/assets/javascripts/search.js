$(function(){
///////並べ替え////////// change -> submit ////////////
  $('#sort_search').change(function(){
  });

////// カテゴリー //////////P  change///////////////////
  $('#parent_category_id').change(function(){

    var url = $(this).attr('action')
    var val = $(this).val();
    var form = $('.form_box2')
    var form2 = $('.form_box3')
    form.remove();
    form2.remove();

    $(this).attr('name','category_id');
    $('.form_box2').attr('name','')

    $.ajax({
          type:'GET',
          url:url,
          data:{category_id:val},
          dataType:'json',
    })

    .done(function(children){

      var val = children[0];
      var val2 = $('#category_hidden_form').val()

      $('#parent_category_id').after('<select name="", class="form_box2",id="category_child_id"></select>');
      $('.form_box2').append($('<option>').html('すべて').val(''));

      children.forEach(function(child){
        $('.form_box2').append($('<option>').html(child.name).val(child.id));
      });
      var val2 = $('#parent_category_id').val()
    });
  });
////// カテゴリー //////////C  change/////////////////////
  $(document).on('change','.form_box2',function(){

    var url = $(this).attr('action')
    var val = $(this).val();
    var form = $('.form_box3')
    form.remove();

    $('#parent_category_id').attr('name','');
    $(this).attr('name','category_id')
    $.ajax({
          type:'GET',
          url:url,
          data:{child_id:val},
          dataType:'json',
    })
    .done(function(grand_children){
      $('.form_box2').after('<div class="form_box3",id="category_name_3",name="category_id"></div>');

      grand_children.forEach(function(g){
        if(g.grandchild_id >=0 || g.grandchild_id <9999){
        $('.form_box3').append(`<input type="checkbox" name="category_id_eq_any[]" value=${g.grandchild_id} id="category_name_3"><label for="category_ids[]">${g.grandchild_name}</label> `);
      }});
    });
    if(val==''){
        $(this).attr('name','')

    }
  });
//////// PRICE ////////// change////////////////////////
  $(document).on('change','#price_form',function(){

      var val = $(this).val();
      var min_val = val.match( /(.*)(?=~)/);
      var min_val = min_val[0]
      var max_val = val.match( /(?<=~)(.*)/);
      var max_val = max_val[0]

      $('#price_min').val(min_val);
      $('#price_max').val(max_val);
  });

////////////サイズ用/////////////////////////////////////////
  $(document).on('change','#size_form',function(){
    $('.size_check').css('display','none');
    $('.sizeform label').css('display','none');
    $('.size_check').css('display','inline-block');
    $('.sizeform label').css('display','inline-block');
    $('.size_check').prop('checked',false);
  });

//////チェックボックス、フォーム値 クリア//////////////////////////////////////
  $(window).on('load', function() {
      $('.item_condition_check').prop('checked',false);
      $('.delivery_charge_check').prop('checked',false);
      $('.trade_stastus_check').prop('checked',false);
      $('#size_eq_all_').prop('checked',false);
      $('.size_check').prop('checked',false);
      $('#category_hidden_form').val('');

  });
///////ソート用/////////////////////////////////////
    $('#sort_search').change(function(){

      var val = $('#sort_search').val();
      $('.sort_link_box').val(val);

      var val =  $('.sort_link_box').val();
      $('.sort_link_btn').click();
    })

///////////  ブランド   /////////// /////////////////////////////
  $('#search_bland_field').change(function(){

    var url = $(this).attr('action')
    var val = $(this).val();

    $.ajax({
          type:'GET',
          url:url,
          data:{bland_name:val},
          dataType:'json',
    })
    .done(function(blands){

        var array_of_bland_id = []
        blands.forEach(function(b){
        $('#bland_hidden_form').after(`<input type="text" name="bland_id_eq_any[]" id="bland_hidden_form" value="${b.bland_id }">`);
        })
        var val = $('#bland_hidden_form').val();
        })

  });

////////  サブミット   ///////////////////////////////////////
  $(document).on('submit','#search_product',function(){

    var val = $(".form_box3 input[type='checkbox']:checked").val();
    var val2 = $('.form_box2').val();
    var val3 = $('#parent_category_id').val();

    if(val==='' && val2===''){
    }else{
      var a = $('#size_form').val('');
    }
      var i = $('#category_hidden_form').val();

  });


///////////////////////クリア//////////////////////////////////
  $('.search_box__btn--clear').click(function(){
    $('.form_box').val('');
    $('.form_box_half').val('');
    $('.form_box2').remove();
    $('.form_box3').remove();
    $('.size_check').css('display','none');
    $('.sizeform label').css('display','none');
    $('.search_box__form input').prop('checked',false);

  })

})

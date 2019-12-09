$(function(){
  $preview = $(".product-item__img--preview");
  $previewul = $(".product-item__img--preview ul");
  $droparea = $(".product-item__img--area");

  function filepreview(loadedImageUri){
    var html =`
          <li class="have-img-box">
            <img src=${loadedImageUri}>
            <div class="preview-list">
              <div class="preview-list__btn" >編集</div>
              <div class="preview-list__btn">
                <a class="remove-btn">削除</a>
              </div>
            </div>
          </li>`

          return html
  };

  $(document).on("change", '.imagearea', function(e) {
    var file = e.target.files[0],
        reader = new FileReader();
    if(file.type.indexOf("image") < 0){
      return false;
    }
    reader.onload = (function(file) {
      return function(e) {
        var wd =$droparea.width();
        if ($(".have-img-box").length == 4){
          $droparea.width(620);
        } else {
          $droparea.width(wd - 130);
        }
        var html = filepreview(e.target.result);
        $previewul.append(html);
        $('.imagearea:last').appendTo($previewul);
        if ($(".have-img-box").length <= 9) {
          return false;
        } else {
          if ($(".have-img-box").length == 10) {
            $droparea.css('display', 'none');
          }
        }
      };
    })(file);
    reader.readAsDataURL(file);
  })

  $(document).on("click", '.remove-btn', function() {
    var target = Number($('.remove-btn').index(this)+$('.remove-btn__edit').length);
    $('.have-img-box').eq(target).remove();
    $('.product-item__img--preview ul input').eq(target).appendTo($droparea);
    $('.imagearea:last').val('');
    var wd =$droparea.width();
    if ($(".have-img-box").length == 9) {
      $droparea.css('display', 'inline-block').width(100);
    } else if ($(".have-img-box").length == 4){
      $droparea.width(100);
    } else if ($(".have-img-box").length == 5) {
      $droparea.removeClass("row2");
      $droparea.width(wd + 130);
    } else {
      $droparea.width(wd + 130);
    }
  })

  $('.product-item__subform--price').on('keyup',function() {
    var price = Number($('.product-item__subform--price').val());
    var fee = Math.round(price * 0.1);
    var profit = price - fee;
    $('.fee').text("¥"+fee.toLocaleString());
    $('.profit').text("¥" + profit.toLocaleString())
  })

  $('.product-item__form--title').click(function(){

    var image = $('.imagearea').val();
    if (image===''){

      $('.product-item__img--area').css('border','solid 2px orange');
      $(window).scrollTop(200);
      $('.product-item__img--area').after(`<div class="notice_form"><p> 画像を選択してください</p></div>`);
      //   setTimeout(funtion(){
      //     $('.notice_form').remove();
      //       $('.product-item__img--area').css('border','');
      // }1000);
    alert('画像を選択してください');
        $('.product-item__img--area').change(function(){
          $('.product-item__img--area').css('border','');
          $('.notice_form').remove();
        });
    }
  })
  var init_wd = $droparea.width();
  var init_imgs = ($(".product-item__img--preview ul li").length);
  if(init_imgs == 10){
    $droparea.css('display', 'none');
  } else if(init_imgs == 5){
    $droparea.width();
  } else if (init_imgs < 5){
    $droparea.width(init_wd - (130 * init_imgs));
  } else if (init_imgs < 9) {
    $droparea.width(init_wd - (130 * (init_imgs - 5) ));
  }

  $(document).on("click", '.remove-btn__edit', function() {
    var target = Number($('.remove-btn__edit').index(this));
    if($("#del_img").val() == ""){
      var del_num = [];
    } else {
     var del_num = $("#del_img").val().split(',');
    }
    del_num.push($(this).data('img'));
    $("#del_img").val(del_num);
    $('.have-img-box').eq(target).remove();
    $('.imagearea:last').val('');
    var wd =$droparea.width();
    if ($(".have-img-box").length == 9) {
      $droparea.css('display', 'inline-block').width(100);
    } else if ($(".have-img-box").length == 4){
      $droparea.width(100);
    } else if ($(".have-img-box").length == 5){
      $droparea.removeClass("row2");
      $droparea.width(wd + 130);
    } else {
      $droparea.width(wd + 130);
    }
  })


//////////カテゴリ用//////↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓///////////////////////////////////////

///////////////カテゴリ追加/////////////////////////

  $(document).on('change','#category_box',function(){
    var val = $('#category_box option:selected').val();
    var form  =  $('.product-item__subform--select2');
    var form2 =  $('.product-item__subform--select3');
    var form3 =  $('.product-item__subform--title4');
    var form4 =  $('.product-item__subform--title5');
    var form5 =  $('.product-item__subform1 > input');
    var url = $(this).attr('action')


    form.remove();
    form2.remove();
    form3.remove();
    form4.remove();
    form5.remove();

    $.ajax({
          type:'GET',
          url:url,
          data:{category_id:val},
          dataType:'json'
    })

    .done(function(children){

      $('#category_box').after('<select class="product-item__subform--select2",id="box_2",{},name="product[category_id]"></select>');
      $('.product-item__subform--select2').append($('<option>').html('-----').val(''));

      children.forEach(function(child){
        $('.product-item__subform--select2').append($('<option>').html(child.name).val(child.id));
      });
    })
  })

//////////////カテゴリ保存/////////////////////

  $(document).on('change','.product-item__subform--select2',function(){
    var url = $(this).attr('action');
    var val = $('.product-item__subform--select2 option:selected').val();

    $.ajax({
          type:'GET',
          url:url,
          data:{child_id:val},
          dataType:'json'
    })

    .done(function(grand_children){

      $('.product-item__subform--select3').remove();
      $('.product-item__subform--select2').after('<select class="product-item__subform--select3",id="box_2",{},name="product[category_id]"></select>');
      $('.product-item__subform--select3').append($('<option>').html('-----').val(''));
      grand_children.forEach(function(grandchild){
      $('.product-item__subform--select3').append($('<option>').html(grandchild.grandchild_name).val(grandchild.grandchild_id));
      })
      })
  });
/////////////サイズ、ブランド表示用条件////////////↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓
  $(document).on('change','.product-item__subform--select3',function(){

    var val = $('#category_box').val();
    var val2 = $('.product-item__subform--select2').val();
    var val3 = $('.product-item__subform--select3 option:selected').val();

    $('.product-item__subform--title4').remove();
    $('.product-item__subform--title5').remove();
    if (val==1 ||val==2 ||val==3 ||val==0){
      $(this).after(`<div class="product-item__subform--title4">
                        サイズ
                        <div class="form-required">
                          必須
                        </div>
                        <select class="product-item__subform--select4",id="size_box",{}>
                          <option value="">-----</option>
                          <option value="XXS以下">XXS以下</option>
                          <option value="XS(SS)">XS(SS)</option>
                          <option value="S">S</option>
                          <option value="M">M</option>
                          <option value="L">L</option>
                          <option value="XL(LL)">XL(LL)</option>
                          <option value="2XL(3L)">2XL(3L)</option>
                          <option value="3XL(4L)">3XL(4L)</option>
                          <option value="4XL(5L)以上">4XL(5L)以上</option>
                          <option value="FREESIZE">FREESIZE</option>
                        </select>
                      </div>`);
    };
    if (val==1 ||val==2 ||val==3||val==4 ||val==7 ||val==9||val==12||val2==104){
      $(this).after('<div class="product-item__subform--title5">ブランド<div class="form-required--gray">任意</div><input type="text" name="bland_form",class="product-item__subform--select5",id="bland_box",{}></div>');
    }


  });

/////////////ブランド用////////////↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓//////////////

  $(document).on('change','.product-item__subform--title5',function(){

    var val = $('.product-item__subform--title5 > input').val();
    var val2 = $('#category_box option:selected').val();
    var val3 = $('.product-item__subform--select2 option:selected').val();
    var url = $(this).attr('action');

    $.ajax({
          type:'GET',
          url:url,
          data:{bland_name:val,category_id:val2,child_id:val3},
          dataType:'json'
    })
    .done(function(blands){

      blands.forEach(function(bland){
    })
     var bland = blands.shift();
     $('.bland_num').val(bland.bland_id);
    });
  });
  /////////////    サイズ   //////////////////////////
  $(document).on('change','.product-item__subform--select4',function(){
    var val = $('.product-item__subform--select4 option:selected').val();
    $('.size_form').val(val);
  });

  /////////////  配送チャージ、方法   ////////////////////////////

  $(document).on('change','.product-item__subform--select6',function(){
      $('.product-item__subform--title7').remove();
      var val = $('.product-item__subform--select6 option:selected').val();
      if(val === '送料込み'){
        $(this).after(`<div class="product-item__subform--title7",id="d_list">
                        配送の方法
                        <div class="form-required">
                          必須
                        </div >
                        <select class="product-item__subform--select7",id="charge_box",{}>
                          <option value="">-----</option>
                          <option value="未定">未定</option>
                          <option value="らくらくメルカリ便">らくらくメルカリ便</option>
                          <option value="ゆうメール">ゆうメール</option>
                          <option value="レターパック">レターパック</option>
                          <option value="普通郵便(定型、定形外)">普通郵便(定形、定形外)</option>
                          <option value="クロネコヤマト">クロネコヤマト</option>
                          <option value="クリックポスト">クリックポスト</option>
                          <option value="ゆうパック">ゆうパック</option>
                          <option value="ゆうパケット">ゆうパケット</option>
                        </select>
                      </div>`)
      }else{
        $(this).after('<div class="product-item__subform--title7",id="d_list">配送の方法<div class="form-required">必須</div><select class="product-item__subform--select7",id="charge_box",{}><option value="">-----</option><option value="未定">未定</option><option value="クロネコヤマト">クロネコヤマト</option><option value="ゆうパック">ゆうパック</option><option value="ゆうメール">ゆうメール</option></select></div>');
      }
  });

 ////////// 配送 値の設定///////////
  $(document).on('change','.product-item__subform--select7',function(){
    var val = $('.product-item__subform--select7 option:selected').val();
    $('.delivery_method').val(val);
    val =  $('.delivery_method').val();
  });

  /////////////////サブミット//////////////////////////////////

   $(document).on('submit','#new_product',function(){
     var val3 = $('.product-item__subform--select3').val();
     var val2 = $('.product-item__subform--select2').val();
     var new_product_id = $('.new_product_id').text()
     $('.product-item__subform--select0 option:selected').val(val3);
       if(val3 ===''){
           $('.product-item__subform--select0 option:selected').val(val2);
       }
       var a = $('.product-item__subform--select0 option:selected').val();
       var a =  $('.product-item__subform--select0 option:selected').val();
     $('body').append(`<div class="modal-content">
                         <div class="tittle">
                           <div class="text">
                             <P>出品が完了しました</P>
                           </div>
                         </div>
                         <div class="textarea">
                           <div class="text">
                             <p>あなたが出品した商品は「出品した商品一覧」からいつでも見ることができます。
                             </p>
                           </div>
                           <div class="link1">
                             <a href='/products/new'>続けて出品する</a>
                           </div>
                           <div class="link2">
                             <a href='/products/${new_product_id}'>商品ページへ行ってシェアする</a>
                           </div>
                         </div>
                       </div>`);
     $('.modal-content').fadeIn('slow');
     $('body').append('<div class="modal-overlay"></div>');
     $('.modal-overlay').fadeIn('slow');

   });
})

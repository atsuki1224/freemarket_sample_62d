$(function(){
  $preview = $(".product-item__img--preview");
  $previewul = $(".product-item__img--preview ul");
  $droparea = $(".product-item__img--area");

  function filepreview(loadedImageUri){
    var target = Number($("ul .imagearea").length) + 1;
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
        if ($("ul .imagearea").length == 4){
          $droparea.width(620);
        } else if ($("ul .imagearea").length == 5) {
          $droparea.addClass("row2").width(490);
        } else {
          $droparea.width(wd - 130);
        }
        var html = filepreview(e.target.result); 
        $previewul.append(html);
        if ($("ul .imagearea").length >= 10) {
          return false;
        } else {
          $('.imagearea:last').appendTo($previewul);
          if ($("ul .imagearea").length == 10) {
            $droparea.css('display', 'none');
          }
        }
      };
    })(file);
    reader.readAsDataURL(file);
  })

  $(document).on("click", '.remove-btn', function() {
    var target = Number($('.remove-btn').index(this));
    $('.have-img-box').eq(target-1).remove();
    $('.product-item__img--preview ul input').eq(target).appendTo($droparea);
    $('.imagearea:last').val('');
    var wd =$droparea.width();
    if ($("ul .imagearea").length == 9) {
      $droparea.css('display', 'inline-block').width(120);
    } else if ($("ul .imagearea").length == 4){
      $droparea.width(100);
    } else if ($("ul .imagearea").length == 5) {
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
})
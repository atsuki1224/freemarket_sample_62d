$(function(){

  window.onload = function(e) {
    console.log("hello")
    // var file = e.target.files[0],
        var file = $(".have_image_box").image,
        reader = new FileReader();
        console.log(file)
    if(file < 0){
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
    // reader.readAsDataURL(file);
  }
/////////////////edit サブミット//////////////////////////////////

  $(document).on('submit','.edit_product',function(){
    var val3 = $('.product-item__subform--select3').val();
    var val2 = $('.product-item__subform--select2').val();
    $('.product-item__subform--select0 option:selected').val(val3);
        if(val3 ===''){
            $('.product-item__subform--select0 option:selected').val(val2);
        }
        var a = $('.product-item__subform--select0 option:selected').val();
        var a =  $('.product-item__subform--select0 option:selected').val();
  })
})
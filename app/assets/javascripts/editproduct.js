$(function(){
  // window.onload = function(e) {
  //   // var file = e.target.files[0],
  //     var file = $(".imagearea").image,
  //     reader = new FileReader();
  //     var wd =$droparea.width();
  //     if ($("ul .imagearea").length == 4){
  //       $droparea.width(620);
  //     } else if ($("ul .imagearea").length == 1) {
  //       $droparea.addClass("row2").width(490);
  //     } else if ($("ul .imagearea").length == 2) {
  //       $droparea.addClass("row2").width(360);
  //     } else if ($("ul .imagearea").length == 5) {
  //       $droparea.addClass("row2").width(620);
  //     } else if ($("ul .imagearea").length == 3) {
  //       $droparea.addClass("row2").width(230);
  //     } else if ($("ul .imagearea").length == 6) {
  //       $droparea.addClass("row2").width(490);
  //     } else if ($("ul .imagearea").length == 7) {
  //       $droparea.addClass("row2").width(360);
  //     } else if ($("ul .imagearea").length == 8) {
  //       $droparea.addClass("row2").width(230);
  //     } else if ($("ul .imagearea").length == 9) {
  //       $droparea.addClass("row2").width(1000);
  //     } else {
  //       $droparea.width(wd - 130);
  //     }
  // }
})
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

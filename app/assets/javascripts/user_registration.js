$(function(){
  // console.log('hello');
  $('#check').change(function(){
    if($(this).prop('checked')){

      $('#password').attr('type','text');
    }else{
      $('#password').attr('type','password');
    }
  });
});

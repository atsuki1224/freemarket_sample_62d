$(function() {
    $(".img").hover(function(){
        let ImgSrc = $(this).attr("src");
        $(".main-image").attr({src:ImgSrc});
        $(".main-image").hide();
        $(".main-image").fadeIn("slow");
        return false;
    });      
});
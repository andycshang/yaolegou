$(function (){
    $("p").click(function () {
        var ul = $(this).next();
        if (ul.is(":hidden")) {
            $(this).addClass("hr");
            $(this).css("border-radius","5px 5px 0px 0px");
            ul.slideDown();
        } else {
            var a = $(this);
            ul.slideUp(function(){
                $("p").css("border-radius","5px 5px");
                a.removeClass("hr");
            });
        }
    })
})
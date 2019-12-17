//= require transit.js

$(document).on('turbolinks:load',function(){

    $('.main_button').click(function(){
        $( this ).next().slideToggle();
        
        if( $(this).children("img").prop("arrowRotated") == true ) {
            $( this ).children("img").transition({rotate: "0deg"}, "slow");
            $( this ).children("img").prop("arrowRotated", false);
        }
        else {
            $( this ).children("img").transition({rotate: "90deg"}, "slow");
            $( this ).children("img").prop("arrowRotated", true);
        }
        
        
    });
});

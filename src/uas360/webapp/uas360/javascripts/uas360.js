
$(function(){
    $('#infoDialog').modal().find('.modal-content').css({
        'margin-top':function(){
            return $(window).height()/2;
        }
    });

});


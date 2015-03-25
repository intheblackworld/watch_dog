

//= require jquery

//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .


var jumboHeight = $('.jumbotron').outerHeight();
function parallax(){
    var scrolled = $(window).scrollTop();
    $('.bg').css('height', (jumboHeight-scrolled) + 'px');
}

$(window).scroll(function(e){
    parallax();
});



$('#admin a').click(function (e) {
    $('ul.nav-tabs li.active').removeClass('active')
    $(this).parent('li').addClass('active')
})
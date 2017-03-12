$(document).on('turbolinks:load', function() {
    $(".comments-link").on('click', function(event){
        event.preventDefault();
        var row = $(event.target).parent();
        $(".comments_section", row).fadeToggle();
        return false;
    });
});

$(document).ready(function() {
    $('#volunteer_neighborhood_id').change(function(){
        $('.map_thumb').removeClass('hidden_thing');
        $('.map_image').attr('src', '/assets/maps/thumbs/' + this.value + '.png');
        $('.map_link').attr('href', '/assets/maps/' + this.value + '.png');
        var selectedText = $("#volunteer_neighborhood_id option:selected").text();
        $('.map_link').attr('title', selectedText);
    });
});
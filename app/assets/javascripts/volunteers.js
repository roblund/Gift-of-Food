$(document).ready(function() {
    $('#volunteer_neighborhood_id').change(function(){
        $('.map_thumb').removeClass('hidden_thing');
        $('.map_image').attr('src', '/assets/maps/thumbs/' + this.value + '.png');
        //TODO - set the title $('.map_image').attr('title', this.text());
        $('.map_link').attr('href', '/assets/maps/' + this.value + '.png');
    });
});
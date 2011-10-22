// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//= require jquery
//= require jquery_ujs
//= require jquery.colorbox.min.js
//= require_tree .

$(document).ready(function(){
    //start up the colorbox for viewing the maps
    $('a.map_link').colorbox({ maxHeight: '100%' });
    //start up the colorbox for the photos from previous years
    $('a.photo_link').colorbox({ maxHeight: '100%' });
});
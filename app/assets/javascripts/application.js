// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require ace-rails-ap
//= require ace/theme-tomorrow_night_blue
//= require ace/mode-javascript
//= require jquery
//= require jquery_ujs
//= require_tree .

$(document).ready(function(){
//hint button opens on click
  $('#hint-btn').on('click', function(){
      $('#hint').show();
      $('#content-box').scrollTop(600);
   });
//signin and signout prompts toggle on clicks
   $('#sgnin-prompt').on('click', function(){
      $(this).hide();
      $('#sgnup-prompt').show();
      $('#signup').hide();
      $('#signin').show();
   });

   $('#sgnup-prompt').on('click', function(){
      $(this).hide();
      $('#sgnin-prompt').show();
      $('#signin').hide();
      $('#signup').show();
   });
   
//hidesCompLink, and shows only when verified response is typed in.
  // $('#compLink').hide();
  // editor.getSession().on('change', function () {
  //   $('#content').val(editor.getSession().getValue().trim());
  //   if($('#content').val() == document.getElementById('answer').innerHTML){
  //     $('#compLink').show();
  //     editor.setReadOnly(true);
  //   }
  // });
  // $('#content').val(editor.getSession().getValue().trim());

});
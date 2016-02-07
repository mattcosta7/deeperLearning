$(document).ready(function(){
//hidesCompLink, and shows only when verified response is typed in.
  $('#compLink').hide();
  editor.getSession().on('change', function () {
    $('#content').val(editor.getSession().getValue().trim());
    if($('#content').val() == document.getElementById('answer').innerHTML){
      $('#compLink').show();
      editor.setReadOnly(true);
    }
  });
  $('#content').val(editor.getSession().getValue().trim());

});
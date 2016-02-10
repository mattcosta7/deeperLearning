//on a succesful ajax:success, hide the compl link, reload-causes next to show, 
$('#compLink').on('ajax:success',function(){
  $('#compLink').hide;
  location.reload();
})

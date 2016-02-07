function printMessage(author,message) {
  $('#messages').append(author +":"+message+ "<br>");
}

$(document).ready(function() {
  var chatChannel;
  var username;
 
  function setupChannel() {
      chatChannel.join().then(function(channel) {
        var mes = chatChannel.getMessages(20);
        mes.then(function(value){
          for(var i=0;i<value.length;i++){
            printMessage(value[i].author,value[i].body);
          }
        $('#messages').append(username + " joined the chat.<br>");
        })
      });

      chatChannel.on('messageAdded', function(message) {
          printMessage(message.author,message.body);
       });
  }
 
  var $input = $('#chat-input'); 
  $input.on('keydown', function(e) {
      if (e.keyCode == 13) {
          chatChannel.sendMessage($input.val())
          $input.val('');
      }
   });

  $.post("/tokens", function(data) {
    username = data.username;
    var accessManager = new Twilio.AccessManager(data.token);
    var messagingClient = new Twilio.IPMessaging.Client(accessManager);
    messagingClient.getChannelByUniqueName(window.location.pathname).then(function(channel) {
      if (channel) {
        chatChannel = channel;
        setupChannel();
      } 
      else {
        messagingClient.createChannel({
          uniqueName: window.location.pathname,
          friendlyName: window.location.pathname 
        })
        .then(function(channel){
          chatChannel = channel;
          setupChannel();
        });
      }
    });
  });

  $('.twilioMessenger').hide();
  $('#showHideMessenger').on('click',function(){
    $('.twilioMessenger').slideToggle(500);
  })


});
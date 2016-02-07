function printMessage(message) {
  $('#messages').append(message + "<br>");
}

$(document).ready(function() {
  var chatChannel;
  var username;
 
  function setupChannel() {
      chatChannel.join().then(function(channel) {
          printMessage(username + ' joined the chat.');
      });

      chatChannel.on('messageAdded', function(message) {
          printMessage(message.author + ": " + message.body);
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
  messagingClient.getChannelByUniqueName('chat').then(function(channel) {
      if (channel) {
        chatChannel = channel;
        setupChannel();
      } else {
        messagingClient.createChannel({
            uniqueName: 'chat',
            friendlyName: 'Chat Channel' })
        .then(function(channel) {
            chatChannel = channel;
            setupChannel();
        });
      }
    });
  });
});
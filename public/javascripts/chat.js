//https://www.twilio.com/blog/2016/02/add-chat-to-a-rails-app-with-twilio-ip-messaging.html?utm_source=rubyweekly&utm_medium=email

//function that appends a new message to the window
function printMessage(author,message) {
  $('#messages').append("<span class='newMessage'><a class='chat-user' href='/users/"+encodeURI(author)+"'>"+author+"</a>:<span class='newMessageBody'>"+message+ "</span></span><br>");
  var scrollIt = $('#messages')[0].scrollHeight;
  $('#messages').scrollTop(scrollIt);
}

$(document).ready(function() {
//defines variables
  var chatChannel;
  var username;
 
//function that joins a specified channel, 
//gets the last 20 messages in that channel
//prints them to the display
//then appends that a user has logged in, when a new user logs in
//listens for new messages then adds author and message when added
  function setupChannel() {
    chatChannel.join().then(function(channel) {
      var mes = chatChannel.getMessages(20);
      mes.then(function(value){
        for(var i=0;i<value.length;i++){
          printMessage(value[i].author,value[i].body);
        }
      chatChannel.sendMessage("<span class='newMessageBody'>joined the chat.</span></span>");
      var scrollIt = $('#messages')[0].scrollHeight;
      $('#messages').scrollTop(scrollIt);
      })
    });
    chatChannel.on('messageAdded', function(message) {
        printMessage(message.author,message.body);
     });
    $(window).on('beforeunload',function(channel){
      chatChannel.sendMessage("I'm outtie!");
      chatChannel.leave().then(function(channel){
      });
    });
    $(window).on('unload',function(channel){
      chatChannel.sendMessage("I'm outtie!");
      chatChannel.leave().then(function(channel){
      });
    });
  }
 
//listens for keydowns, then on enter keypress sends the message
  $('#chat-input').on('keydown', function(e) {
    if(e.keyCode == 13) {
      chatChannel.sendMessage($('#chat-input').val())
      $('#chat-input').val('');
    }
  });


//sends an ajax post to tokens (the tokens#create method on the rails server)
//sets username based on the username passed in from te controller
//sets up access by passing the Twilio.AccessManager the token
//makes a new Messaging client based on the access received.
//gets a channel by the name of the path, setting that channel if it exists
//or creating a new one if it doesn't.
  $.post("/tokens", function(data) {
    username = data.username;
    var accessManager = new Twilio.AccessManager(data.token);
    var messagingClient = new Twilio.IPMessaging.Client(accessManager);
    messagingClient.getChannelByUniqueName(window.location.pathname).then(function(channel){
      if(channel){
        chatChannel = channel;
        setupChannel();
      } 
      else{
        messagingClient.createChannel({
          uniqueName: window.location.pathname,
          friendlyName: window.location.pathname 
        }).then(location.reload());
      }
    });
  });

//on page load hides the messenger, and toggles via slideDown when clicking the button
  $('.twilioMessenger').hide();
  $('#showHideMessenger').on('click',function(){
    $('.twilioMessenger').slideToggle(500);
  })


});
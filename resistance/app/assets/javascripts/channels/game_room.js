
$(document).ready(function(){
  gameRoomListener();
});

var gameRoomListener = function(){
  var gameRoomID = $('#game-room').data('room-id');
  $('#button-1').on('click', function(e){
    console.log('button 1 pressed!');
    App.global_chat.perform('test_route', { room: gameRoomID})
  })
}

var initializeSubscription = function(){
  var gameRoomID = $('#game-room').data('room-id');
  console.log("in initialize subscription with a room-id value of: ", gameRoomID)
  App.global_chat = App.cable.subscriptions.create(
        { channel:  "GameRoomChannel",
          room: gameRoomID},
        { connected: function(){},
          disconnected:    function(){},
          received: function(data){ console.log('received data')}
        });
}

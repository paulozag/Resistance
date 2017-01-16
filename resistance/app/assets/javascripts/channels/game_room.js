
$(document).ready(function(){
  gameRoomListener();
});

var gameRoomListener = function(){
  var gameRoomID = $('#game-room').data('room-id');
  $('#button-1').on('click', function(e){
    App.global_chat.perform('test_route', { room: gameRoomID})
  })
}

var initializeSubscription = function(){
  var gameRoomID = $('#game-room').data('room-id');
  App.global_chat = App.cable.subscriptions.create(
        { channel:  "GameRoomChannel",
          room: gameRoomID},
        { connected: function(){},
          disconnected:    function(){},
          received: function(data){ gamesController(data)}
        });
}

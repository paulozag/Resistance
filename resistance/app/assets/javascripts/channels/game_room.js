var gameRoomController
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
  // console.log("in init subs, room-id is: ", $('#game-room').data('room-id'))
  var gameData = {  roomID: $('#game-room').data('room-id'),
                    playerID: $('#game-room').data('player-id')
                    }
  if (!gameRoomController){
    gameRoomController = new GameController(gameData)
  }

  App.global_chat = App.cable.subscriptions.create(
        { channel:  "GameRoomChannel",
          room: gameData.roomID},
        { connected:        function(){},
          disconnected:     function(){},
          received: function(data){ gameRoomController.receive(data)}
        });
}

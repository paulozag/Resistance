var gameRoomController;
$(document).ready(function(){
  gameRoomListener();
  startGameListener();
});

var gameRoomListener = function(){
  var gameRoomId = $('#game-room').data('room-id');
  $('#button-1').on('click', function(e){
    App.global_chat.perform('test_route', { room: gameRoomId});
  });
};

var startGameListener = function(){
  var gameRoomId = $('#game-room').data('room-id');
    $('#start-game').on('click', function(e){
      App.global_chat.perform('start_game', {room: gameRoomId});
    })
  }

var initializeSubscription = function(){
  var gameData = {  roomID: $('#game-room').data('room-id'),
                    playerID: $('#game-room').data('player-id')
                    };
  if (!gameRoomController){
    gameRoomController = new GameController(gameData);
  }

  App.global_chat = App.cable.subscriptions.create(
        { channel:  "GameRoomChannel",
          room: gameData.roomID},
        { connected:        function(){},
          disconnected:     function(){},
          received: function(data){ gameRoomController.receive(data)}
        });
};

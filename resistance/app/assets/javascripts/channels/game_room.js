var gameRoomController;
$(document).ready(function(){
  gameRoomListener();
  startGameListener();
  roundTeamCheckboxListener();
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
  var gameData = {  roomId: $('#game-room').data('room-id'),
                    playerId: $('#game-room').data('player-id')
                    };
  if (!gameRoomController){
    gameRoomController = new GameController(gameData);
  }

  App.global_chat = App.cable.subscriptions.create(
        { channel:  "GameRoomChannel",
          room: gameData.roomId},
        { connected:        function(){},
          disconnected:     function(){},
          received: function(data){ gameRoomController.receive(data)}
        });
};

var roundTeamCheckboxListener = function(){
  console.log('hello from checkbox listener')
  // isolate num_players for team submission
  // write helper to count num_checked boxes
  // target individual checkbox, when clicked
  //  check to see if clickable(< numPlayers)
  //    if at max checks, prevent default of clicking the box
  // if at max checks, enable submission button, disable all unchecked checkboxes

}

var numberOfCheckedBoxes = function($form){
  return $form.find('input:checked').length
}

var disableAllUncheckedBoxes = function($form){
  var uncheckedBoxes = $form.find('input:checkbox:not(:checked)');
  for (box of uncheckedBoxes){
    $(box).attr('disabled', true)
  }
}

var enableAllCheckboxes = function($form){
  var checkBoxes = $form.find('input:checkbox');
  for (box of checkBoxes){
    $(box).removeAttr('disabled');
  }
}

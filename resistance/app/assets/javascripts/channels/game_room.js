var gameRoomController;

$(document).ready(function(){
  gameRoomListener();
  startGameListener();
  roundTeamCheckboxListener();
  checkboxFormSubmitListener();
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
  $('#round-leader-team-selection-container').on('click', ".pick-team-checkbox", function(event){
    event.preventDefault;
    var teamSize = Number($('#team-checkbox-container').data('num-players-needed'));
    var $form = $(this).closest('form');
    if (numberOfCheckedBoxes($form) > teamSize ){
      $(this).prop('checked', false);
      alert('You may only select ' + teamSize + ' members for this mission.')
    }
  });
};

var checkboxFormSubmitListener = function(){
  $('#round-leader-team-selection-container').on('click', '#checkbox-form-submit-button',function(event){
    event.preventDefault();
    var teamSize = Number($('#team-checkbox-container').data('num-players-needed'));
    var $form = $(this).closest('form');
    if (teamSize > numberOfCheckedBoxes($form)){
      alert('you must select ' + teamSize + ' members for the team')
    }
  })
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

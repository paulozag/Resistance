 var GameController = function(gameData){
  this.roomId = gameData.roomId;
  this.playerId = gameData.playerId;
  console.log('created gameController with room id of ' + this.roomId + ' and player id of ' + this.playerId)
}

GameController.prototype.receive = function(data){
  console.log('receiving: ', data);
  switch(data.action){
    case 'addPlayer':
      this.addPlayer(data);
      break;
    case 'startGame':
      this.startGame(data);
      break;
    default:
      console.log('in receive action with no action accounted for');
      break;
  }
}

GameController.prototype.addPlayer = function(data){
  if (data.playerId != this.playerId){
    $('#waiting-players-list').append('<li>' + data.newPlayerName + '</li>');
  }
  if (data.creatorId == this.playerId  && data.numPlayers >= 5){
    $('#start-game-section').show()
  }
};

GameController.prototype.startGame = function(data){
  var gameRoomId = $('#game-room').data('room-id');
  console.log('in start game response');
  $('#waiting-to-start-container').hide()
  $('#game-in-play-container').show();
  if (data.roundLeaderId  == this.playerId){
    $('#round-leader-team-selection-container').show();
    $('#round-leader-team-selection-container').append(data.checkboxPartial)
  }
};
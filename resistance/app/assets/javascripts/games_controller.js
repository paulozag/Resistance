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
};

GameController.prototype.startGame = function(data){
  console.log('in start game response');
};
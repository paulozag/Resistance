var GameController = function(gameData){
  this.roomID = gameData.roomID;
  this.playerID = gameData.playerID;
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
  if (data.playerID != $('#game-room').data('player-id')){
    $('#waiting-players-list').append('<li>' + data.newPlayerName + '</li>');
  }
};

GameController.prototype.startGame = function(data){
  console.log('in start game response');
};
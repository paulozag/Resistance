
var GameController = function(gameData){
  this.roomID = gameData.roomID;
  this.playerID = gameData.playerID;
}

GameController.prototype.receive = function(data){
  switch(data.action){
    case 'addPlayer':
      this.addPlayer(data);
      break;
    default:
      console.log('in receive action with no action accounted for')
      break;
  }
}

GameController.prototype.addPlayer = function(data){
  console.log(data)
  if (data.playerID != $('#game-room').data('player-id')){
    $('#waiting-players-list').append('<li>' + data.newPlayerName + '</li>')
  }
}
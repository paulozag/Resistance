var gamesController = function(data){
  console.log('in gc function')
}

var GameController = function(gameData){
  this.gameID = gameData.gameID;
  this.playerID = gameData.playerID;
}

GameController.prototype.receive = function(data){
  console.log('receiving message from server broadcast')
}
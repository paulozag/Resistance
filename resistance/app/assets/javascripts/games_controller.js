
var GameController = function(gameData){
  this.roomID = gameData.roomID;
  this.playerID = gameData.playerID;
}

GameController.prototype.receive = function(data){
  console.log('receiving message from server broadcast')
  console.log('game controller game number ', this.roomID)
  console.log('game controller player number ', this.playerID)
}
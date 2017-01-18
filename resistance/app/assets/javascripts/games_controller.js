
var GameController = function(gameData){
  this.roomID = gameData.roomID;
  this.playerID = gameData.playerID;
}

GameController.prototype.receive = function(data){
  console.log('receiving message from server broadcast')
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

}
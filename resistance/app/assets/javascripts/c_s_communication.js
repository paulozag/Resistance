$(document).ready(function(){
  console.log('hello');
  gameRoomListener();
})

var gameRoomListener = function(){
  $('#button-1').on('click', function(e){
    console.log('button 1 pressed!');
  })
}

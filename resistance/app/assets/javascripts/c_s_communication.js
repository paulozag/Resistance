(function() {
  this.App || (this.App = {});

  App.cable = ActionCable.createConsumer();

}).call(this);


$(document).ready(function(){
  console.log('hello');
  initializeSubscription();
  gameRoomListener();
});

var gameRoomListener = function(){
  $('#button-1').on('click', function(e){
    console.log('button 1 pressed!');
    App.global_chat.perform('test_route')
  })
}

var initializeSubscription = function(){
  App.global_chat = App.cable.subscriptions.create(
        { channel:  "GameRoomChannel"},
        { connected: function(){},
          disconnected:    function(){},
          received: function(data){ console.log('received data')}
        });
}

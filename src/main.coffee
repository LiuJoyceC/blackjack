
for suit in ['spades', 'diamonds', 'clubs', 'hearts']
  for rank in [2,3,4,5,6,7,8,9,10,'jack','queen','king','ace']
    $('body').append("<div class='#{suit}#{rank} hidden'></div>")

new AppView(model: new App()).$el.appendTo 'body'
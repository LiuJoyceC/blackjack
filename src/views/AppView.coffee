class window.AppView extends Backbone.View
  template: _.template '
    <button class="hit-button">Hit</button> <button class="stand-button">Stand</button>
    <div class="player-hand-container"></div>
    <div class="dealer-hand-container"></div>
  '

  events:
    'click .hit-button': -> @model.get('playerHand').hit()
    'click .stand-button': -> @model.get('dealerHand').dealerPlay()

  initialize: ->
    @render()

  render: ->
    #@$el.children().detach()
    @model.deal()
    playerHand = @model.get 'playerHand'
    dealerHand = @model.get 'dealerHand'
    playerHand.once 'endGame', () => @endGame()
    dealerHand.once 'endGame', () => @endGame()
    @$el.html @template()
    @$('.player-hand-container').html new HandView(collection: playerHand).el
    @$('.dealer-hand-container').html new HandView(collection: dealerHand).el

  endGame: ->
    playerScore = @model.get('playerHand').bestScore()
    dealerScore = @model.get('dealerHand').bestScore()
    alert(
      (switch true
        when playerScore is dealerScore
          #If both have blackjack, it's also a push
          "It's a push! You neither win nor lose."
        when playerScore > 21
          "You busted! You lose."
        when dealerScore > 21
          "Dealer busted! You win!"
        when playerScore is "Blackjack"
          "You have a Blackjack! You win!"
        when dealerScore is "Blackjack"
          "Dealer has a Blackjack. You lose."
        when playerScore > dealerScore
          "Your score is higher. You win!"
        else "Your score is lower. You lose."
        ) + "\nClick OK to deal again."
      )
    @render()
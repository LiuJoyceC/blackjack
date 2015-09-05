# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  initialize: ->
    @set 'deck', new Deck()


  deal: ->
    deck = @get 'deck'
    #if deck.length is <25% of original length or <16 cards
    if deck.length < 16
      alert 'Shuffling deck now...'
      @set 'deck', deck = new Deck()
    @set 'playerHand', playerHand = deck.dealPlayer()
    @set 'dealerHand', dealerHand = deck.dealDealer()


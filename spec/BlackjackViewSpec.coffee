assert = chai.assert

describe 'blackjack rules', ->
  class ControlledDeck extends Deck
    initialize: (array, cards)->
      @add cards.map (card) ->
        new Card
          rank: card % 13
          suit: Math.floor(card / 13)


  describe 'scores', ->
    it 'should add up scores when there is no Ace', ->
      # hand should have two, queen, and seven
      deck = new ControlledDeck null, [7,12,2]
      hand = deck.dealPlayer()
      hand.hit()
      assert.strictEqual hand.bestScore(), 19

    it 'should use soft score if it is not over 21', ->
      deck = new ControlledDeck null, [5,1]
      hand = deck.dealPlayer()
      assert.strictEqual hand.bestScore(), 16

    it 'should use hard score if soft score is over 21', ->
      deck = new ControlledDeck null, [12,1,3]
      hand = deck.dealPlayer()
      hand.hit()
      assert.strictEqual hand.bestScore(), 14

    it 'should have Blackjack if the score is 21 with exactly two cards', ->
      deck = new ControlledDeck null, [10,1]
      hand = deck.dealPlayer()
      assert.strictEqual hand.bestScore(), "Blackjack"
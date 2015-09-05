assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'hit', ->
    it 'should give the last card from the deck', ->
      assert.strictEqual deck.length, 50
      lastCard = deck.last()
      hand.hit()
      assert.strictEqual lastCard, hand.last()
      assert.strictEqual deck.length, 49

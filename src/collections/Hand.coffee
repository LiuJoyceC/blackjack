class window.Hand extends Backbone.Collection
  model: Card

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    scoreArray = [hardScore, softScore] = @scores()
    if hardScore > 21
      #alert if @isDealer then 'Dealer busted! You win!' else 'You busted! You lose.'
      @trigger 'endGame'
    scoreArray

  dealerPlay: ->
    @at(0).flip()
    score = @scores()[1]
    while score < 17
      [hardScore, softScore] = @hit()
      score = if softScore > 21 then hardScore else softScore
    @trigger 'endGame'



  hasAce: -> @reduce (memo, card) ->
    memo or card.get('revealed') and card.get('value') is 1
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    [@minScore(), @minScore() + 10 * @hasAce()]

  bestScore: ->
    [hardScore, softScore] = @scores()
    if softScore is 21 and @.length is 2
      return 'Blackjack'
    Math.max hardScore, softScore % 22




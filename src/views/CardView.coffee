class window.CardView extends Backbone.View
  className: 'card'

  initialize: ->
    if @model.get 'revealed'
      cardClass = @model.get('suitName') + @model.get('rankName')
    else
      cardClass = 'cardback'
    @$el.addClass cardClass

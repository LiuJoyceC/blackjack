class window.CardView extends Backbone.View
  className: 'card'

  # use as alternative to displaying card image
  templateText: _.template '<%= rankName %> of <%= suitName %>'

  template: _.template "<img src='img/cards/<%= rankName %>-<%= suitName.toLowerCase() %>.png'>"

  templateBack: _.template "<img src='img/card-back.png'>"

  initialize: -> @render()

  render: ->
    #@$el.children().detach()
    if @model.get 'revealed'
      @$el.html @template @model.attributes
    else
      @$el.html @templateBack @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'


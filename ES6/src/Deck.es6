class Deck extends Backbone.Collection {

  initialize() {
    var numArray = new Array(52);
    for (let i = 0; i < 52; i++) {
      numArray.push(i);
    }
    this.add(_(numArray).shuffle().map(function(card) {
      return new Card({
        rank: card % 13,
        suit: Math.floor(card / 13)
      });
    }));
  }

  dealPlayer() {
    return new Hand([this.pop(), this.pop()], this);
  }

  dealDealer() {
    return new Hand([this.pop().flip(), this.pop()], this, true);
  }
}

Deck.prototype.model = Card;

/* Command to run babel in background:
babel src --watch --out-dir compiled --source-maps ./ &
*/
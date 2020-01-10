require_relative 'card'

class Deck
  attr_reader :stack 

  def initialize
    @stack = create_deck.shuffle
  end

  def create_deck
    deck = []
    suits = [:D, :H, :S, :C]
    suits.each do |suit|
      (2..10).each do |value|
        deck << Card.new(value, suit, [value])
      end
      deck += [Card.new(:K, suit, [13]), Card.new(:Q, suit, [12]), Card.new(:J, suit, [11]), Card.new(:A, suit, [1,14])]
    end
    deck
  end

  private

  attr_writer :stack

end
class Hand

  HAND_RANKING = [straight_flush, four_of_a_kind, ...]

  def initialize(deck)
    @cards = first_five_cards(deck)
  end

  def first_five_cards(deck)
    hand = []
    5.times {hand << deck.stack.shift}
    hand
  end

  def royal_flush
    straight_flush && @cards.any? {|card| card.rank == :A}
  end

  def straight_flush
    self.all? {|card| self.cards[0].suit == card.suit}
  end  

  def four_of_a_kind
    hash = Hash.new(0)
    # key => rank, value = freq
    @cards.each {|card| hash[card.rank] += 1}
    hash.any? {|k,v| v == 4}
  end

  def straight
    min_cards = @cards.map {|card| card.value.min}.sort
    max_cards = @cards.map {|card| card.value.max}.sort

    (0...@cards.length - 1).all? do |i|
      min_cards[i] 
    end
  end


end
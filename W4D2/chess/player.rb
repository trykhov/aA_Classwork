require_relative "game"

class Player

    def initialize(symbol, display)
      @color = symbol 
      @display = display # we don't know if it'll be a new display object or if it's passed in
    end

end
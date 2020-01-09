require_relative "piece"

class Pawn < Piece

    attr_reader  :color

    def initialize(symbol, color, board, pos)
      @symbol = symbol
      super(color, board, pos)
    end

    def move_dirs
      forward_steps
    end

     def symbol
      super
    end

    private

    def at_start_row?
      #check the pos[x,y] , x == 1 && color = black pos[x]
      # check the pos[x,y] , x == 7 && color = white 
      (self.pos[0] == 1 && self.color == "black" )|| (self.pos[0] == 7 && self.color == "white")
    end

    def forward_dir
      self.color == "black" ? 1 : -1
    end

    def forward_steps
      # return arrays of forward movement
      # if it's at the start: move forward by 1, move forward by 2, or we can move diagonally by one if the opponent's piece is diagonal
      # everywhere else: move forward by 1, we can move diagonally by one if the opponent's piece is diagonal
      x, y = self.pos
      possible_moves = []
      dy = self.forward_dir
      possible_moves << [x, y + dy] # we know we can move forward by 1
      possible_move << [x, y + 2 * dy] if self.at_start_row? # but can we move forward by 2?
      possible_move += self.side_attacks # now can we attack?
      # returns the set of moves we can possibly make
    end

    def side_attacks
      # return array of possible positions to attack
      # dx is an array that represents the number of ways it can move
      dy = self.forward_dir
      x, y = self.pos
      possible_moves = [[x + 1, y + dy], [x - 1, y + dy]]
      possible_moves.select {|move| !self.board[move].nil? && self.board[move].color != self.color}
    end

end

pawn = Pawn.new(:N, "white", nil, [4,5])
p pawn.symbol
require_relative 'piece'

module Stepable
  def moves
    #check color to get valid moves []
    #if value_moves [] include end_pos
    # end_pos -> strat_pos
    # use move_diffs

    # returns an array of possible places to move
    move_diffs
  end

  def symbol
    super
  end 

  private

  # can't use self.move_diff, has to call move_diffs from another method
  def move_diffs
    # can call self in here
    # have access to symbol, position
    possible_moves = []
    knights_move = [[2,1], [2,-1],[1,2], [1,-2], [-1,2], [-2,1], [-2,-1], [-1,-2]]
    kings_move =   [[1,0], [1,1] ,[0,1], [-1,1], [-1,0], [-1,-1],[0,-1],  [1,-1]]
    x ,y = self.pos
    if self.symbol == :K
      # do a loop on knights move
      # determine if this is a valid move (not out of bounds & no same color element on the end space)
      # x < 0 || 8 <= x || y < 0 || 8 <= y
      knights_move.each do |pair|
        dx,dy = pair 
        horiz_end, vert_end = [x + dx, y + dy]
        possible_moves << [x + dx, y + dy] unless horiz_end < 0 || 8 <= horiz_end || vert_end < 0 || 8 <= vert_end
      end
    elsif self.symbol == :Kg 
      kings_move.each do |pair|
        dx,dy = pair 
        horiz_end, vert_end = [x + dx, y + dy]
        possible_moves << [x + dx, y + dy] unless horiz_end < 0 || 8 <= horiz_end || vert_end < 0 || 8 <= vert_end
      end   
    end
    possible_moves
  end
end

class KnightKing < Piece

  include Stepable

  attr_reader :symbol, :color, :pos

    def initialize(symbol,color, board, pos)
      @symbol = symbol
      super(color, board, pos)
    end
  
end


king = KnightKing.new(:Kg, "black", nil, [3,1])
# p king.symbol
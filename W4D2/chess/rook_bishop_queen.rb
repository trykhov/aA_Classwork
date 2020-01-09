require_relative 'piece'

module Slideable
  
  HORIZONTAL_DIRS = [[-1,0], [1,0], [0,1], [0,-1]]
  DIAGONAL_DIRS = [[1,1], [1,-1], [-1,-1], [-1,1]]

  public

  def horizontal_dirs

  end   

  def moves
    move_dirs
  end

  def symbol
    super
  end 

  private

  def move_dirs
    possible_moves = []
    queen_dir = DIAGONAL_DIRS + HORIZONTAL_DIRS
    if self.symbol == :R
      HORIZONTAL_DIRS.each do |pair|
        dx, dy = pair
        possible_moves += grow_unblocked_moves_in_dir(dx, dy) 
      end
    elsif self.symbol == :B
      DIAGONAL_DIRS.each do |pair|
        dx, dy = pair
        possible_moves += grow_unblocked_moves_in_dir(dx, dy) 
      end   
    elsif self.symbol == :Q
      queen_dir.each do |pair|
        dx, dy = pair
        possible_moves += grow_unblocked_moves_in_dir(dx, dy) 
      end
    end
    possible_moves 
  end

  def grow_unblocked_moves_in_dir(dx,dy)
    # # idea: add to array if position is unblocked, then recurse going +1 or -1
    possible_moves = []
    x, y = self.pos
    new_pos = [x + dx, y + dy]
    return [] if 7 < x + dx || x + dx < 0 || 7 < y + dy || y + dy < 0
    possible_moves << new_pos
    possible_moves += grow_unblocked_moves_in_dir(dx + 1, dy) if 0 < dx && dy == 0 # going right horizontally
    possible_moves += grow_unblocked_moves_in_dir(dx - 1, dy) if dx < 0 && dy == 0 # going left horizontally
    possible_moves += grow_unblocked_moves_in_dir(dx + 1, dy + 1) if 0 < dx && 0 < dy # going diagonal upright
    possible_moves += grow_unblocked_moves_in_dir(dx - 1, dy - 1) if dx < 0 && dy < 0 # going diagonal leftdown
    possible_moves += grow_unblocked_moves_in_dir(dx, dy + 1) if dx == 0 && 0 < dy # going up
    possible_moves += grow_unblocked_moves_in_dir(dx, dy - 1) if dx == 0 && dy < 0 # going down
    possible_moves += grow_unblocked_moves_in_dir(dx - 1, dy + 1) if dx < 0 && 0 < dy # going diagonal upleft
    possible_moves += grow_unblocked_moves_in_dir(dx + 1, dy - 1) if 0 < dx && dy < 0 # going diagonal rightdown
    possible_moves    
  end 



end

class RookQueenBishop < Piece

  include Slideable

    attr_reader :color, :pos

    def initialize(symbol,color, board, pos)
      @symbol = symbol
      super(color, board, pos)
    end

end

# rook = RookQueenBishop.new(:R, "black", nil, [3,3])
# bishop = RookQueenBishop.new(:B, "black", nil, [3,3])
# queen = RookQueenBishop.new(:Q, "black", nil, [3,2])
# # p rook.moves
# # p bishop.moves
# p queen.moves
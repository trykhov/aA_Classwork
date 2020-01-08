require_relative 'piece'

class Board

  attr_accessor :rows 

  def initialize
    # start filling board with NilPiece
    @rows = Array.new(8) { Array.new(8, Piece.new) }
    @rows[0] = "R"
    # @sentinel = NullPiece.new
  end

  def move_piece(start_pos, end_pos)
    p @rows[start_pos]
    # REMINDER: Redefine condition when NilPiece is properly defined
    raise "No piece is there " if @rows[start_pos].nil?

    x, y = end_pos
    raise "Illegal move" if x < 0 || 8 <= x || y < 0 || 8 <= y

    @row[end_pos] = @rows[start_pos]
    @rows[start_pos] = nil
  end

  def [](pos)
    p pos
    x, y = pos 
    @rows[x][y]
  end

  def []=(pos, val)
    x, y = pos 
    @rows[x][y] = val
  end

end

board = Board.new
# board.move_piece([0,0], [5,6])

p board[(0,0)] = "X"
p board[(0,0)]
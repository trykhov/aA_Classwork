require_relative 'knight_king'
require_relative 'pawn'
require_relative 'rook_bishop_queen'

class Board

  attr_accessor :rows 

  def initialize
    # start filling board with NilPiece
    @rows = Array.new(8) { Array.new(8,nil) }
    placePieces
    # @sentinel = NullPiece.new
  end

  def placePieces
    # will set up the pieces for the board
    (0..2).each do |i|
      back_row = [[0,i], [0,7-i], [7,i], [7,7-i]]
      case i 
      when 0
        back_row.each do |pair|
          self[pair] = RookQueenBishop.new(:R, "black", self, pair) if pair[0] == 0
          self[pair] = RookQueenBishop.new(:R, "white", self, pair) if pair[0] == 7
        end
      when 1
        back_row.each do |pair|
          self[pair] = KnightKing.new(:K, "black", self, pair) if pair[0] == 0
          self[pair] = KnightKing.new(:K, "white", self, pair) if pair[0] == 7
        end
      when 2
         back_row.each do |pair|
          self[pair] = RookQueenBishop.new(:B, "black", self, pair) if pair[0] == 0
          self[pair] = RookQueenBishop.new(:B, "white", self, pair) if pair[0] == 7
        end
      end
    end
    self[[0,4]], self[[7,4]] = [KnightKing.new(:Kg, "black", self, [0,4]), KnightKing.new(:Kg, "white", self, [7,4])]
    self[[0,3]] , self[[7,3]] = [RookQueenBishop.new(:Q, "black", self, [0,3]), RookQueenBishop.new(:Q, "white", self, [7,3])]
    self.rows[1] = (0..7).map {|i| Pawn.new(:P, "black", self, [1,i])}
    self.rows[6] = (0..7).map {|i| Pawn.new(:P, "white", self, [6,i])}


  end

  def move_piece(start_pos, end_pos)
    # REMINDER: Redefine condition when NilPiece is properly defined
    raise "No piece is there " if self[start_pos].nil?

    x, y = end_pos
    raise "Out of bounds" if x < 0 || 8 <= x || y < 0 || 8 <= y

    self[end_pos] = self[start_pos]
    self[start_pos] = nil
  end

  def [](pos)
    x, y = pos 
    @rows[x][y]
  end

  def []=(pos, val)
    x, y = pos 
    @rows[x][y] = val
  end

  def print_rows
    (0..7).each do |i|
      puts self.rows[i].join(" ")
    end 
  end

end

board = Board.new
# board.move_piece([0,0], [5,6])
board.print_rows.inspect

# pos = [0,0]
# board.move_piece(pos, [3,8])
# board.print_rows
require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board
  attr_accessor :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if self.board.over?
      return self.board.winner == @next_mover_mark
    else
    # return false if self.board.over? && (self.board.winner == evaluator || self.board.winner.nil?)
    # returns false if the game if over AND we're the winner (or no one is)
    # return true if self.board.over? && self.board.winner == @next_mover_mark
      kids = self.children
    # kids.each {|kid| return false if kid.losing_node?(evaluator)}
      return kids.all? {|kid| kid.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    # returns an array of node objects that represent possible states of the board
    kids = []
    (0...@board.rows.length).each do |i|
      (0...@board.rows.length).each do |j|
        pos = [i,j]
        potential_board = @board.dup
        if potential_board[pos].nil?
          potential_board[pos] = @next_mover_mark
          next_mark = @next_mover_mark == :x ? :o : :x
          kids << TicTacToeNode.new(potential_board, next_mark, pos)
        end
      end
    end
    kids # an array of TicTacToeNode objects
  end




end

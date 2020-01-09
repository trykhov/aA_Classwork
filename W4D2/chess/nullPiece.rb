require_relative 'piece'
require 'singleton'

class NullPiece < Piece

  include Singleton

  attr_reader :board, :pos

  def initialize
    @symbol = nil
    super(color, board, pos)
  end

  def symbol
    super
  end 

  # #moves ?

  # #symbol ?

end
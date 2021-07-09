# frozen_string_literal: true

# Possibilities extends GameBoard class and its layout contains a matrix of possible moves
# In TicTacToe class, its values are updated at the same time the main game board is updated
class Possibilities < GameBoard
  attr_accessor :board

  def initialize
    super
    @board = { A1: 'A1', B1: 'B1', C1: 'C1',
               A2: 'A2', B2: 'B2', C2: 'C2',
               A3: 'A3', B3: 'B3', C3: 'C3' }
  end

  def update(play, player_symbol)
    board[play.to_sym] = %i[C1 C2 C3].include?(play.to_sym) ? player_symbol.to_s : " #{player_symbol}"
  end
end

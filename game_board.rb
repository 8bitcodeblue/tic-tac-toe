# frozen_string_literal: true

# GameBoard class creates new instances of a game board (hash) and its methods
class GameBoard
  attr_accessor :board

  def initialize
    @board = { A1: ' ', B1: ' ', C1: ' ',
               A2: ' ', B2: ' ', C2: ' ',
               A3: ' ', B3: ' ', C3: ' ' }
  end

  def space_empty?(play)
    board[play.to_sym] == ' '
  end

  def update(play, player_symbol)
    board[play.to_sym] = player_symbol
  end
end

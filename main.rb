# frozen_string_literal: true

require_relative 'tic_tac_toe'
require_relative 'game_board'
require_relative 'possibilities'
require_relative 'player'

def intro
  puts 'You may type in lower case.'
  puts "Please enter player one's name (or just press enter to use the default)"

  p1_name = gets.chomp
  p1_name = p1_name == '' ? 'Player_one' : p1_name

  p1_symbol = nil
  until %w[X O].include?(p1_symbol)
    puts "#{p1_name}, choose \"X\" or \"O\"!"
    p1_symbol = gets.chomp.upcase
  end

  puts "Enter player two's name (or press enter to use the default)"
  p2_name = gets.chomp
  p2_name = p2_name == '' ? 'Player_two' : p2_name

  p2_symbol = p1_symbol == 'X' ? 'O' : 'X'

  p1 = Player.new(p1_name, p1_symbol)
  p2 = Player.new(p2_name, p2_symbol)
  new_possibilities = Possibilities.new
  new_board = GameBoard.new
  new_match = TicTacToe.new(p1, p2, new_board, new_possibilities)

  new_match.display_game
  new_match.play_rounds
end

intro
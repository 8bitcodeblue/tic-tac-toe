# frozen_string_literal: true

require_relative 'terminal_interface'

# TicTacToe creates a new object representing a new match. Its instance variables are updated throughout the game.
# Its board and possibilities are reset if the user decides to rematch.
class TicTacToe
  include TerminalInterface

  attr_accessor :turn, :game_board, :possibilities
  attr_reader :p1, :p2

  def initialize(p1, p2, game_board, possibilities)
    @p1 = p1
    @p2 = p2
    @game_board = game_board
    @possibilities = possibilities
    @turn = p1.name
  end

  def display_game
    display_title
    display_board
    display_score
  end

  def play_rounds
    player_symbol = turn == p1.name ? p1.symbol : p2.symbol

    puts "(#{player_symbol}) #{turn}, make your move."

    play = gets.chomp.upcase
    until game_board.space_empty?(play)
      puts 'Please choose an available space!'
      play = gets.chomp.upcase
    end

    game_board.update(play, player_symbol)
    possibilities.update(play, player_symbol)

    if winner?(player_symbol)
      end_match(turn)
      rematch
    elsif tie?
      display_game
      puts "It's a tie!"
      rematch
    else
      display_game
      change_turn
      play_rounds
    end
  end

  private

  def winner?(player_symbol)
    win_possibilities = [
      %w[A1 B1 C1],
      %w[A2 B2 C2],
      %w[A3 B3 C3],

      %w[A1 A2 A3],
      %w[B1 B2 B3],
      %w[C1 C2 C3],

      %w[A1 B2 C3],
      %w[A3 B2 C1]
    ]

    player_spaces_hash = game_board.board.select do |space|
      game_board.board[space] == player_symbol
    end
    player_moves = player_spaces_hash.keys.map(&:to_s)

    win_possibilities.any? do |possibility|
      possibility.all? { |el| player_moves.include?(el) }
    end
  end

  def tie?
    game_board.board.none? do |space|
      space[1] == ' '
    end
  end

  def change_turn
    self.turn = turn == p1.name ? p2.name : p1.name
  end

  def end_match(player)
    if player == p1.name
      p1.add_point
    else
      p2.add_point
    end

    display_game

    puts "Congratulations #{player}, you've won!"
  end

  def rematch
    puts 'Rematch?'
    puts 'You may type in yes/y/no/n.'
    input = gets.chomp.strip

    until %w[yes y no n].include?(input)
      puts 'Please enter yes or no.'
      input = gets.chomp.strip
    end

    if %w[yes y].include?(input)
      new_possibilities = Possibilities.new
      new_board = GameBoard.new

      new_match = TicTacToe.new(p1, p2, new_board, new_possibilities)
      new_match.display_game
      new_match.play_rounds
    else
      puts 'Have a wonderful day! Thanks for playing :}'
    end
  end
end

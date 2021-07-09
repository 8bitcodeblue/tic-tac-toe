# frozen_string_literal: true

# Player class creates objects that track player name and their symbol ("X" or "O")
class Player
  attr_accessor :score
  attr_reader :name, :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @score = 0
  end

  def add_point
    self.score += 1
  end
end
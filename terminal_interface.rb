# frozen_string_literal: true

# TerminalInterface contains styling used to display the banner, gameboard, possibilities board and score
module TerminalInterface
  def display_title
    puts <<~HEREDOC
      -----------------------------------------------------
      ----------------- TIC - TAC - TOE -------------------
      -----------------------------------------------------
    HEREDOC
  end

  def display_board
    puts <<-HEREDOC
            |   |        |       |    |
          #{game_board.board[:A1]} | #{game_board.board[:B1]} | #{game_board.board[:C1]}      |    #{possibilities.board[:A1]} | #{possibilities.board[:B1]} | #{possibilities.board[:C1]}
        ----|---|----    |   ----|----|----
          #{game_board.board[:A2]} | #{game_board.board[:B2]} | #{game_board.board[:C2]}      |    #{possibilities.board[:A2]} | #{possibilities.board[:B2]} | #{possibilities.board[:C2]}
        ----|---|----    |   ----|----|----
          #{game_board.board[:A3]} | #{game_board.board[:B3]} | #{game_board.board[:C3]}      |    #{possibilities.board[:A3]} | #{possibilities.board[:B3]} | #{possibilities.board[:C3]}
            |   |        |       |    |
    HEREDOC
  end

  def display_score
    puts <<~HEREDOC
      -----------------------------------------------------
      ---- Score: --- #{p1.name}: #{p1.score} -- #{p2.name}: #{p2.score} ------
      -----------------------------------------------------
    HEREDOC
  end
end

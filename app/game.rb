class Game
  attr_reader :board, :player1, :player2
  attr_accessor :winner, :current_player

  def initialize(board_size=3)
    @board = Board.new(board_size)
    @board.build
  end

  def select_player(player_response)
    if player_response == 1
      player1 = Player.new(:x, "human", "Player 1")
      player2 = Player.new(:o, "computer", "Player 2")
    else
      player1 = Player.new(:x, "computer", "Player 1")
      player2 = Player.new(:o, "human", "Player 2")
    end

    @player1 = player1
    @player2 = player2
  end

  def start
    players = [player1, player2]
    @current_player = players.sample
  end

  def turn
    board.display
    turn_complete = false
    until turn_complete
      puts "It's #{current_player.name}'s turn."
      puts "Select a position."
      move = current_player.prompt(board)
      if board.move_is_valid?(move)
        cell = Cell.find_by_position(move)
        cell.set_value(current_player.marker)
        turn_complete = true
      else
        puts "Move is invalid. Try again."
      end
    end
    switch_player unless over?
  end

  def over?
    winner? || draw?
  end

  def end
    if winner?
      puts winner_message
    else
      puts draw_message
    end
  end

  def winner_message
    puts "#{current_player.name} wins"
  end

  def draw_message
    "You tied"
  end

  def reset
    Cell.clear
  end

  private

  def switch_player
    if self.current_player == player1
      self.current_player = player2
    else
      self.current_player = player1
    end
  end

  def winner?
    board.winner?(current_player)
  end

  def draw?
    board.full?
  end
end

class Game
  attr_reader :board, :player1, :player2
  attr_accessor :winner, :current_player

  def initialize(player1, player2)
    @board = Board.new
    @board.build
    @player1 = player1
    @player2 = player2
  end

  def start
    @current_player = player1
    board.current_player = current_player
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

  def winner?
    board.row_win? || board.column_win? || board.diagonal_win?
  end

  def draw?
    board.full?
  end

  def switch_player
    if self.current_player == player1
      self.current_player = player2
    else
      self.current_player = player1
    end
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
end

class ComputerPlayer < Player

  def prompt(board)
    select_move(board)
  end

  def role
    "computer"
  end
  
  private

  def select_move(board)
    board.available_cells.sample
  end

end

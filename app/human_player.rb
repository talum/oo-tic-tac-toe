class HumanPlayer < Player

  def prompt(board)
    gets.chomp.to_i
  end

  def role
    "human"
  end

end

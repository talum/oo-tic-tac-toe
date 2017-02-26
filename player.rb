class Player
  attr_reader :marker, :role, :name

  def initialize(marker, role, name)
    @marker = marker
    @role   = role
    @name   = name
  end

  def self.responses
    [1, 2]
  end

  def human?
    role == "human"
  end

  def prompt(board)
    if self.human?
      gets.chomp.to_i
    else
      select_move(board)
    end
  end

  def select_move(board)
    board.available_cells.sample
  end
end

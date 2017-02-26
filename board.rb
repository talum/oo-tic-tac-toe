class Board
  attr_reader :state, :size, :current_player

  def initialize(size=3)
    @size = size
  end

  def build
    generate_initial_state
    generate_map
  end

  def display
    state.each do |row|
      print "|"
      row.each { |cell| print " #{cell.display} | " }
      puts "\n---------------"
    end
  end

  def move_is_valid?(player_response)
    available_cells.include?(player_response)
  end

  def available_cells
    Cell.available_cell_positions
  end

  def winner?(current_player)
    @current_player = current_player
    row_win? || column_win? || diagonal_win?
  end

  def full?
    available_cells.none?
  end

  private

  def generate_initial_state
    @state = Array.new(size) { Array.new(size) { Cell.new } }
  end

  def generate_map
    state.flatten.each.with_index(1) do |cell, i|
      cell.position = i
    end
  end

  def row_win?
    state.any? do |row|
      row.all?{|cell| cell.value == current_player.marker}
    end
  end

  def column_win?
    state.transpose.any? do |column|
      column.all?{|cell| cell.value == current_player.marker}
    end
  end

  def left_diagonal_win?
   left_start = 1
   left_positions = []
   1.upto(size) do |i|
     left_positions << (left_start + (i-1)*(size+1))
   end

   left_diagonal_cells = Cell.where_positions(left_positions)
  left_diagonal_cells.all?{|cell| cell.value == current_player.marker}
   
  end

  def right_diagonal_win?
   right_start = size
   right_positions = []
   1.upto(size) do |i|
     right_positions << (right_start + (i-1)*(size-1))
   end
   right_diagonal_cells = Cell.where_positions(right_positions)

  right_diagonal_cells.all?{|cell| cell.value == current_player.marker}
  end

  def diagonal_win?
    left_diagonal_win? || right_diagonal_win?
  end

end


class Board
  attr_reader :size, :current_player
  attr_accessor :state

  def initialize(size=3)
    @size = size
  end

  def build
    generate_initial_state
    generate_map
  end

  def display
    puts "\n"
    puts "\n"
    state.each do |row|
      print "|"
      row.each { |cell| print " #{cell.display} | " }
      puts "\n---------------"
    end
    puts "\n"
    puts "\n"
  end

  def move_is_valid?(player_response)
    available_cells.include?(player_response)
  end

  def available_cells
    Cell.available_cell_positions
  end

  def winner?(current_player)
    # We'll check for rows, columns, and diagonal wins here.
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
    # Since the board is just an array of arrays, we can do a tranpose
    # operation to turn the rows into columns and perform the same check as
    # we did for rows.
    state.transpose.any? do |column|
      column.all?{|cell| cell.value == current_player.marker}
    end
  end

  def left_diagonal_win?
    # The diagonal wins are calculated dynamically by finding the 
    # arithmetic pattern that each cell index maintains
    # e.g. In a 3X3 array, the positions to check would be 1, 5, 9
    # This is an arithmetic sequence, so by finding the pattern for the left
    # diagonal, we can simply check those cells, regardless of the grid
    # size.
    left_start = 1
    left_positions = []
    1.upto(size) do |i|
      left_positions << (left_start + (i-1)*(size+1))
    end

    left_diagonal_cells = Cell.where_positions(left_positions)
    left_diagonal_cells.all?{|cell| cell.value == current_player.marker}
  end

  def right_diagonal_win?
    # The right diagonal wins are calculated similarly, but the pattern
    # begins with the rightmost corner, the cell whose index happens to be
    # the size of the grid. The pattern for finding this arithmetic sequence
    # happens to be the size minus 1.
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


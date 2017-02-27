class Cell
  attr_reader :value
  attr_accessor :position

  def initialize(value="", position="")
    @value = value
    @position = position
    self.class.all << self
  end
  
  def self.all
    @@all ||= []
  end
  
  def self.clear
    @@all = []
  end

  def self.available_cells
    self.all.select{|cell| cell.available?}
  end

  def self.available_cell_positions
    available_cells.collect{|cell| cell.position}
  end

  def self.find_by_position(position)
    self.all.find{ |cell| cell.position == position}
  end

  def self.where_positions(positions)
    self.all.select{ |cell| positions.include?(cell.position) }
  end

  def set_value(marker)
    @value = marker
  end

  def available?
    default?
  end

  def display
    default? ? position : value
  end

  private
  def default?
    value == ""
  end

end

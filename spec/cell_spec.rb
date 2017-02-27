require_relative '../app/board.rb'
require_relative '../app/cell.rb'
require_relative '../app/game.rb'
require_relative '../app/player.rb'

RSpec.describe Cell do
  before(:each) do
    Cell.clear
  end

  describe ".all" do
    it "returns an array" do
      expect(Cell.all).to be_kind_of(Array)
    end
    
    it "returns an array of all the cells initialized" do
      cell1 = Cell.new
      cell2 = Cell.new
      expect(Cell.all.count).to eq(2)
    end
  end

  describe ".clear" do
    it "clears out the .all array" do
      cell1 = Cell.new
      cell2 = Cell.new
      Cell.clear
      expect(Cell.all).to be_empty
    end
  end

  describe ".available_cells" do
    it "returns cells that are available" do
      cell1 = Cell.new(:x, 1)
      cell2 = Cell.new("", 2)
      expect(Cell.available_cells).to contain_exactly(cell2)
    end
  end

  describe ".available_cell_positions" do
    it "returns the positions of available cells" do
      cell1 = Cell.new(:x, 1)
      cell2 = Cell.new("", 2)
      expect(Cell.available_cell_positions).to contain_exactly(2)
    end
  end

  describe ".find_by_position" do
    it "returns the cell with the correct position" do
      cell1 = Cell.new("", 1)
      cell2 = Cell.new("", 2)
      expect(Cell.find_by_position(2)).to eq(cell2)
    end
  end

  describe ".where_position" do
    it "returns an array of cells that correspond to the passed in positions" do
      cell1 = Cell.new("", 1)
      cell2 = Cell.new("", 2)
      cell3 = Cell.new("", 3)
      expect(Cell.where_positions([2,3])).to contain_exactly(cell2, cell3)
    end
  end

  describe "#set_value" do
    it "sets the value of the cell to the passed in marker" do
      cell1 = Cell.new("", 1)
      cell1.set_value(:x)
      expect(cell1.value).to eq(:x)
    end
  end

  describe "#available?" do
    it "returns whether or not the cell has a non-default value" do
      expect(Cell.new.available?).to eq(true)
    end

    it "returns false for cells with set values" do
      cell1 = Cell.new
      cell1.set_value(:x)
      expect(cell1.available?).to eq(false)
    end
  end
end

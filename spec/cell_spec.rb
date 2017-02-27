require_relative '../app/board.rb'
require_relative '../app/cell.rb'
require_relative '../app/game.rb'
require_relative '../app/player.rb'

RSpec.describe Cell do
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

require_relative '../app/board.rb'
require_relative '../app/cell.rb'
require_relative '../app/game.rb'
require_relative '../app/player.rb'
require_relative '../app/human_player.rb'
require_relative '../app/computer_player.rb' 

RSpec.describe HumanPlayer do
  describe ".initialize" do
    it "assigns a marker" do
      player = HumanPlayer.new(:x, "Player 1")
      expect(player.marker).to eq(:x)
    end

    it "assigns a name" do
      player = HumanPlayer.new(:x, "Player 1")
      expect(player.name).to eq("Player 1")
    end
  end

  describe ".role" do
    it "returns human" do
      player = HumanPlayer.new(:x, "Player 1")
      expect(player.role).to eq("human")
    end
  end

end

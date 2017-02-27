require_relative '../app/board.rb'
require_relative '../app/cell.rb'
require_relative '../app/game.rb'
require_relative '../app/player.rb'

RSpec.describe Game do
  describe ".initialize" do
    it "builds a board" do
      game = Game.new
      expect(game.board).to be_kind_of(Board)
    end
  end

  describe ".select_player" do
    it "creates a human player based on user response" do
      game = Game.new
      game.select_player(1)
      expect(game.player1.role).to eq("human") 
    end

    it "creates a computer player based on user response" do
      game = Game.new
      game.select_player(1)
      expect(game.player2.role).to eq("computer") 
    end
  end

  describe ".start" do
    it "sets the current player randomly" do
      game = Game.new
      game.select_player(1)
      game.start
      expect(game.current_player).to_not be_nil
    end
  end
end

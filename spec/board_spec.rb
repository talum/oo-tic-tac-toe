require_relative '../app/board.rb'
require_relative '../app/cell.rb'
require_relative '../app/game.rb'
require_relative '../app/player.rb'
require_relative '../app/human_player.rb'
require_relative '../app/computer_player.rb'

RSpec.describe Board do
  describe "#build" do
    it "creates a board stored in state" do
      board = Board.new
      board.build
      expect(board.state).to be_kind_of(Array)
    end

    it "builds a 3x3 array by default" do
      board = Board.new
      board.build
      expect(board.state.flatten.count).to eq(9) 
    end

    it "can build an nxn cell array" do
      size = 4
      board = Board.new(size)
      board.build
      expect(board.state.flatten.count).to eq(size*size)
    end

    it "builds a board that holds cells" do
      board = Board.new
      board.build
      expect(board.state.first.first).to be_kind_of(Cell)
    end
  end

  describe "#winner" do
    context "when there is a 3x3 board" do
      it "can detect a row win" do
        player1 = Player.new(:x, "Player 1")
        board = Board.new
        Cell.clear
        board.state = [
          [Cell.new(:x, 1), Cell.new(:x, 2), Cell.new(:x, 3)],
          [Cell.new(:o, 4), Cell.new(:o, 5), Cell.new(:o, 6)],
          [Cell.new(:o, 7), Cell.new(:o, 8), Cell.new(:x, 9)]
        ]
        expect(board.winner?(player1)).to eq(true)
      end

      it "can detect a column win" do
        player1 = Player.new(:x, "Player 1")
        board = Board.new
        Cell.clear
        board.state = [
          [Cell.new(:x, 1), Cell.new(:x, 2), Cell.new(:o, 3)],
          [Cell.new(:x, 4), Cell.new(:o, 5), Cell.new(:o, 6)],
          [Cell.new(:x, 7), Cell.new(:o, 8), Cell.new(:x, 9)]
        ]
        expect(board.winner?(player1)).to eq(true)
      end

      it "can detect a left diagonal win" do
        player1 = Player.new(:x, "Player 1")
        board = Board.new
        Cell.clear
        board.state = [
          [Cell.new(:x, 1), Cell.new(:x, 2), Cell.new(:o, 3)],
          [Cell.new(:o, 4), Cell.new(:x, 5), Cell.new(:o, 6)],
          [Cell.new(:x, 7), Cell.new(:o, 8), Cell.new(:x, 9)]
        ]
        expect(board.winner?(player1)).to eq(true)
      end

      it "can detect a right diagonal win" do
        player1 = Player.new(:x, "Player 1")
        board = Board.new
        Cell.clear
        board.state = [
          [Cell.new(:o, 1), Cell.new(:x, 2), Cell.new(:x, 3)],
          [Cell.new(:o, 4), Cell.new(:x, 5), Cell.new(:o, 6)],
          [Cell.new(:x, 7), Cell.new(:o, 8), Cell.new(:x, 9)]
        ]
        expect(board.winner?(player1)).to eq(true)
      end
    end

    context "when there is a 4x4 board" do
      it "can detect a row win" do
        player1 = Player.new(:x, "Player 1")
        board = Board.new
        Cell.clear
        board.state = [
          [Cell.new(:x, 1),  Cell.new(:x, 2),  Cell.new(:x, 3),  Cell.new(:x, 4)],
          [Cell.new(:o, 5),  Cell.new(:o, 6),  Cell.new(:o, 7),  Cell.new(:x, 8)],
          [Cell.new(:o, 9),  Cell.new(:o, 10), Cell.new(:x, 11), Cell.new(:x, 12)],
          [Cell.new(:o, 13), Cell.new(:o, 14), Cell.new(:x, 15), Cell.new(:o, 16)]
        ]
        expect(board.winner?(player1)).to eq(true)
      end

      it "can detect a column win" do
        player1 = Player.new(:x, "Player 1")
        board = Board.new
        Cell.clear
        board.state = [
          [Cell.new(:x, 1),  Cell.new(:x, 2),  Cell.new(:o, 3),  Cell.new(:x, 4)],
          [Cell.new(:o, 5),  Cell.new(:x, 6),  Cell.new(:o, 7),  Cell.new(:x, 8)],
          [Cell.new(:x, 9),  Cell.new(:x, 10), Cell.new(:x, 11), Cell.new(:x, 12)],
          [Cell.new(:o, 13), Cell.new(:x, 14), Cell.new(:x, 15), Cell.new(:o, 16)]
        ]
        expect(board.winner?(player1)).to eq(true)
      end

      it "can detect a left diagonal win" do
        player1 = Player.new(:x, "Player 1")
        board = Board.new(4)
        Cell.clear
        board.state = [
          [Cell.new(:x, 1),  Cell.new(:x, 2),  Cell.new(:o, 3),  Cell.new(:x, 4)],
          [Cell.new(:o, 5),  Cell.new(:x, 6),  Cell.new(:o, 7),  Cell.new(:x, 8)],
          [Cell.new(:x, 9),  Cell.new(:o, 10), Cell.new(:x, 11), Cell.new(:o, 12)],
          [Cell.new(:o, 13), Cell.new(:x, 14), Cell.new(:x, 15), Cell.new(:x, 16)]
        ]
        expect(board.winner?(player1)).to eq(true)
      end

      it "can detect a right diagonal win" do
        player1 = Player.new(:x, "Player 1")
        board = Board.new(4)
        Cell.clear
        board.state = [
          [Cell.new(:x, 1),  Cell.new(:x, 2),  Cell.new(:o, 3),  Cell.new(:x, 4)],
          [Cell.new(:o, 5),  Cell.new(:o, 6),  Cell.new(:x, 7),  Cell.new(:x, 8)],
          [Cell.new(:x, 9),  Cell.new(:x, 10), Cell.new(:x, 11), Cell.new(:o, 12)],
          [Cell.new(:x, 13), Cell.new(:x, 14), Cell.new(:o, 15), Cell.new(:x, 16)]
        ]
        expect(board.winner?(player1)).to eq(true)
      end
    end
  end
end

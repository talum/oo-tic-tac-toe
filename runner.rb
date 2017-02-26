require 'pry'
require_relative './game.rb'
require_relative './cell.rb'
require_relative './board.rb'
require_relative './player.rb'

puts "Welcome to Tic-Tac-Toe"
puts "Would you like to be Player 1 (x) or Player 2 (o)? Enter 1 or 2"
player_selected = false
until player_selected
  player = gets.chomp.to_i
  if !Player.responses.include?(player)
    puts "Sorry, I don't recognize that command."
  else
    player_selected = true
    if player == 1
      player1 = Player.new(:x, "human", "Player 1")
      player2 = Player.new(:o, "computer", "Player 2")
    else
      player1 = Player.new(:x, "computer", "Player 1")
      player2 = Player.new(:o, "human", "Player 2")
    end
  end
end
puts "Great, let's get started."
game = Game.new(player1, player2)
game.start
until game.over?
  game.turn
end
game.board.display
puts game.end
puts "Would you like to play again? Enter: Yn"
response = gets.chomp.downcase
if response == "y"
  # clear out the board
else
  exit
end


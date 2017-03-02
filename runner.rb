require 'pry'
require_relative './app/game.rb'
require_relative './app/cell.rb'
require_relative './app/board.rb'
require_relative './app/player.rb'
require_relative './app/human_player.rb'
require_relative './app/computer_player.rb'

puts "Welcome to Tic-Tac-Toe"

playing = true
while playing
  puts "What size board would you like to play? Enter 3 or higher."
  board_size = gets.chomp.to_i
  game = Game.new(board_size)

  puts "Would you like to be Player 1 (x) or Player 2 (o)? Enter 1 or 2"
  player_selected = false
  until player_selected
    player = gets.chomp.to_i
    if !Player.responses.include?(player)
      puts "Sorry, I don't recognize that command."
    else
      player_selected = true
      game.select_player(player)
    end
  end
  puts "Great, let's get started."

  game.start
  until game.over?
    game.turn
  end
  game.board.display
  puts game.end

  puts "Would you like to play again? Enter: Yn"
  response = gets.chomp.downcase
  if response == "n"
    playing = false 
  else
    game.reset
  end
end


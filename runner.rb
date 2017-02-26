require 'pry'
require_relative './game.rb'
require_relative './cell.rb'
require_relative './board.rb'
require_relative './player.rb'

puts "Welcome to Tic-Tac-Toe"

playing = true
while playing
  game = Game.new
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


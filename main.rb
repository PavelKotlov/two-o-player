require './classes/player.rb'
require './classes/game.rb'
require './classes/question.rb'
require './classes/turn'


game = Game.new
while game.in_progress
  game.play_turn
  game.check_winner
  puts "\n"
end
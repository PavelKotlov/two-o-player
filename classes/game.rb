class Game
  attr_accessor :in_progress, :player1, :player2, :winner, :round

  def initialize
    player1_name = self.ask_player_name "Player1: Please enter your name"
    @player1 = Player.new player1_name
    player2_name = self.ask_player_name "Player2: Please enter your name"
    @player2 = Player.new player2_name
    
    @in_progress = true
    @winner = nil
    @round = 1

    self.pick_starter
    puts "----- LET THE GAMES BEGIN -----"
  end

  def ask_player_name(prompt)
    puts prompt
    name = gets.chomp

    while name.empty?
      puts "Oh oh! Try again"
      puts prompt
      name = gets.chomp
    end

    avatars = ["\u{1F47B}", "\u{1F608}", "\u{1F921}", "\u{1F920}", "\u{1F47D}", 
    "\u{1F47E}", "\u{1F916}", "\u{1F984}", 
    "\u{1F480}"]

    rand_index = rand(0..8)
    "#{name} #{avatars[rand_index]}"
  end

  def pick_starter
    starting_player = rand(1..2)
    if starting_player == 1
      self.player1.turn = true
    else
      self.player2.turn = true
    end
  end
 
  def play_turn
    Turn.new(Question.new, [self.player1, self.player2], self.round)
    self.round += 1
  end
  
  def check_winner
    if self.player1.lives == 0
      self.winner = self.player2
      self.stop
    elsif self.player2.lives == 0
      self.winner = self.player1
      self.stop
    end
  end
  
  def stop
    self.in_progress = false
    puts "---------- GAME OVER ----------"
    puts "#{winner.name} wins with a score of #{winner.lives}/3 \nGood bye!"
  end
end

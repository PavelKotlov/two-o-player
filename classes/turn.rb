class Turn
  attr_accessor :current_player, :next_player, :current_question
  attr_reader :players, :round

  def initialize(question, players, round)
    @current_question = question
    @round = round
    @players = players
    if players[0].turn
      @current_player = players[0]
      @next_player = players[1]
    else
      @current_player = players[1]
      @next_player = players[0]
    end

    self.ask_question
    self.check_answer
  end

  def ask_question
    puts "------- ROUND #{self.round} --------"
    puts "#{self.current_player.name}: #{self.current_question.gen_question}"
  end

  def check_answer
    player_answer = gets.chomp.to_i
    if player_answer == self.current_question.answer
      puts "#{self.current_player.name}: YES! You are correct."
    else
      self.current_player.lives -= 1
      puts "#{self.current_player.name}: Seriously? No!"
    end

    self.current_player.turn = false
    self.next_player.turn = true
    puts "#{self.players[0].name} #{self.players[0].lives}/3 vs #{self.players[1].name} #{self.players[1].lives}/3"    
  end

end

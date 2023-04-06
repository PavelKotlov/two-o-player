class Question
  attr_reader :numOne, :numTwo, :answer

  def initialize
    @numOne = rand(1..20)
    @numTwo = rand(1..20)
    @answer = numOne + numTwo
  end

  def gen_question
    "What does #{numOne} plus #{numTwo} equal?"
  end

end
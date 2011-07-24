class Question
  attr_accessor :question, :answers, :correct_answer

  def initialize(question, answers, correct_answer)
    @question = question
    @answers = answers
    @correct_answer = correct_answer
  end
end

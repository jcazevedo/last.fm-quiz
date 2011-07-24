class QuizController < ApplicationController
  def index
  end

  def questions
    if params[:id].to_i == 1
      user = User.new(params[:user])
      session[:questions] = user.generate_questions
      session[:correct_answers] = 0
      session[:number_questions] = session[:questions].length
    end

    @questions = session[:questions]
    puts @questions
    if params[:id].to_i != 1 && 
        params[:answer].to_i == @questions[params[:id].to_i-2].correct_answer
      session[:correct_answers] = session[:correct_answers].to_i + 1
    end

    if params[:id].to_i > @questions.length
      @correct_answers = session[:correct_answers]
      @number_of_questions = session[:number_questions]
    else
      @number = params[:id].to_i
      @question = @questions[params[:id].to_i-1]
    end
  end
end

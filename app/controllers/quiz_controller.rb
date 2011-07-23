class QuizController < ApplicationController
  def index
  end

  def start
    @user = User.new(params[:user])
  end
end

require 'rubygems'
require 'oauth'
require 'twitter'

CTOKEN = 'FsYvtqQ7zFb2dXXIinRLg';
CSECRET = 'N5lxmxZIxCug5FBBYSRsfuQObGLPpRJWNsjJeO5Lo';

class QuizController < ApplicationController
  def index
    session[:questions] = nil
    session[:current_question] = nil
    session[:correct_answers] = 0
  end

  def questions
    if params[:id].to_i == 1 && session[:questions].nil?
      user = User.new(params[:user])
      session[:username] = params[:user]
      session[:questions] = user.generate_questions
      session[:correct_answers] = 0
      session[:number_questions] = session[:questions].length
      session[:current_question] = 1
    end

    if !params[:answer].nil?
      session[:current_question] = session[:current_question].to_i + 1      
    end

    if params[:id].to_i != session[:current_question].to_i
      redirect_to :action => "reset"
    end

    @questions = session[:questions]
    if !params[:answer].nil? &&
        params[:answer].to_i == @questions[params[:id].to_i-2].correct_answer
      session[:correct_answers] = session[:correct_answers].to_i + 1
    end

    if params[:id].to_i > @questions.length
      redirect_to :action => "final"
    else
      @number = params[:id].to_i
      @question = @questions[params[:id].to_i-1]
    end
  end

  def final
    @correct_answers = session[:correct_answers]
    @number_of_questions = session[:number_questions]

    session[:questions] = nil
    session[:current_question] = nil
  end

  def reset
  end

  def tweet
    auth = request.env["omniauth.auth"]
    
    Twitter.configure do |config|
      config.consumer_key = CTOKEN
      config.consumer_secret = CSECRET
      config.oauth_token = auth["credentials"]["token"]
      config.oauth_token_secret = auth["credentials"]["secret"]
    end

    Twitter.update("Just got "+session[:correct_answers].to_s+"/10 on "+session[:username].to_s+"'s library #lastfmquiz #geekslab")
    redirect_to :action => "index"
  end
end

# app/controllers/home_controller.rb
class HomeController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @flashcards = Flashcard.all
    @user_flashcards = current_user.flashcards if user_signed_in?
    @word = Word.first
  
    if user_signed_in?
      @user_flashcards = current_user.flashcards
    else
      @user_flashcards = []
    end
  end

  def flip
    @word = Word.find(params[:id])
    render partial: 'flip'
  end

  def all_users
    @users = User.all
  end

  def all_flashcards
    @flashcards = Flashcard.all
  end

  def my_flashcards
    @user_flashcards = current_user.flashcards
  end
end

# app/controllers/home_controller.rb
class HomeController < ApplicationController
    before_action :authenticate_user!, except: [:index]
  
    def index
      # Головна сторінка без обов'язкової аутентифікації
    end
  
    def all_users
      @users = User.all
    end
  
    def all_flashcards
      @flashcards = Flashcard.all
    end
  
    def my_flashcards
      @flashcards = current_user.flashcards
    end
  end
  
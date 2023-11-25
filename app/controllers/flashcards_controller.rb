# app/controllers/flashcards_controller.rb
class FlashcardsController < ApplicationController
    before_action :require_login
    before_action :set_flashcard, only: [:show, :edit, :update, :destroy]
  
    def index
      @flashcards = current_user.flashcards
      puts "DEBUG: #{@flashcards.inspect}"
    end
  
    def show
      # Додайте код, який вам потрібен для відображення окремої флеш-картки
    end
  
    def new
      @flashcard = Flashcard.new
    end
  
    def create
      @flashcard = current_user.flashcards.build(flashcard_params)
      if @flashcard.save
        redirect_to flashcards_path, notice: 'Flashcard created successfully.'
      else
        puts "DEBUG: Flashcard save failed"
        render :new
      end
    end
  
    def edit
      # Використовуйте вже існуючий шаблон для форми редагування
    end
  
    def update
      if @flashcard.update(flashcard_params)
        redirect_to flashcards_path, notice: 'Flashcard updated successfully.'
      else
        render :edit
      end
    end
  
    def destroy
      @flashcard.destroy
      redirect_to flashcards_path, notice: 'Flashcard deleted successfully.'
    end
  
    private
  
    def set_flashcard
      @flashcard = Flashcard.find(params[:id])
    end
  
    def flashcard_params
      params.require(:flashcard).permit(:term, :translation)
    end
  end
  
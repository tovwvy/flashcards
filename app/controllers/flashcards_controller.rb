# app/controllers/flashcards_controller.rb
require 'http'

class FlashcardsController < ApplicationController
  before_action :require_login
  before_action :set_flashcard, only: [:show, :edit, :update, :destroy]

  def index
    @flashcards = current_user.flashcards
    puts "DEBUG: #{@flashcards.inspect}"
  end

  def my_flashcards
    @flashcards = current_user.flashcards
    render 'index'
  end

  def learn
    @flashcards = current_user.flashcards
    @current_index = params[:index].to_i
    @current_flashcard = @flashcards[@current_index]
  end

  def show
    load_flashcard_and_definition
  end

  def new
    @flashcard = Flashcard.new
  end

  def create
    existing_flashcard = current_user.flashcards.find_by(term: flashcard_params[:term])

    if existing_flashcard
      redirect_to my_flashcards_path, alert: 'Флеш-карту з таким терміном вже існує.'
    else
      @flashcard = current_user.flashcards.build(flashcard_params)

      respond_to do |format|
        if @flashcard.save
          format.html { redirect_to my_flashcards_path, notice: 'Флеш-карту успішно створено.' }
          format.json { render :show, status: :created, location: @flashcard }
        else
          format.html { render :new }
          format.json { render json: @flashcard.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def edit
    # Use the existing template for the edit form
  end

  def update
    if @flashcard.update(flashcard_params)
      redirect_to flashcards_path, notice: 'Flashcard was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @flashcard.destroy
    redirect_to flashcards_path, notice: 'Флеш-картка успішно видалена.'
  end

  private

  def set_flashcard
    @flashcard = Flashcard.find(params[:id])
  end

  def flashcard_params
    params.require(:flashcard).permit(:term, :translation, :learning, :word_id)
  end
  
  

  def load_flashcard_and_definition
    @flashcard = Flashcard.find(params[:id])
    @word = params[:word]
    
    # Отримання визначення з API Merriam-Webster
    @definition = fetch_definition(@word) if @word.present?
  end

  def fetch_definition(word)
    base_url = 'https://www.dictionaryapi.com/api/v3/references/learners/json/'
    api_key = '8d69cd2f-5a41-4730-8aba-a5ba6a0d6031'
    
    response = HTTP.get("#{base_url}#{word}?key=#{api_key}")
    definitions = JSON.parse(response)
    
    Rails.logger.info("API Response: #{definitions.inspect}")
    
    # Вилучення відповідної інформації з відповіді API
    if definitions.is_a?(Array)
      definition = definitions.first['shortdef'].join(', ') if definitions.first['shortdef'].present?
    end
    
    definition || 'Визначення недоступне'
  rescue HTTP::Error => e
    Rails.logger.error("Помилка отримання визначення: #{e}")
    'Помилка отримання визначення'
  end
end

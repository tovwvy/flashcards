# app/models/word.rb
class Word < ApplicationRecord
  has_many :flashcards
  validates :word_en, presence: true
  validates :translation, presence: true
end

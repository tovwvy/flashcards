# app/models/word.rb
class Word < ApplicationRecord
    has_many :flashcards
    attribute :translation, :string
  end
  
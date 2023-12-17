# app/models/flashcard.rb
class Flashcard < ApplicationRecord
  belongs_to :user
  belongs_to :word, optional: true
  validates :learning, inclusion: { in: [true, false] }
  attribute :translation, :string




  def definition
    # Ваш існуючий код для визначення, можливо, зазначте власні умови або залиште порожнім, якщо не потрібно
  end
end

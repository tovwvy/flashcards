class Flashcard < ApplicationRecord
  belongs_to :user
  belongs_to :word, optional: true
  attribute :translation, :string
  validates :learning, inclusion: { in: [true, false] }

  def definition
    # Ваш існуючий код для визначення, можливо, зазначте власні умови або залиште порожнім, якщо не потрібно
  end
end

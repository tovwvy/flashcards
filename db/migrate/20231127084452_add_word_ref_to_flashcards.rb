class AddWordRefToFlashcards < ActiveRecord::Migration[7.1]
  def change
    add_reference :flashcards, :word, null: true, foreign_key: true
  end
end

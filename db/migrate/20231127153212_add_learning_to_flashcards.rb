class AddLearningToFlashcards < ActiveRecord::Migration[7.1]
  def change
    add_column :flashcards, :learning, :boolean
  end
end

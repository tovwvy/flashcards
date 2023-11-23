class CreateFlashcards < ActiveRecord::Migration[7.1]
  def change
    create_table :flashcards do |t|
      t.string :term
      t.text :definition
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end

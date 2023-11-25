class CreateWords < ActiveRecord::Migration[7.1]
  def change
    create_table :words do |t|
      t.string :word_en
      t.string :translation_uk

      t.timestamps
    end
  end
end

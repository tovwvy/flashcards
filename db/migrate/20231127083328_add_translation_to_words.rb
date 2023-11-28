class AddTranslationToWords < ActiveRecord::Migration[7.1]
  def change
    add_column :words, :translation, :string
  end
end

class Flashcard < ApplicationRecord
  belongs_to :user
end
# app/models/flashcard.rb

class Flashcard < ApplicationRecord
  def definition
    OxfordDictionaries.get_definition(word)
  end
end
# app/models/flashcard.rb
class Flashcard < ApplicationRecord
  belongs_to :word
end

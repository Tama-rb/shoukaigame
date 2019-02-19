class Question < ApplicationRecord
  include SelectAWordAtRandom

  enum category: { conjunction: 0, question: 1, theme: 2, programming: 3 }
  
  validates :content, uniqueness: true
end


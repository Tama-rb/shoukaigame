module SelectAWordAtRandom
  extend ActiveSupport::Concern

  module ClassMethods
    def select_a_word_at_random
      random = Random.new
      count = self.all.count
      
      record_id = random.rand(1..self.count)

      self.find(record_id)
    end
  end
end

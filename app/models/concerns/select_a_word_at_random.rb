module SelectAWordAtRandom
  extend ActiveSupport::Concern

  module ClassMethods
    OFFSET = 1
    def pick_up_at_random(default = 0)
      binding.pry
      offset(rand(self.count - default)).first
    end

    def sample_other_than_latest
      return pick_up_at_random if count.zero?

      pick_up_at_random(OFFSET)
    end
  end
end

module SelectAWordAtRandom
  extend ActiveSupport::Concern

  def increment_impressions
    update(impressions: impressions + 1)
  end

  module ClassMethods
    def select_a_word_at_random
      record = all.sample_other_than_latest
      record.increment_impressions

      record
    end

    def sample_other_than_latest
      count > 1 ? first(count - 1).sample : sample
    end
  end
end

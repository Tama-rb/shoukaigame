module SelectAWordAtRandom
  extend ActiveSupport::Concern

  def increment_impressions
    update(impressions: impressions + 1)
  end

  module ClassMethods
    def select_a_word_at_random
      record = find(random_id)
      record.increment_impressions
      record
    end

    private

      def random_id
        random = Random.new
        random.rand(1..count)
      end
  end
end

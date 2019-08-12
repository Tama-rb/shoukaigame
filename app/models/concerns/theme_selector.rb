module ThemeSelector
  extend ActiveSupport::Concern

  module ClassMethods
    OFFSET = 1
    def pick_up_at_random(default = 0)
      offset(rand(count - default)).first
    end

    def pluck_a_theme_from_all_or_offset
      return pick_up_at_random if count.zero?

      pick_up_at_random(OFFSET)
    end
  end
end

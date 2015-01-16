require_relative 'base'

#
# Provides methods for ListView widgets
#
class ListView < Base
  class << self
    def count(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :count).first
    end

    def scroll_to_index(aIndex)
      q = parse_query(nil)
      Calabash::Android::Operations.query(q, smoothScrollToPosition: aIndex)
    end
  end
end

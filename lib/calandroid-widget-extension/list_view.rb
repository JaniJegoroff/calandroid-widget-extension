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
  end
end

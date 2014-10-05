require_relative 'base'

#
# Provides methods for TextView widgets
#
class TextView < Base
  class << self
    def text(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :text).first
    end
  end
end

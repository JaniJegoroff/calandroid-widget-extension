require_relative 'base'

class TextView < Base
  class << self
    def text(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :text).first
    end
  end
end

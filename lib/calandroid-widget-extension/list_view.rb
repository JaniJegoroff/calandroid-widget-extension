require_relative 'base'

class ListView < Base
  class << self
    def count(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :count).first
    end
  end
end

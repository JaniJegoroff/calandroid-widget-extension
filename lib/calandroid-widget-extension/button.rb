require_relative 'base'

class Button < Base
  class << self
    def text(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :text).first
    end

    def selected?(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :selected).first.to_boolean
    end
  end
end

require_relative 'base'

class ImageButton < Base
  class << self
    def selected?(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :selected).first.to_boolean
    end

    def activated?(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :activated).first.to_boolean
    end
  end
end

require_relative 'base'

#
# Provides methods for ImageButton widgets
#
class ImageButton < Base
  class << self
    def selected?(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :selected).first.to_boolean
    end

    def activated?(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q, :activated).first.to_boolean
    end
  end
end

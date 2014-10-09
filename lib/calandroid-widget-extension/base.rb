include Calabash::Android::Operations

#
# Base class for widgets
#
class Base
  class << self
    def class_name
      name
    end

    def property(*aParams)
      Calabash::Android::Operations.query(class_name, *aParams)
    end

    alias_method :prop, :property
    alias_method :p, :property

    def touch(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Android::Operations.touch(q)
    end

    alias_method :tap, :touch

    def query(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q)
    end

    alias_method :q, :query

    def flash(aIdOrIndex = nil)
      q = parse_query(aIdOrIndex)
      Calabash::Android::Operations.flash(q)
    end

    alias_method :f, :flash

    def id
      property(:id)
    end

    def help
      public_methods(false)
    end

    alias_method :h, :help

    def parse_query(aIdOrIndex)
      fail_if_invalid(aIdOrIndex)

      if aIdOrIndex.nil?
        q = "#{class_name}"
      else
        q = aIdOrIndex.is_a?(String) ? "#{class_name} marked:'#{aIdOrIndex}'" : "#{class_name} index:#{aIdOrIndex}"
      end

      q
    end

    private

    def fail_if_invalid(aParam)
      Kernel.fail('invalid parameter') unless aParam.nil? ||
                                              aParam.is_a?(String) ||
                                              aParam.is_a?(Integer)
    end
  end
end

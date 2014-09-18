include Calabash::Android::Operations

class Base
  class << self
    def class_name
      name
    end

    def property(*aParams)
      Calabash::Android::Operations.query(self.class_name, *aParams)
    end

    alias_method :prop, :property
    alias_method :p, :property

    def touch(aIdOrIndex=nil)
      q = self.parse_query(aIdOrIndex)
      Calabash::Android::Operations.touch(q)
    end

    alias_method :tap, :touch

    def query(aIdOrIndex=nil)
      q = parse_query(aIdOrIndex)
      Calabash::Android::Operations.query(q)
    end

    alias_method :q, :query

    def flash(aIdOrIndex=nil)
      q = parse_query(aIdOrIndex)
      Calabash::Android::Operations.flash(q)
    end

    alias_method :f, :flash

    def id
      self.property(:id)
    end

    def help
      public_methods(false)
    end

    alias_method :h, :help

    def parse_query(aIdOrIndex)
      raise_if_invalid(aIdOrIndex)

      if aIdOrIndex.nil?
        qStr = "#{self.class_name}"
      else
        qStr = aIdOrIndex.is_a?(String) ? "#{self.class_name} marked:'#{aIdOrIndex}'" : "#{self.class_name} index:#{aIdOrIndex}"
      end

      qStr
    end

    private

    def raise_if_invalid(aParam)
      raise('invalid parameter') unless aParam.nil? || aParam.is_a?(String) || aParam.is_a?(Integer)
    end
  end
end

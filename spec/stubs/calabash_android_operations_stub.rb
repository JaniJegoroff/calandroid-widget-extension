# rubocop:disable Style/GlobalVars

require 'calabash-android/operations'

# Stub for Calabash
module Calabash
  # Stub for Android
  module Android
    # Stub for Operations
    module Operations
      def query(uiquery, *args)
        $uiquery = uiquery
        $args = args
        $stub_query_response
      end

      def flash(uiquery, *args)
        $uiquery = uiquery
        $args = args
      end

      def touch(uiquery, opts = {})
        $uiquery = uiquery
        $opts = opts
      end
    end
  end
end

# Just for including Calabash::Android::Operations stub
class CalabashAndroidOperationsStubClass
  include Calabash::Android::Operations
end
